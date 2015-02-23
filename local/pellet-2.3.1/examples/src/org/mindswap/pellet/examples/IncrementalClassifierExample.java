// Copyright (c) 2006 - 2008, Clark & Parsia, LLC. <http://www.clarkparsia.com>
// This source code is available under the terms of the Affero General Public
// License v3.
//
// Please see LICENSE.txt for full license terms, including the availability of
// proprietary exceptions.
// Questions, comments, or requests for clarification: licensing@clarkparsia.com

package org.mindswap.pellet.examples;

import org.mindswap.pellet.utils.Timer;
import org.mindswap.pellet.utils.Timers;
import org.semanticweb.owlapi.model.AddAxiom;
import org.semanticweb.owlapi.model.IRI;
import org.semanticweb.owlapi.model.OWLAxiom;
import org.semanticweb.owlapi.model.OWLClass;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyCreationException;
import org.semanticweb.owlapi.model.RemoveAxiom;

import com.clarkparsia.modularity.IncrementalClassifier;
import com.clarkparsia.owlapiv3.OWL;

/**
 * <p>
 * Title: IncrementalClassifierExample
 * </p>
 * <p>
 * Description: This programs shows the usage and performance of the incremental
 * classifier
 * </p>
 * <p>
 * Copyright: Copyright (c) 2008
 * </p>
 * <p>
 * Company: Clark & Parsia, LLC. <http://www.clarkparsia.com>
 * </p>
 * 
 * @author Markus Stocker
 */
public class IncrementalClassifierExample {

	// The ontology we use for classification
	private static final String	file	= "file:examples/data/simple-galen.owl";
	// Don't modify this
	private static final String	NS		= "http://www.co-ode.org/ontologies/galen#";

	public void run() throws OWLOntologyCreationException {
		// Load the ontology file into an OWL ontology object
		OWLOntology ontology = OWL.manager.loadOntology( IRI.create( file ) );

		// Get some entities
		OWLClass headache = OWL.Class( NS + "Headache" );
		OWLClass pain = OWL.Class( NS + "Pain" );
		
		// Get an instance of the incremental classifier
		IncrementalClassifier classifier = new IncrementalClassifier( ontology );

		// We need some timing to show the performance of the classification
		Timers timers = new Timers();

		// We classify the ontology and use a specific timer to keep track of
		// the time required for the classification
		Timer t = timers.createTimer( "First classification" );
		t.start();
		classifier.classify();
		t.stop();
				
		System.out.println( "\nClassification time: " + t.getTotal() + "ms"); 
		System.out.println( "Subclasses of " + pain + ": " + classifier.getSubClasses( pain, true ).getFlattened() + "\n");
		
		// Now create a new OWL axiom, subClassOf(Headache, Pain)
		OWLAxiom axiom = OWL.subClassOf( headache, pain );

		// Add the axiom to the ontology, which creates a change event
		OWL.manager.applyChange( new AddAxiom( ontology, axiom ) );

		// Now we create a second timer to keep track of the performance of the
		// second classification
		t = timers.createTimer( "Second classification" );
		t.start();
		classifier.classify();
		t.stop();
		
		System.out.println( "\nClassification time: " + t.getTotal() + "ms");
		System.out.println( "Subclasses of " + pain + ": " + classifier.getSubClasses( pain, true ).getFlattened() + "\n");

		// Remove the axiom from the ontology, which creates a change event
		OWL.manager.applyChange( new RemoveAxiom( ontology, axiom ) );

		// Now we create a third timer to keep track of the performance of the
		// third classification
		timers.startTimer( "Third classification" );
		classifier.classify();
		timers.stopTimer( "Third classification" );
		
		System.out.println( "\nClassification time: " + t.getTotal() + "ms");
		System.out.println( "Subclasses of " + pain + ": " + classifier.getSubClasses( pain, true ).getFlattened() + "\n");
		
		// Finally, print the timing. As you can see, the second classification
		// takes significantly less time, which is the characteristic of the
		// incremental classifier.
		System.out.println( "Timers summary" );
		for( Timer timer : timers.getTimers() ) {
			if( !timer.isStarted() )
				System.out.println( timer.getName() + ": " + timer.getTotal() + "ms" );
		}
	}

	public static void main(String[] args) throws OWLOntologyCreationException {
		IncrementalClassifierExample app = new IncrementalClassifierExample();
		app.run();
	}

}
