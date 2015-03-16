// Portions Copyright (c) 2006 - 2008, Clark & Parsia, LLC. <http://www.clarkparsia.com>
// Clark & Parsia, LLC parts of this source code are available under the terms of the Affero General Public License v3.
//
// Please see LICENSE.txt for full license terms, including the availability of proprietary exceptions.
// Questions, comments, or requests for clarification: licensing@clarkparsia.com

package org.mindswap.pellet.examples;

import java.util.Set;

import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.IRI;
import org.semanticweb.owlapi.model.OWLClass;
import org.semanticweb.owlapi.model.OWLDataProperty;
import org.semanticweb.owlapi.model.OWLLiteral;
import org.semanticweb.owlapi.model.OWLNamedIndividual;
import org.semanticweb.owlapi.model.OWLObjectProperty;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyManager;
import org.semanticweb.owlapi.reasoner.Node;
import org.semanticweb.owlapi.reasoner.NodeSet;

import com.clarkparsia.pellet.owlapiv3.PelletReasoner;
import com.clarkparsia.pellet.owlapiv3.PelletReasonerFactory;

/*
 * Created on Oct 10, 2004
 */

/**
 * @author Evren Sirin
 */
public class OWLAPIExample {
    public final static void main(String[] args) throws Exception  {
		String file = "http://www.mindswap.org/2004/owl/mindswappers#";
		
		System.out.print("Reading file " + file + "...");
		OWLOntologyManager manager = OWLManager.createOWLOntologyManager();
		OWLOntology ontology = manager.loadOntology(IRI.create(file));

		PelletReasoner reasoner = PelletReasonerFactory.getInstance().createReasoner( ontology );
		System.out.println("done.");
		
		reasoner.getKB().realize();
		reasoner.getKB().printClassTree();
		
		// create property and resources to query the reasoner
		OWLClass Person = manager.getOWLDataFactory().getOWLClass(IRI.create("http://xmlns.com/foaf/0.1/Person"));
		OWLObjectProperty workHomepage = manager.getOWLDataFactory().getOWLObjectProperty(IRI.create("http://xmlns.com/foaf/0.1/workInfoHomepage"));
		OWLDataProperty foafName = manager.getOWLDataFactory().getOWLDataProperty(IRI.create("http://xmlns.com/foaf/0.1/name"));
		
		// get all instances of Person class
		NodeSet<OWLNamedIndividual> individuals = reasoner.getInstances( Person, false);
		for(Node<OWLNamedIndividual> sameInd : individuals) {
			// sameInd contains information about the individual (and all other individuals that were inferred to be the same)
			OWLNamedIndividual ind =  sameInd.getRepresentativeElement();
			
		    // get the info about this specific individual
			Set<OWLLiteral> names = reasoner.getDataPropertyValues( ind, foafName );	    		    		    	
		    NodeSet<OWLClass> types = reasoner.getTypes( ind, true );		    
		    NodeSet<OWLNamedIndividual> homepages = reasoner.getObjectPropertyValues( ind, workHomepage );
		    
		    // we know there is a single name for each person so we can get that value directly
		    String name = names.iterator().next().getLiteral();
			System.out.println( "Name: " + name );
		    
			// at least one direct type is guaranteed to exist for each individual 
		    OWLClass type = types.iterator().next().getRepresentativeElement();
			System.out.println( "Type:" + type );
		    
		    // there may be zero or more homepages so check first if there are any found
			if( homepages.isEmpty() ) {
				System.out.print( "Homepage: Unknown" );
			}
			else {
				System.out.print( "Homepage:" );
				for( Node<OWLNamedIndividual> homepage : homepages ) {
					System.out.print( " " + homepage.getRepresentativeElement().getIRI() );
				}
			}
		    System.out.println();
		    System.out.println();
		}
	}
}
