<template>
  <div class="container">
    <main>
      <article>
        <h1>
          <span>Fibo Ontology</span>
        </h1>
        <h2>
          The FIBO ontology is best viewed using a dedicated ontology tool. We include instructions here for three
          popular tools,
          <a
            href="http://protege.stanford.edu/"
          >Prot&eacute;g&eacute;</a>,
          <a
            href="http://www.topquadrant.com/tools/IDE-topbraid-composer-maestro-edition/"
          >TopBraid Composer</a> and
          <a
            href="https://www.nomagic.com/product-addons/magicdraw-addons/cameo-concept-modeler-plugin"
          >
            CCM (Cameo
            Concept Modeler)
          </a>. For each of these tools, the
          <i>Production</i> and
          <i>Development</i> versions of FIBO
          are available. See below for detailed instructions for loading FIBO in each of these tools.
        </h2>

        <h3>Using FIBO</h3>
        <p>
          The FIBO Ontology is available online using the
          <a
            href="http://patterns.dataincubator.org/book/follow-your-nose.html"
          >
            <i>follow-your-nose</i>
          </a> pattern.
          This means that tools that use this pattern can read FIBO directly from the web.
          This ensures that you are always viewing the latest version of FIBO.
          Keep in mind, that when viewing FIBO in this way, that any edits you make to FIBO will only be reflected in your copy, and won't be saved for others to see.
        </p>
        <p>
          FIBO is also available for offline use by downloading a .zip of the current state.
          FIBO is updated every three months, so any such offline downloaded version will quickly be out of date.
        </p>
        <h3>NEW in 2019 Q1</h3>

        <ul>
          <li>
            FIBO
            <i>Quickstart</i> (see
            <a href="#quickstart">below</a>)
          </li>
          <li>
            FIBO Namespace Prefixes (see
            <a href="#namespace">below</a>)
          </li>
        </ul>
        <h3>Collaborations</h3>
        <p>
          The EDM Council is working in collaboration with many companies to offer open, easy access to FIBO content for discovery and analysis. Available now are:
        </p>
        <ul>
          <li>
            <a href="http://fibosearch.adaptive.com/">Adaptive</a>
          </li>
          <li>
            <a href="http://www.nomagic.com/magicfibo">NoMagic</a>
          </li>
          <li>
            <a href="http://www.stardog.com/">Stardog</a>
          </li>
          <li>
            <a href="http://www.topquadrant.com/fibo/">TopQuadrant</a>
          </li>
          <li>
            <a href="http://data.world/">data.world</a>
          </li>
        </ul>
        <h3>FIBO Quickstart</h3>
        <p>
          FIBO content is available in a single file, that can be loaded into an ontology
          tool or into a database. The
          <i>FIBO Quickstart</i> does not include all the content structuring of FIBO,
          but
          does include all the
          content.
          <i>FIBO Quickstart</i> is most appropriate for read-only applications of FIBO and for users who are
          new to FIBO and are
          evaluating it.
        </p>
        <h3>Using quickstart in Prot&eacute;g&eacute;</h3>
        <p>
          Quickstart is currently only available in
          <a
            href="https://www.w3.org/TR/turtle/"
          >RDF Turtle(.ttl)</a> and
          <a href="https://www.w3.org/TR/n-triples/">N-Triples(.nt)</a>. More formats coming soon.
        </p>
        <ul>
          <li>
            Download either the
            <a
              :href="hrefD('dev.fibo-quickstart.ttl','ontology')"
              v-on:click="outboundClick('dev.fibo-quickstart.ttl')"
            >Development</a>
            or
            <a
              :href="hrefP('prod.fibo-quickstart.ttl','ontology')"
              v-on:click="outboundClick('prod.fibo-quickstart.ttl')"
            >Production</a>
            version of Quickstart.
          </li>
          <li>From the Protege menu, Choose "Open", and navigate to where you downloaded the file.</li>
        </ul>
        <h3>Using quickstart in TopBraid Composer</h3>
        <ul>
          <li>
            Download either the
            <a
              :href="hrefD('dev.fibo-quickstart.ttl','ontology')"
              v-on:click="outboundClick('dev.fibo-quickstart.ttl')"
            >Development</a>
            or
            <a
              :href="hrefP('prod.fibo-quickstart.ttl','ontology')"
              v-on:click="outboundClick('prod.fibo-quickstart.ttl')"
            >Production</a>
            version of Quickstart.
          </li>
          <li>
            Open TopBraid Composer. Create a project (File>New>Project) called
            <i>spec.edmcouncil.org</i>.
          </li>
          <li>Drag and drop the file into your the project you just created</li>
          <li>Double-click the file you just dropped in the TopBraid Navigator pane</li>
        </ul>

        <h3>Using FIBO online</h3>
        <p>
          FIBO is published using the Web Ontology Language (<a href="https://www.w3.org/TR/owl-primer/">OWL</a>).
          There are several tools available, both commercial and open-source, that can read and edit FIBO.
          We provide instructions for the most common ones.
        </p>
        <h3>Prot&eacute;g&eacute;</h3>
        <div>
          Please use Prot&eacute;g&eacute; version 5.2 or higher.
          <p>
            <b>NOTE:</b>Recent version of Java can cause Prot&eacute;g&eacute; to exit with an error message (on
            the
            Prot&eacute;g&eacute; console) to the effect "Comparison method violates its general contract!" This is
            an
            incompatibiliy between Prot&eacute;g&eacute; and Java, and has nothing to do with FIBO. If this happens,
            a
            work-around is to add the following to the java call line in the run.bat or run.sh (if you are on
            Windows
            or another platform, respectively):
          </p>
          <pre>
 -Djava.util.Arrays.useLegacyMergeSort=true
