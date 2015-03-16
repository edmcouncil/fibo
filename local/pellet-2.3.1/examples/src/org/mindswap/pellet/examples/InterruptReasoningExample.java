package org.mindswap.pellet.examples;
import org.mindswap.pellet.PelletOptions;
import org.mindswap.pellet.exceptions.TimeoutException;
import org.mindswap.pellet.jena.PelletInfGraph;
import org.mindswap.pellet.jena.PelletReasonerFactory;
import org.mindswap.pellet.utils.Timers;

import com.clarkparsia.pellet.sparqldl.jena.SparqlDLExecutionFactory;
import com.hp.hpl.jena.ontology.OntModel;
import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QueryFactory;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.query.ResultSetFormatter;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.rdf.model.Resource;
import com.hp.hpl.jena.rdf.model.ResourceFactory;
import com.hp.hpl.jena.util.iterator.ExtendedIterator;

/**
 * <p>
 * Title:
 * </p>
 * <p>
 * Description: an example program that shows how different reasoning services
 * provided by Pellet can be interrupted based on a user-defined timeout without
 * affecting subsequent query results. The program defines some constant values for 
 * timeout definitions to demonstrate various different things but results may vary 
 * on different computers based on CPU speed, available memory, etc.
 * </p>
 * <p>
 * Sample output from this program looks like this:
 * <pre>
 * Parsing the ontology...finished
 *
 * Consistency Timeout: 5000ms
 * Checking consistency...finished in 1965
 *
 * Classify Timeout: 50000ms
 * Classifying...finished in 12668ms
 * Classified: true
 *
 * Realize Timeout: 1000ms
 * Realizing...interrupted after 1545ms
 * Realized: false
 *
 * Query Timeout: 0ms
 * Retrieving instances of AmericanWine...completed in 484ms (24 results)
 * Running SPARQL query...completed in 11801ms (23 results)
 *
 * Query Timeout: 200ms
 * Retrieving instances of AmericanWine...interrupted after 201ms
 * Running SPARQL query...interrupted after 201ms
 *
 * Query Timeout: 2000ms
 * Retrieving instances of AmericanWine...completed in 417ms (24 results)
 * Running SPARQL query...interrupted after 2001ms
 *
 * Query Timeout: 20000ms
 * Retrieving instances of AmericanWine...completed in 426ms (24 results)
 * Running SPARQL query...completed in 11790ms (23 results)
 * </pre>
 * 
 * </p>
 * <p>
 * Copyright: Copyright (c) 2008
 * </p>
 * <p>
 * Company: Clark & Parsia, LLC. <http://www.clarkparsia.com>
 * </p>
 * 
 * @author Evren Sirin
 */
public class InterruptReasoningExample {
	// various different constants to control the timeout values. typically
	// it is desirable to set different timeouts for classification and realization
	// since they are done only once and take more time compared to answering
	// queries
	public static class Timeouts {
		// timeout for consistency checking
		public static int	CONSISTENCY	= 5000;

		// timeout for classification
		public static int	CLASSIFY	= 50000;

		// timeout for realization (this value is intentionally 
		// set to a unrealistically small value for demo purposes)
		public static int	REALIZE		= 1000;
	}

	// some constants related to wine ontology including some
	// arbitrary 
	public static class WINE {
		public static final String		NS				= 
			"http://www.w3.org/TR/2003/PR-owl-guide-20031209/wine#";

		public static final Resource	AmericanWine	= 
			ResourceFactory.createResource( NS + "AmericanWine" );
		
		public static final Query	query	= 
			QueryFactory.create( 
				"PREFIX wine: <" + WINE.NS + ">\n" +
				"SELECT * WHERE {\n" +
				"   ?x a wine:RedWine ; \n" +
				"      wine:madeFromGrape ?y \n" + "}" );
	}

	// the Jena model we are using
	private OntModel				model;
	
	// underlying pellet graph
	private PelletInfGraph 			pellet;
	
	// the timers associated with the Pellet KB
	private Timers					timers;

	public static void main(String[] args) throws Exception {
		PelletOptions.USE_CLASSIFICATION_MONITOR = PelletOptions.MonitorType.NONE;
		
		InterruptReasoningExample test = new InterruptReasoningExample();
		
		test.parse();
		
		test.consistency();

		test.classify();

		test.realize();

		test.query();
	}

