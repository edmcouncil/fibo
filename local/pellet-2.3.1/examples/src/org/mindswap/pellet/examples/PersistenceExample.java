// Copyright (c) 2006 - 2008, Clark & Parsia, LLC. <http://www.clarkparsia.com>
// This source code is available under the terms of the Affero General Public License v3.
//
// Please see LICENSE.txt for full license terms, including the availability of proprietary exceptions.
// Questions, comments, or requests for clarification: licensing@clarkparsia.com

package org.mindswap.pellet.examples;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.semanticweb.owlapi.model.AddAxiom;
import org.semanticweb.owlapi.model.IRI;
import org.semanticweb.owlapi.model.OWLAxiom;
import org.semanticweb.owlapi.model.OWLClass;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyCreationException;

import com.clarkparsia.modularity.IncrementalClassifier;
import com.clarkparsia.modularity.io.IncrementalClassifierPersistence;
import com.clarkparsia.owlapiv3.OWL;

/**
 * <p>
 * Title: PersistenceExample
 * </p>
 * <p>
 * Description: This program shows the usage of the persistence feature in IncrementalClassifier.
 * </p>
 * <p>
 * Copyright: Copyright (c) 2010
 * </p>
 * <p>
 * Company: Clark & Parsia, LLC. <http://www.clarkparsia.com>
 * </p>
 *
 * @author Blazej Bulka
 */
public class PersistenceExample {
	
	// The ontology we use for classification
	private static final String	file	= "file:examples/data/simple-galen.owl";

	// The zip archive that will be created to store the internal data of the incremental classifier
	private static final String persistenceFile = "incrementalClassifierData.zip";
	
	// Don't modify this
	private static final String	NS		= "http://www.co-ode.org/ontologies/galen#";
	
	public void run() throws OWLOntologyCreationException {
		// Load the ontology file into an OWL ontology object
		OWLOntology ontology = OWL.manager.loadOntology( IRI.create( file ) );
		
		// Get an instance of the incremental classifier
		IncrementalClassifier classifier = new IncrementalClassifier( ontology );

		// trigger classification
		classifier.classify();
				
		// persist the current state of the classifier to a file
		try {
			System.out.print( "Saving the state of the classifier to the file ... " );
			System.out.flush();
			
			// open the stream to a file
			FileOutputStream outputStream = new FileOutputStream( persistenceFile );
			
			// write the contents to the stream
			IncrementalClassifierPersistence.save( classifier, outputStream );			
			
			// close stream
			outputStream.close();
			
			System.out.println( "done." );
		} catch( IOException e ) {
			System.out.println( "I/O Error occurred while saving the current state of the incremental classifier: " + e );
			System.exit(1);
		}
		
		
		// The following code introduces a few changes to the ontology, while the internal state of the classifier is stored in a file.
		// Later, the classifier read back from the file will automatically notice the changes, and incrementally apply them
		
		OWLClass headache = OWL.Class( NS + "Headache" );		
		OWLClass pain = OWL.Class( NS + "Pain" );
		
		// Now create a new OWL axiom, subClassOf(Headache, Pain)
		OWLAxiom axiom = OWL.subClassOf( headache, pain );

		// Add the axiom to the ontology
		// The copy of the classifier in memory, will receive the notification about this change.
		// However, the state of the classifier saved to the file will become out-of-sync at this point
		OWL.manager.applyChange( new AddAxiom( ontology, axiom ) );

		
		// Now let's restore the classifier from the saved file
		IncrementalClassifier restoredClassifier = null;
		
		try {
			System.out.print( "Reading the state of the classifier back from the file ... ");
			System.out.flush();
			
			// open the previously saved file
			FileInputStream inputStream = new FileInputStream( persistenceFile );
			
			// restore the classifier from the file
			
			// it is important to provide the ontology here, if we want the classifier to notice the changes that occurred while the
			// state was stored in the file, and incrementally update the classifier's state
			// (IncrementalClassifierPersistence has another "load" method without ontology parameter, which can be used
			// for cases when there is no ontology to compare).
			restoredClassifier = IncrementalClassifierPersistence.load( inputStream, ontology );
			
			// close stream
			inputStream.close();
			System.out.println( "done." );
		} catch( IOException e ) {
			System.out.println( "I/O Error occurred while reading the current state of the incremental classifier: " + e );
			System.exit(1);			
		}
		
		// Now query both of the classifiers for subclasses of "Pain" class. Both of the classifiers will incrementally update their state, and should print
		// the same information
		
		System.out.println( "[Original classifier] Subclasses of " + pain + ": " + classifier.getSubClasses( pain, true ).getFlattened() + "\n");
		System.out.println( "[Restored classifier] Subclasses of " + pain + ": " + restoredClassifier.getSubClasses( pain, true ).getFlattened() + "\n");
		
		// clean up by removing the file containing the persisted state
		File fileToDelete = new File( persistenceFile );
		fileToDelete.delete();	
	}
	
	public static void main(String[] args) throws OWLOntologyCreationException {
		PersistenceExample app = new PersistenceExample();
		app.run();
	}
}
