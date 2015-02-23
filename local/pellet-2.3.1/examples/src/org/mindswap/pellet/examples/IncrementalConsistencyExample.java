// Copyright (c) 2006 - 2008, Clark & Parsia, LLC. <http://www.clarkparsia.com>
// This source code is available under the terms of the Affero General Public License v3.
//
// Please see LICENSE.txt for full license terms, including the availability of proprietary exceptions.
// Questions, comments, or requests for clarification: licensing@clarkparsia.com

package org.mindswap.pellet.examples;

import org.mindswap.pellet.KnowledgeBase;
import org.mindswap.pellet.PelletOptions;
import org.mindswap.pellet.jena.PelletInfGraph;
import org.mindswap.pellet.jena.PelletReasonerFactory;
import org.mindswap.pellet.utils.ATermUtils;
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.AddAxiom;
import org.semanticweb.owlapi.model.IRI;
import org.semanticweb.owlapi.model.OWLClass;
import org.semanticweb.owlapi.model.OWLDataFactory;
import org.semanticweb.owlapi.model.OWLNamedIndividual;
import org.semanticweb.owlapi.model.OWLObjectProperty;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyManager;

import aterm.ATermAppl;

import com.clarkparsia.pellet.owlapiv3.PelletReasoner;
import com.hp.hpl.jena.ontology.Individual;
import com.hp.hpl.jena.ontology.OntModel;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.rdf.model.Property;
import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.rdf.model.Resource;

/**
 * An example program that incrementally checks consistency through additions to
 * the ABox. The example demonstrates the necessary flags that need to be set,
 * which enable the incremental consistency checking service. Currently the
 * incremental consistency checking service can  be used through
 * the Pellet, Jena and OWL APIs. The example loads an ontology, makes ABox
 * changes and incrementally performs consistency checks.
 * 
 * @author Christian Halaschek-Wiener
 */
public class IncrementalConsistencyExample {
	// namespaces that will be used
	static final String	foaf			= "http://xmlns.com/foaf/0.1/";

	static final String	mindswap		= "http://www.mindswap.org/2003/owl/mindswap#";

	static final String	mindswappers	= "http://www.mindswap.org/2004/owl/mindswappers#";

	public static void main(String[] args) throws Exception {

		// Set flags for incremental consistency
		PelletOptions.USE_COMPLETION_QUEUE = true;
		PelletOptions.USE_INCREMENTAL_CONSISTENCY = true;
		PelletOptions.USE_SMART_RESTORE = false;

		runWithPelletAPI();

		runWithOWLAPI();
		
		runWithJenaAPIAndPelletInfGraph();
		
		runWithJenaAPIAndOntModel();
	}

	public static void runWithPelletAPI() {
		System.out.println( "\nResults after applying changes through Pellet API" );
		System.out.println( "-------------------------------------------------" );

		// read the ontology with its imports
		OntModel model = ModelFactory.createOntologyModel( PelletReasonerFactory.THE_SPEC );
		model.read( mindswappers );

		// load the model to the reasoner
		model.prepare();

		// Get the KnolwedgeBase object
		KnowledgeBase kb = ((PelletInfGraph) model.getGraph()).getKB();

		// perform initial consistency check
		long s = System.currentTimeMillis();
		boolean consistent = kb.isConsistent();
		long e = System.currentTimeMillis();
		System.out.println( "Consistent? " + consistent + " (" + (e - s) + "ms)" );

		// peform ABox addition which results in a consistent KB
		ATermAppl concept = ATermUtils.makeTermAppl( mindswap + "GraduateStudent" );
		ATermAppl individual = ATermUtils.makeTermAppl( mindswappers + "JohnDoe" );
		kb.addIndividual( individual );
		kb.addType( individual, concept );

		// perform incremental consistency check
		s = System.currentTimeMillis();
		consistent = kb.isConsistent();
		e = System.currentTimeMillis();
		System.out.println( "Consistent? " + consistent + " (" + (e - s) + "ms)" );

		// peform ABox addition which results in an inconsistent KB
		ATermAppl role = ATermUtils.makeTermAppl( foaf + "mbox" );
		individual = ATermUtils.makeTermAppl( mindswappers + "Christian.Halaschek" );
		ATermAppl mbox = ATermUtils.makeTermAppl( "mailto:kolovski@cs.umd.edu" );
		kb.addPropertyValue( role, individual, mbox );

		// perform incremental consistency check
		s = System.currentTimeMillis();
		consistent = kb.isConsistent();
		e = System.currentTimeMillis();
		System.out.println( "Consistent? " + consistent + " (" + (e - s) + "ms)" );
	}