</pre>
          <p>
            <a href="http://protege.stanford.edu/">Prot&eacute;g&eacute;</a> is an open-source ontology editor that
            can
            be used to
            view and edit FIBO. Prot&eacute;g&eacute; works well in online mode, so you can point it to an LoadFIBO
            file,
            and it will load the rest.
          </p>
          <ol>
            <li>In Prot&eacute;g&eacute;, select File>Open from URL</li>
            <li>
              Copy and Paste the URL for the LoadFIBO.rdf file from the version you desire;
              <ol>
                <li><a :href="hrefD('LoadFIBODev.rdf','ontology')" v-on:click="outboundClick('LoadFIBODev.rdf')">LoadFIBODev.rdf</a> for the development version or</li>
                <li><a :href="hrefP('LoadFIBOProd.rdf','ontology')" v-on:click="outboundClick('LoadFIBOProd.rdf')">LoadFIBOProd.rdf</a> for the production version</li>
              </ol>


            </li>
          </ol>
          <p>
            Prot&eacute;g&eacute; will find and load all the FIBO files from the currently published version (for the
            selected version).
          </p>
          <h3>TopBraid Composer</h3>
          <p>At the moment, FIBO cannot be loaded online into TopBraid Composer.</p>
          <h3>CCM (Cameo Concept Modeler)</h3>
          <p>At the moment, FIBO cannot be loaded online into CCM.</p>
        </div>
        <h3>Using FIBO offline</h3>Many semantic tools can read OWL files that have been downloaded to local storage. Here are the instructions
        for
        doing that with the most common tools.
        <p />
        <b>NOTE:</b> FIBO imports resources from outside of FIBO, including SKOS, LCC and others. These are not
        included
        in the FIBO download, and must be loaded dynamically from the web. Therefore, even when loading FIBO in
        "offline" mode, you must have an active internet connection.
        <p />
        <h3>Prot&eacute;g&eacute;</h3>
        <div>
          Please use Prot&eacute;g&eacute; version 5.2 or higher.
          <p />
          <a href="http://protege.stanford.edu/">Prot&eacute;g&eacute;</a> prefers to manage files in
          <a href="https://www.w3.org/TR/rdf-syntax-grammar/">RDF/XML</a> format.
          Follow these instructions to download a zip file of FIBO in RDF/XML and load it into Prot&eacute;g&eacute;.
          <ol>
            <li>
              Download a zipped file of FIBO in RDF/XML format from spec.edmcouncil.org. You'll need to specify
              which
              the maturity level of FIBO you want; the
              <a
                :href="hrefD('dev.rdf.zip','ontology')"
                v-on:click="outboundClick('dev.rdf.zip')"
              >Development</a> version or
              the
              <a
                :href="hrefP('prod.rdf.zip','ontology')"
                v-on:click="outboundClick('prod.rdf.zip')"
              >Production</a>
              version.
            </li>
            <li>
              Unzip this to your hard drive. This creates a single directory called
              <i>fibo</i>, with all of the
              FIBO
              ontologies in subdirectories.
            </li>
            <li>Open Prot&eacute;g&eacute;.</li>
            <li>
              Select File>Open, and navigate to the folder where you unzipped FIBO.
              Navigate (three levels down; typically {{hrefD('','ontology').replace(/^.*\/([^\/]*)\/([^\/]*)\/([^\/]*)$/g, "$1/$2/$3")}} or {{hrefP('','ontology').replace(/^.*\/([^\/]*)\/([^\/]*)\/([^\/]*)$/g, "$1/$2/$3")}}) to
              LoadFIBODev.rdf or LoadFiboProd.rdf (development and production, respectively), and select it.
            </li>
            <li>Protege will open all relevant FIBO files.</li>
          </ol>
        </div>
        <h3>
          <a
            href="http://www.topquadrant.com/tools/IDE-topbraid-composer-maestro-edition/"
          >TopBraid Composer</a>
        </h3>
        <p>
          TopBraid Composer prefers to manage files in
          <a
            href="https://www.w3.org/TR/turtle/"
          >RDF Turtle</a> format.
          Follow these instructions to download a zip file of FIBO in Turtle and load it into TopBraid:
        </p>
        <ol>
          <li>
            Download a zipped file of FIBO in Turtle from spec.edmcouncil.org. You'll need to specify which
            maturity
            level of FIBO you want; the
            <a
              :href="hrefD('dev.ttl.zip','ontology')"
              v-on:click="outboundClick('dev.ttl.zip')"
            >Development</a>
            version or the
            <a
              :href="hrefP('prod.ttl.zip','ontology')"
              v-on:click="outboundClick('prod.ttl.zip')"
            >Production</a> version.
          </li>
          <li>
            Unzip this on your hard drive. This creates a single directory called
            <i>fibo</i>, with all of the
            FIBO ontologies in subdirectories.
          </li>
          <li>
            Open TopBraid Composer. Create a project (File>New>Project) called
            <i>spec.edmcouncil.org</i>.
          </li>
          <li>
            Drag and drop the
            <i>fibo</i> directory from your filesystem onto the project
            <i>spec.edmcouncil.org</i>
            in the TopBraid Composer Navigator pane. If prompted, select "Copy files"
          </li>
          <li>
            Navigate through the fibo directory in the Navigator pane to
            {{hrefD('LoadFIBODev.ttl','ontology').substring(1)}}
            or {{hrefD('LoadFIBOProd.ttl','ontology').substring(1)}} (development and production, respectively) Double-click
            on
            LoadFIBO.ttl to open all FIBO files.
          </li>
        </ol>
        <h3>No Magic CCM Cameo Concept Modeler</h3>
        <p>
          <a
            href="https://www.nomagic.com/product-addons/magicdraw-addons/cameo-concept-modeler-plugin"
          >
            CCM (Cameo
            Concept Modeler)
          </a>
          imports both the RDF/XML and Turtle TTL formats, and pulls the ontology into a 'UML-like' model of the
          ontology, which is then ready to use.
        </p>
        <ol>
          <li>
            Download a zipped file of FIBO in RDF/XML format from spec.edmcouncil.org. You'll need to specify
            which maturity level of FIBO you want; the
            <a
              :href="hrefD('dev.rdf.zip','ontology')"
              v-on:click="outboundClick('dev.rdf.zip')"
            >Development</a> version
            or
            the
            <a
              :href="hrefP('prod.rdf.zip','ontology')"
              v-on:click="outboundClick('prod.rdf.zip')"
            >Production</a>
            version.
          </li>
          <li>
            Unzip this to your hard drive. This creates a single directory called fibo, with all of the FIBO
            ontologies in subdirectories.
          </li>
          <li>Open MagicDraw with the CCM plugin installed.</li>
          <li>
            In MagicDraw, create a new project: File/New Project. Select "Concept Modeling Project" as the project type. Select a name for the project and click "OK".
          </li>
          <li>
            Set the catalog file; from the
            <i>Options</i> menu, select
            <i>Project</i>. Navigate in the pop-up to
            <i>General/Concept Modeling</i> find the entry for "OWL Import Catalog", and click the three dots at
            the
            right to open a file navigator. Navigate to where you unzipped FIBO, Navigate down the tree until you
            can select the file catalog-v001.xml.
          </li>
          <li>
            Set the Project URI Construction Strategy to "303 URI": from the Options menu, select Project.
            Navigate in the pop-up to General/Concept Modeling, find the entry for "URI Construction Strategy",
            click the drop down menu at the right and select "303 URI".
          </li>
          <li>
            Import the FIBO Master: File/Import From/OWL Ontology File, and navigate to the folder where you unzipped FIBO. Navigate to LoadFIBODev.rdf, or LoadFIBOProd.ttl, depending on your preference, and import it.
          </li>MagicDraw will import all of FIBO ontologies contained in the LoadFIBO file.
        </ol>
        <p>
          <b>Note:</b> FIBO makes reference to
          <a href="http://www.omg.org/spec/LCC/">
            LCC (Languages, Countries and
            Codes)
          </a>
          from the OMG, which includes information about these things from other standards bodies.
          When you load FIBO, all these tools will find these files via follow-your-nose.
          If you cannot reach these files on the omg.org web servers for any reason, you will see load errors for the files it couldn't find. These can be safely ignored, but you will not have details of the Languages, Countries and
          Codes available in your model.
        </p>
        <h3>Stardog</h3>
        <a href="http://www.stardog.com/">Stardog</a> is a semantic data system that accommodates both RDF and OWL.
        Follow these steps to load FIBO into Stardog:
        <ol>
          <li>
            Download the RDF/XML zip of the
            <a
              :href="hrefD('dev.rdf.zip','ontology')"
              v-on:click="outboundClick('dev.rdf.zip')"
            >Development</a> version or
            the
            <a
              :href="hrefP('prod.rdf.zip','ontology')"
              v-on:click="outboundClick('prod.rdf.zip')"
            >Production</a>
            version
            of FIBO.
          </li>
          <li>
            Open the zip and extract the directory {{hrefD('','ontology').substring(1)}} which will be the subject of the
            remaining instructions
          </li>
          <li>Delete the files matching About*.rdf. You'll delete about 70 files</li>
          <li>Delete the files matching catalog*.xml. You'll delete about 12 files</li>
          <li>
            Open a grep tool (e.g. grepWin or similar) and carry out the following replace operation on the
            directory:
          </li>
          <pre>