	public InterruptReasoningExample() {
		// create the Jena model
		model = ModelFactory.createOntologyModel( PelletReasonerFactory.THE_SPEC );

		pellet = (PelletInfGraph) model.getGraph();

		// get the underlying Pellet timers
		timers = pellet.getKB().timers;

		// set the timeout for main reasoning tasks
		timers.createTimer( "complete" ).setTimeout( Timeouts.CONSISTENCY );
		timers.createTimer( "classify" ).setTimeout( Timeouts.CLASSIFY );
		timers.createTimer( "realize" ).setTimeout( Timeouts.REALIZE );
	}
	
	// read the data into a Jena model
	public void parse() {
		System.out.print( "Parsing the ontology..." );

		model.read( "file:test/data/modularity/wine.owl" );

		System.out.println( "finished" );
		System.out.println();
	}
	
	// check the consistency of data. this function will throw a TimeoutException
	// we don't catch the exception here because there is no point in continuing 
	// if the initial consistency check is not finished. Pellet will not be able 
	// to perform any reasoning steps if it dannot check the consistency.
	public void consistency() throws TimeoutException {
		System.out.println( "Consistency Timeout: " + Timeouts.CONSISTENCY + "ms" );
		System.out.print( "Checking consistency..." );
		
		model.prepare();

		System.out.println( "finished in " + timers.getTimer( "isConsistent").getLast() );
		System.out.println();
	}

	// classify the ontology
	public void classify() {
		System.out.println( "Classify Timeout: " + Timeouts.CLASSIFY + "ms" );
		System.out.print( "Classifying..." );

		try{
			((PelletInfGraph) model.getGraph()).classify();
			System.out.println( "finished in " + timers.getTimer( "classify" ).getLast() + "ms" );
		} catch( TimeoutException e ) {
			System.out.println( "interrupted after " + timers.getTimer( "classify" ).getElapsed() + "ms" );
		}
		
		System.out.println( "Classified: " + pellet.isClassified()  );
		System.out.println();
	}

	public void realize() {
		// realization can only be done if classification is completed
		if( !pellet.isClassified() )
			return;
		
		System.out.println( "Realize Timeout: " + Timeouts.REALIZE + "ms" );
		System.out.print( "Realizing..." );

		try{
			pellet.realize();
			System.out.println( "finished in " + timers.getTimer( "realize" ).getLast() + "ms" );
		} catch( TimeoutException e ) {
			System.out.println( "interrupted after " + timers.getTimer( "realize" ).getElapsed() + "ms" );
		}
		
		System.out.println( "Realized: " + pellet.isRealized()  );	
		System.out.println();
	}

	// run some sample queries with different timeouts
	public void query() {
		// different timeout values in ms for querying (0 means no timeout)
		int[] timeouts = { 0, 200, 2000, 20000 };
		
		for( int timeout : timeouts ) {
			// update the timeout value
			timers.mainTimer.setTimeout( timeout );
			System.out.println( "Query Timeout: " + timeout + "ms" );
			
			// run the queries
			getInstances( WINE.AmericanWine );
			execQuery( WINE.query );

			System.out.println();
		}
	}

	public void getInstances(Resource cls) {
		System.out.print( "Retrieving instances of " + cls.getLocalName() + "..." );

		// we need to restart the timer every time because timeouts are checked
		// w.r.t. the time a timer was started. not resetting the timer will
		// cause timeout exceptions nearly all the time
		timers.mainTimer.restart();

		try {
			// run a simple query using Jena interface
			ExtendedIterator results = model.listIndividuals( cls );
			
			// print if the query succeeded
			int size = results.toList().size();
			System.out.print( "completed in " + timers.mainTimer.getElapsed() + "ms" );
			System.out.println(" (" + size + " results)" );
		} catch( TimeoutException e ) {
			System.out.println( "interrupted after " + timers.mainTimer.getElapsed() + "ms" );
		}
	}

	public void execQuery(Query query) {
		System.out.print( "Running SPARQL query..." );
		
		// we need to restart the timer as above
		timers.mainTimer.restart();

		try {
			// run the SPARQL query
			ResultSet results = SparqlDLExecutionFactory.create( query, model ).execSelect();
			
			int size = ResultSetFormatter.consume( results );
			System.out.print( "completed in " + timers.mainTimer.getElapsed() + "ms" );
			System.out.println(" (" + size + " results)" );
		} catch( TimeoutException e ) {
			System.out.println( "interrupted after " + timers.mainTimer.getElapsed() + "ms" );
		}
	}
}