	public static void runWithOWLAPI() throws Exception {
		System.out.println( "\nResults after applying changes through OWL API" );
		System.out.println( "----------------------------------------------" );

		// read the ontology
		OWLOntologyManager manager = OWLManager.createOWLOntologyManager();
		OWLDataFactory factory = manager.getOWLDataFactory();
		OWLOntology ontology = manager.loadOntology( IRI.create( mindswappers ) );

		// we want a non-buffering reasoner here (a buffering reasoner would not process any additions, until manually refreshed)
		PelletReasoner reasoner = com.clarkparsia.pellet.owlapiv3.PelletReasonerFactory.getInstance().createNonBufferingReasoner( ontology );
		manager.addOntologyChangeListener( reasoner );

		// perform initial consistency check
		long s = System.currentTimeMillis();
		boolean consistent = reasoner.isConsistent();
		long e = System.currentTimeMillis();
		System.out.println( "Consistent? " + consistent + " (" + (e - s) + "ms)" );

		// peform ABox addition which results in a consistent KB
		OWLClass concept = factory.getOWLClass( IRI.create( mindswap + "GraduateStudent" ) );
		OWLNamedIndividual individual = factory
				.getOWLNamedIndividual( IRI.create( mindswappers + "JohnDoe" ) );
		manager.applyChange( new AddAxiom( ontology, factory.getOWLClassAssertionAxiom( concept, individual ) ) );

		// perform incremental consistency check
		s = System.currentTimeMillis();
		consistent = reasoner.isConsistent();
		e = System.currentTimeMillis();
		System.out.println( "Consistent? " + consistent + " (" + (e - s) + "ms)" );

		// peform ABox addition which results in an inconsistent KB
		OWLObjectProperty role = factory.getOWLObjectProperty( IRI.create( foaf + "mbox" ) );
		individual = factory.getOWLNamedIndividual( IRI.create( mindswappers + "Christian.Halaschek" ) );
		OWLNamedIndividual mbox = factory.getOWLNamedIndividual( IRI.create( "mailto:kolovski@cs.umd.edu" ) );
		manager.applyChange( new AddAxiom( ontology, factory.getOWLObjectPropertyAssertionAxiom(
				role, individual, mbox ) ) );

		// perform incremental consistency check
		s = System.currentTimeMillis();
		consistent = reasoner.isConsistent();
		e = System.currentTimeMillis();
		System.out.println( "Consistent? " + consistent + " (" + (e - s) + "ms)" );
	}
	
	
	public static void runWithJenaAPIAndPelletInfGraph() {
		System.out.println( "\nResults after applying changes through Jena API using PelletInfGraph" );
		System.out.println( "-------------------------------------------------" );

		// read the ontology using model reader
		OntModel model = ModelFactory.createOntologyModel( PelletReasonerFactory.THE_SPEC );
		model.setStrictMode( false );
		model.read( mindswappers );
		
		//get the PelletInfGraph object
		PelletInfGraph pelletJenaGraph = ( PelletInfGraph )model.getGraph();
		
		// perform initial consistency check
		long s = System.currentTimeMillis();
		boolean consistent = pelletJenaGraph.isConsistent();
		long e = System.currentTimeMillis();
		System.out.println( "Consistent? " + consistent + " (" + (e - s) + "ms)" );

		// perform ABox addition which results in a consistent KB
		Resource concept = model.getResource( mindswap + "GraduateStudent" );
		Individual individual = model.createIndividual( mindswappers + "JohnDoe", concept );

		// perform incremental consistency check
		s = System.currentTimeMillis();
		consistent = pelletJenaGraph.isConsistent();
		e = System.currentTimeMillis();
		System.out.println( "Consistent? " + consistent + " (" + (e - s) + "ms)" );

		// perform ABox addition which results in an inconsistent KB
		Property role = model.getProperty( foaf + "mbox" );
		individual = model.getIndividual( mindswappers + "Christian.Halaschek" );
		RDFNode mbox = model.getIndividual( "mailto:kolovski@cs.umd.edu" );
		individual.addProperty( role, mbox );

		// perform incremental consistency check
		s = System.currentTimeMillis();
		consistent = pelletJenaGraph.isConsistent();
		e = System.currentTimeMillis();
		System.out.println( "Consistent? " + consistent + " (" + (e - s) + "ms)" );
	}


	public static void runWithJenaAPIAndOntModel() {
		System.out.println( "\nResults after applying changes through Jena API using OntModel" );
		System.out.println( "-------------------------------------------------" );

		// read the ontology using model reader
		OntModel model = ModelFactory.createOntologyModel( PelletReasonerFactory.THE_SPEC );
		model.setStrictMode( false );
		model.read( mindswappers );
				
		// perform initial consistency check
		long s = System.currentTimeMillis();
		model.prepare();
		long e = System.currentTimeMillis();
		
		//print time and validation report
		System.out.println( "Total time " + (e - s) + " ms)" );
		JenaReasoner.printIterator( model.validate().getReports(), "Validation Results" );

		// perform ABox addition which results in a consistent KB
		Resource concept = model.getResource( mindswap + "GraduateStudent" );
		Individual individual = model.createIndividual( mindswappers + "JohnDoe", concept );

		// perform incremental consistency check
		s = System.currentTimeMillis();
		model.prepare();
		e = System.currentTimeMillis();

		//print time and validation report
		System.out.println( "Total time " + (e - s) + " ms)" );
		JenaReasoner.printIterator( model.validate().getReports(), "Validation Results" );

		// perform ABox addition which results in an inconsistent KB
		Property role = model.getProperty( foaf + "mbox" );
		individual = model.getIndividual( mindswappers + "Christian.Halaschek" );
		RDFNode mbox = model.getIndividual( "mailto:kolovski@cs.umd.edu" );
		individual.addProperty( role, mbox );

		// perform incremental consistency check
		s = System.currentTimeMillis();
		model.prepare();
		e = System.currentTimeMillis();

		//print time and validation report
		System.out.println( "Total time " + (e - s) + " ms)" );
		JenaReasoner.printIterator( model.validate().getReports(), "Validation Results" );
	}

	
}
