
package org.mindswap.pellet.examples;

import java.awt.Color;
import java.awt.Component;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTree;
import javax.swing.WindowConstants;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeCellRenderer;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.TreeCellRenderer;

import org.mindswap.pellet.jena.PelletInfGraph;
import org.mindswap.pellet.jena.PelletReasonerFactory;

import com.hp.hpl.jena.ontology.OntClass;
import com.hp.hpl.jena.ontology.OntModel;
import com.hp.hpl.jena.ontology.OntResource;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.vocabulary.OWL;

/**
 * An example to show how to use OWLReasoner class. This example creates a JTree that displays the
 * class hierarchy. This is a simplified version of the class tree displayed in SWOOP.
 * 
 * usage: java ClassTree <ontology URI>
 * 
 * @author Evren Sirin
 */
public class ClassTree {
    OntModel model;

    Set<OntResource> unsatConcepts;

    // render the classes using the prefixes from the model
    TreeCellRenderer treeCellRenderer = new DefaultTreeCellRenderer() {
        @SuppressWarnings("unchecked")
		public Component getTreeCellRendererComponent( JTree tree, Object value, boolean sel,
                                                      boolean expanded, boolean leaf, int row,
                                                      boolean hasFocus ) {

            super.getTreeCellRendererComponent( tree, value, sel, expanded, leaf, row, hasFocus );

            DefaultMutableTreeNode node = (DefaultMutableTreeNode) value;

            // each node represents a set of classes
            Set<OntResource> set = (Set) node.getUserObject();
            StringBuffer label = new StringBuffer();

            // a set may contain one or more elements
            if( set.size() > 1 )
                label.append( "[" );
            Iterator<OntResource> i = set.iterator();

            // get the first one and add it to the label
            OntResource first = i.next();
            label.append( model.shortForm( first.getURI() ) );
            // add the rest (if they exist)
            while( i.hasNext() ) {
                OntResource c = i.next();

                label.append( " = " );
                label.append( model.shortForm( c.getURI() ) );
            }
            if( set.size() > 1 )
                label.append( "]" );

            // show unsatisfiable concepts red
            if( unsatConcepts.contains( first ) ) {
                setForeground( Color.RED );
            }

            setText( label.toString() );
            setIcon( getDefaultClosedIcon() );

            return this;
        }

    };

    public ClassTree( String ontology ) throws Exception {
        // create a reasoner
        model = ModelFactory.createOntologyModel( PelletReasonerFactory.THE_SPEC );

        // create a model for the ontology
        System.out.print( "Reading..." );
        model.read( ontology );
        System.out.println( "done" );

        // load the model to the reasoner
        System.out.print( "Preparing..." );
        model.prepare();
        System.out.println( "done" );

        // compute the classification tree
        System.out.print( "Classifying..." );
        ((PelletInfGraph) model.getGraph()).getKB().classify();
        System.out.println( "done" );
    }

    public Set<OntResource> collect( Iterator i ) {
        Set<OntResource> set = new HashSet<OntResource>();
        while( i.hasNext() ) {
            OntResource res = (OntResource) i.next();
            if( res.isAnon() )
                continue;
            
            set.add( res );
        }
        
        return set;
    }

    public JTree getJTree() {
        // Use OntClass for convenience
        OntClass owlThing = model.getOntClass( OWL.Thing.getURI() );
        OntClass owlNothing = model.getOntClass( OWL.Nothing.getURI() );

        // Find all unsatisfiable concepts, i.e classes equivalent
        // to owl:Nothing
        unsatConcepts = collect( owlNothing.listEquivalentClasses() );

        // create a tree starting with owl:Thing node as the root
        DefaultMutableTreeNode thing = createTree( owlThing );

        Iterator<OntResource> i = unsatConcepts.iterator();
        if( i.hasNext() ) {
            // We want to display every unsatisfiable concept as a
            // different node in the tree
            DefaultMutableTreeNode nothing = createSingletonNode( owlNothing );
            // iterate through unsatisfiable concepts and add them to
            // the tree
            while( i.hasNext() ) {
                OntClass unsat = (OntClass) i.next();

                if( unsat.equals( owlNothing ) )
                    continue;
                
                DefaultMutableTreeNode node = createSingletonNode( unsat );
                nothing.add( node );
            }

            // add nothing as a child node to owl:Thing
            thing.add( nothing );
        }

        // create the tree
        JTree classTree = new JTree( new DefaultTreeModel( thing ) );
        classTree.setCellRenderer( treeCellRenderer );

        // expand everything
        for( int r = 0; r < classTree.getRowCount(); r++ )
            classTree.expandRow( r );

        return classTree;
    }

    /**
     * Create a root node for the given concepts and add child nodes for the subclasses. Return null
     * for owl:Nothing
     * 
     * @param concepts
     * @return
     */
    DefaultMutableTreeNode createTree( OntClass cls ) {
        if( unsatConcepts.contains( cls ) )
            return null;

        DefaultMutableTreeNode root = createNode( cls );

        Set processedSubs = new HashSet();
        
        // get only direct subclasses
        Iterator subs = cls.listSubClasses( true );
        while( subs.hasNext() ) {
            OntClass sub = (OntClass) subs.next();
            
            if( sub.isAnon() )
                continue;

            if( processedSubs.contains( sub ) )
                continue;
            
            DefaultMutableTreeNode node = createTree( sub );
            // if set contains owl:Nothing tree will be null
            if( node != null ) {
                root.add( node );
            
                processedSubs.addAll( (Set) node.getUserObject() );
            }
        }

        return root;
    }

    /**
     * Create a TreeNode for the given class
     * 
     * @param entity
     * @return
     */
    DefaultMutableTreeNode createSingletonNode( OntResource cls ) {
        return new DefaultMutableTreeNode( Collections.singleton( cls ) );
    }

    /**
     * Create a TreeNode for the given set of classes
     * 
     * @param entity
     * @return
     */
    DefaultMutableTreeNode createNode( OntClass cls ) {
        Set<OntResource> eqs = collect( cls.listEquivalentClasses() );
        
        return new DefaultMutableTreeNode( eqs );
    }

    public static void main( String[] args ) throws Exception {
        if( args.length == 0 ) {
            System.out.println( "ERROR: No ontology URI given!" );
            System.out.println( "" );
            System.out.println( "usage: java ClassTree <ontology URI>" );
            System.exit( 0 );
        }
        ClassTree tree = new ClassTree( args[0] );

        JFrame frame = new JFrame( "Ontology Hierarchy" );
        frame.getContentPane().add( new JScrollPane( tree.getJTree() ) );
        frame.setSize( 800, 600 );
        frame.setVisible( true );
        frame.setDefaultCloseOperation( WindowConstants.EXIT_ON_CLOSE );
    }
}