File names matching: *.rdf
Search string: {{hrefD('','ontology').substring(1)}}/
Replace string: fibo/ontology/
</pre>It should make replacements in approx. 320 files.
          <li>Zip up the directory e.g. as FIBO.zip.</li>
          <li>
            Use the following command line for database dbX (you would normally need to add username and passwd
            parameters):
            <pre>stardog data add dbX FIBO.zip</pre>
          </li>
        </ol>

        <h3>Adaptive</h3>To load FIBO into
        <a href="http://fibosearch.adaptive.com/">Adaptive</a> (version 8.1 or later), follow the
        first six steps under "Stardog" above. Note that even if you use the Development version Adaptive will
        indicate the status of each item (Release, Provisional or Informative). Then do the following:
        <ol>
          <li>
            Add the file manifest.mf (from the Adaptive installation (a3/installation/FIBO/manifest.mf) into the
            zip
          </li>
          <li>
            In the Adaptive web interface select OWL Zip File Import from the Integrator page; select the file FIBO.zip, check the last item on the page Ignore Unresolved Hrefs, and Execute the import
          </li>
          <li>
            Repeat the previous step to re-import the file and resolve the references (there will still be some unresolved external references unless the Languages Countries and Codes ontology has been previously loaded. This is provided as LCC.zip in the Adaptive installation and is loaded in the same way)
          </li>
        </ol>

        <h3>
          <a name="namespace" />Namespace prefixes in FIBO
        </h3>XML, RDF, and SPARQL all have mechanisms for recording shorthand versions of the long IRI names. FIBO has a
        standard set of prefixes for the resources in FIBO. These are currently incomplete but will be completed shortly.
        <p>
          As an assist for developers using FIBO, we provide the namespace prefixes in many formats,
          <a
            :href="hrefD('prefixes.fibo.ttl','ontology')"
            v-on:click="outboundClick('prefixes.fibo.ttl')"
          >
            prefixes.ttl
            (Turtle)
          </a>,
          <a
            :href="hrefD('prefixes.fibo.sq','ontology')"
            v-on:click="outboundClick('prefixes.fibo.sq')"
          >prefixes.sq (SPARLQ)</a>,
          and
          <a
            :href="hrefD('prefixes.fibo.csv','ontology')"
            v-on:click="outboundClick('prefixes.fibo.csv')"
          >prefixes.csv</a>.
        </p>
      </article>
    </main>
  </div>
</template>


<script>
import helpers from '../store/helpers.js';
import { outboundClick } from '../helpers/ga';

export default {
  extends: helpers,
  name: 'ontology-tools',
  components: {},
  computed: {},
  methods: {
    outboundClick,
  },
};
</script>

<style lang="scss" scoped>
</style>
