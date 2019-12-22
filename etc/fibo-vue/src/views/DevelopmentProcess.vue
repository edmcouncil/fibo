<template>
  <div class="container">
    <main>
      <article>

        <h1>
          <span>Development Process</span>
        </h1>

        <p class="text">
          FIBO is published in a way that allows users from financial institutions, regulators, or even research groups to
          download and use a variety of artifacts.  But people who plan to contribute to FIBO will have to deal with the
          FIBO source and will need to know how to edit it. They will also need to know their way around GitHub and understand
          how to carry out actions such as <i>fork, pull requests</i>.
        </p>

        <h3>FIBO Sources and Products</h3>
        <p class="text">
          FIBO is developed using a familiar process from software engineering, in which a product is developed using source code,
          which is compiled into a product. In most software settings, source code is written in a programming language
          (e.g., Java, C++, or Python), which is compiled into executable code for the product.  FIBO is developed in the same way,
          but the product code is not 'executable' in any normal sense of the word. In fact, the FIBO products can be published in
          the same language as the source (i.e., OWL), so it is easy to be confused when looking at any particular file, whether you
          are looking at source or product.  Management of the FIBO development process follows conventional software engineering
          practices, so the difference between source and product is clear when you think about the process. 
        </p>
        
        <ul class="nolmal-line-height">
          <li>
            FIBO sources are managed in GitHub, in RDF/XML format.  The FIBO products are published in many formats and serializations
            (RDF/XML, ttl, json-ld, csv, MS Excel(tm), SKOS, SMIF, etc.) on the
            <router-link class="" replace :to="{ path: router() }">http://spec.edmcouncil.org/fibo</router-link> web site. 
          </li>
          <li>
            The sources are edited by developers using development tools (which can range in sophistication from text editing tools to elaborate WYSIWYG environments).  Products are automatically produced from an integrated testing environment. 
          </li>
          <li>
            While it is possible to perform certain tests on sources (in most languages, these tests are largely syntactic; in the case of OWL, they can include some semantic completeness and logical correctness tests), official software testing for the development process is done on the products. Just as in classical software engineering, this is necessary, since it is imperative that the product delivered to the customers has itself been tested, not just some source that was used in building it. 
          </li>
          <li>
            The conventional <a href="https://en.wikipedia.org/wiki/Software_release_life_cycle" v-on:click="outboundLinkClick('https://en.wikipedia.org/wiki/Software_release_life_cycle')">Software Release Cycle</a> specifies many possible stages of development for a product.  In FIBO, we only use two of these, which we call DEVELOPMENT (corresponding roughly to Beta in the conventional cycle) and PRODUCTION (corresponding roughly to RC in the conventional cycle).  These stages are described in more detail below as "Publication Maturity Levels"
          </li>
          <li>
            In conventional software development, especially when using a formal version control system like git, there can be many
            versions of the source code.  Some versions are developing new features; some are bug fixes, others are experimental
            versions that will never move forward.  FIBO recognizes three statuses for its source code;
            <strong>Informative</strong>, <strong>Provisional</strong>, and <strong>Release</strong>.
            These statuses are described in more detail below. as "Source Maturity Levels."
          </li>
        </ul>
        
        <h3>GitHub</h3>
        <p class="text">
          The FIBO sources are kept in a repository on GitHub, <a href="https://github.com/edmcouncil" v-on:click="outboundLinkClick('https://github.com/edmcouncil')">https://github.com/edmcouncil</a>.
          As is customary with GitHub, changes to FIBO are made in a fork of the EDMC repository, and these changes are proposed to the
          FIBO Community Group through a pull request. All FIBO Content and Tools are here. You will need a <a href="https://github.com/" v-on:click="outboundLinkClick('https://github.com/')">GitHub</a> user name to
          participate in the development process.  
        </p>
        
        <h3>FIBO Maturity Levels</h3>
        <p class="text">
          FIBO is published in two release levels - a <strong><i>Production</i></strong> level, where every model has passed serious
          scrutiny for consistency, completeness and documentation, and a <strong><i>Development</i></strong> level, where the ontologies have passed
          only minimum scrutiny for referential consistency (basically, an ontology doesn't refer to things which are undefined).
        </p>
        <p class="text">
          FIBO publications are built out of FIBO sources.  FIBO sources have three levels of maturity,
          <strong><i>Informative</i></strong>, <strong><i>Provisional</i></strong> and <strong><i>Release</i></strong>. 
        </p>


        

        <h5>FIBO Source Maturity Levels</h5>
        <p class="">
          <strong><i>Informative</i></strong>
        </p>
        <p class="text">
          Informative ontologies are ones that have been considered by the FIBO Community but have been explicitly rejected.  They are included in FIBO sources because they contain the target of references from Provisional ontologies, without which FIBO would fail the basic referential consistency tests.  FIBO Community should consider these for information only, to determine the detailed meaning of the things that reference them. One aim of development is to replace references to elements in Provisional ontologies to those in Provisional or Release ontologies.
        </p>
        <p class="">
          <strong><i>Provisional</i></strong>
        </p>
        <p class="text">
          Provisional ontologies were developed in the early days of FIBO, and have not undergone the complete review required to be considered Release.  There is a wide range of maturity that fits into Provisional; some have barely been reviewed, others have had a considerable review and are on their way to being Release. 
        </p>
        <p class="">
          <strong><i>Release</i></strong>
        </p>
        <p class="text">
          Release models have undergone extensive unit and integration testing, and have passed the most rigorous tests for completeness, consistency, and correctness.  
        </p>


        <h5>FIBO Publication Maturity Levels</h5>
        <p class="text">
          The FIBO publications are built from sources through a process that involves re-writing URIs to match publication conventions, converting files into multiple standard formats, and triggering derivative products such as the glossary and FIBO-V.
        </p>
        <p class="text">
          The two FIBO publication products are built by combining models from the source maturity levels as follows:
        </p>

        <ul class="nolmal-line-height">
          <li>
            <i>Production</i> is made up of the <i>Release</i> sources only.
          </li>
          <li>
            <i>Development</i> is made up of sources from <i>Release</i>, <i>Provisional</i>, and <i>Informative</i> levels, all combined together. 
          </li>
        </ul>

        <p class="text">
          FIBO Community is working to move ontologies up the maturity ladder.  Specifically, to develop Provisional ontologies to become part of the Release, and to remove reliance on Informative models so that they can be removed entirely. 
        </p>
        

        
        <h5>Indication of Maturity Levels in FIBO sources</h5>
        <p class="text">
          FIBO maturity levels are indicated on an ontology basis; that is, an ontology has a level (Informative, Provisional, Release), not a class or a property (classes and properties have the maturity level of their containing ontology).  The maturity level of an ontology is indicated in the ontology file itself, with a triple in RDF, e.g.,
        </p>
        <p class="text">
          <code>fibo-bp-iss-doc: fibo-fnd-utl-av:hasMaturityLevel fibo-fnd-utl-av:Provisional</code> .
        </p>
        <p class="text">
          The development process could go as follows:
        </p>
        <ul class="nolmal-line-height">
          <li>
            A developer (in his/her local repo) changes the maturity of an ontology from Provisional to Release
          </li>
          <li>
            They make changes to definitions in the ontology (to classes and properties)
          </li>
          <li>
            They test these changes until they are satisfied that the ontology is ready
          </li>
          <li>
            They push the ontologies to GitHub and see what the automated tests say
          </li>
          <li>
            Repeat the previous 3 steps until the tests pass 
          </li>
        </ul>
        
        
        <h5>Contributing to FIBO</h5>
        <p class="text">
          If you want to contribute to FIBO, you'll need to do the following things: 
        </p>
        <ol class="nolmal-line-height">
          <li>
            Create a login for <a href="https://github.com"
                                v-on:click="outboundLinkClick('https://github.com')">github.com</a>.
          </li>
          <li>
            Make sure you have java installed; see <a href="https://www.oracle.com/technetwork/java/javase/downloads/index.html"
                                                        v-on:click="outboundLinkClick('https://www.oracle.com/technetwork/java/javase/downloads/index.html')">https://www.oracle.com/technetwork/java/javase/downloads/index.html</a>, if you need to download java.
          </li>
          <li>
            Install a git client.  In FIBO, we recommend Sourcetree from Atlassian (<a href="https://www.sourcetreeapp.com/"
                                                        v-on:click="outboundLinkClick('https://www.sourcetreeapp.com/')">https://www.sourcetreeapp.com/</a>)
          </li>
          <li>
            Make a "fork" of the "fibo" repository at <a href="https://github.com/edmcouncil/fibo"
                                                        v-on:click="outboundLinkClick('https://github.com/edmcouncil/fibo')">https://github.com/edmcouncil/fibo</a>.
            Clone your fork to your local repository.
          </li>
          <li>
            Install FIBO serialization tools (see below). This is important so that your code can be compared and merged with code from other contributors. You cannot submit a pull request to the fibo repository without this step. 
          </li>
          <li>
            Install the local testing tools (see below). This will allow you to process FIBO with the most common semantic web editing tools.
          </li>
          <li>
            Edit FIBO using the RDF/OWL editor of your choice (Protégé, TopBraid, MagicDraw CCM, VOM, Cognitum Fluent Editor, etc. ).
          </li>
          <li>
            Submit a Pull Request to the EDMCouncil.
          </li>
        </ol>
        <p class="text">
          You only have to do steps 1-6 once. Once you have begun contributing, you just repeat steps 7 and 8. 
        </p>
        
        
        <h5>FIBO Serialization tools</h5>
        <p class="text">
          When you cloned your fork to your local repository, you chose a directory in which FIBO resides.  This is your fibo installation directory. In order to use the FIBO Serialization tools, you will need two files, a pre-commit hook file and a Java application file called RDF Toolkit. These need to reside in a directory called /hooks under your local Git working directory, called .git; the instructions below should be followed in order to ensure that you have the latest versions of these files in their intended locations.
        </p>
        <ul class="nolmal-line-height">
          <li>
            In your FIBO installation directory, there is a directory called “.git”, and a folder in there called “hooks”.  This folder should have been created for you when you cloned the repository; if not, you can initialize your repository from the Git command line by changing directory to your fibo installation directory and typing: git init
          </li>
          <li>
            The Git command line can be run from within the SourceTree tool by selecting "Open in terminal" from the Actions menu.
            Alternatively, you may set up a Git shell environment – see separate page
            ‘<a href="https://wiki.edmcouncil.org/display/INFRA/Setting+up+a+Git+Shell"
              v-on:click="outboundLinkClick('https://wiki.edmcouncil.org/display/INFRA/Setting+up+a+Git+Shell')">Setting up the Git Shell</a>’ for details.
          </li>
          <li>
            Running the initialization command should ensure that your .git environment exists and that it includes the /hooks directory. This does not automatically install or update the two files that you need to have in place for the Serializer to work. These are: 
            <ul class="space-at-top">
              <li>pre-commit (no file extension)</li>
              <li>rdf-toolkit.jar</li>
            </ul>
          </li>
          <li>
            These files are updated from time to time so it is recommended that you re-download these directly from the links below before proceeding.
          </li>
          <li>
            Copy the file <a href="https://raw.githubusercontent.com/edmcouncil/rdf-toolkit/master/etc/git-hook/pre-commit"
            v-on:click="outboundLinkClick('https://raw.githubusercontent.com/edmcouncil/rdf-toolkit/master/etc/git-hook/pre-commit')">pre-commit</a> to your hooks directory (use right-click on the link and select the save option).  Make sure that the name of the file is just pre-commit; your browser might want to append a suffix like .txt to it. 
          </li>
          <li>
            Edit this pre-commit file to point to your Java JRE/JDK. To do this, open the pre-commit file in a text editor and search for “JAVA_HOME”. Edit the directory after JAVA_HOME= to point to the location of your Java 8 (a.k.a version 1.8) or higher JRE/JDK, and save it. 
          </li>
          <li>
            Copy the file <a href="https://jenkins.edmcouncil.org/job/rdf-toolkit-build/lastSuccessfulBuild/artifact/target/scala-2.12/rdf-toolkit.jar"
                            v-on:click="outboundClick('https://jenkins.edmcouncil.org/job/rdf-toolkit-build/lastSuccessfulBuild/artifact/target/scala-2.12/rdf-toolkit.jar')">rdf-toolkit.jar</a> to your hooks directory by clicking on the link, viewing where the download was saved, and moving or copying it to the .git/hooks directory. 
          </li>
        </ul>

        <p class="text">
          Once you have installed these two files, every commit you do will re-write your RDF/OWL files in a consistent way that can be compared and merged with work done by other FIBO collaborators. 
        </p>
        <p class="text">
          You can test Your Installation with the following steps.  These steps assume you are using Sourcetree, so adjust them to your own git installation:
        </p>
        <ul class="nolmal-line-height">
          <li>
            Create a branch of the FIBO repository (in Sourcetree, click the "branch" icon).  Name your branch SerializerTest.
          </li>
          <li>
            In a text editor, open the file fibo/BE/LegalEntities/LegalPersons.rdf
          </li>
          <li>
            Find the definition of LegalPerson in this file; it looks like this: &lt;owl:Class rdf:about="&amp;fibo-be-le-lp;LegalPerson"&gt;
          </li>
          <li>
            A few lines later, notice a line that contains <i>&amp;fibo-fnd-law-lcap;hasCapacity</i>.
            It is a few lines after a line that contains <i>fibo-be-le-lp;isRecognizedIn</i>.
          </li>
          <li>
            change <i>&amp;fibo-fnd-law-lcap;hasCapacity</i> to <i>&amp;fibo-be-le-lp;isCapableOf</i> . Save the file. 
          </li>
          <li>
            Commit the file to your branch.  In Sourcetree, select LegalPersons.rdf in the staging area, then "Stage Selected", then click "Commit" in the upper left.  Enter a comment (e.g., "Test serialization"), and click "commit" in the lower right.   Make sure that the toggle "Push changes immediately ..." is unselected. 
          </li>
          <li>
            Examine LegalPersons.rdf,  It should have changed since you saved in a few steps ago.  Verify that your new line, with 
            <i>&amp;fibo-be-le-lp;isCapableOf</i> now appears before the line with <i>fibo-be-le-lp;isRecognizedIn</i> .
          </li>
          <li>
            Return to the branch you were working on before this test (in Sourcetree, double-click in the left pane on, e.g., "master"). 
          </li>
          <li>
            Delete branch SerializerTest.  (in Sourcetree, right-click on the branch in the left pane, and select "delete".  You might have to enable "Force delete" to make it work correctly. 
          </li>
        </ul>


        <h5>Local Testing tools</h5>
        <p class="text">
          FIBO developers are accustomed to using desktop tools like Protégé, TopBraid Composer, VOM, and MagicDraw/CCM.  These tools include a variety of tests that experienced users rely on to determine the correctness of their models. In order to satisfy themselves that the ontologies are correct, they need to be able to test the same configuration of ontologies that will be published (i.e., Production and Development, see above).  
        </p>
        <p class="text">
          In order to make this possible on their local machine, developers need to be able to load just the Release ontologies (from their current testbed).  This is done by creating a file called AboutProd.ttl (also AboutProd.rdf).  Developers working with the pre-release files will want to load all FIBO files; this is done with a file called AboutDev.ttl (also AboutDev.rdf).  These "About" files load the same files that are loaded by the publishing process of FIBO (for Prod and Dev, respectively).  
        </p>
        <p class="text">
          Some tools (e.g., Protégé and CCM) use catalog files to manage the file loading.  These can also be automatically created. 
        </p>
        <p class="text">
          To perform local testing, do the following steps:
        </p>
        <ol class="nolmal-line-height">
          <li>
            Make sure you can run a Bash shell.  Windows now has a native Bash shell (Windows 10).  One is also available as part of SourceTree. 
          </li>
          <li>
            Download the FIBO tools from
            <a href="https://jenkins.edmcouncil.org/job/fibo-infra-publish/lastSuccessfulBuild/artifact/jenkins/bin/dev_toolkit.zip"
               v-on:click="outboundClick('https://jenkins.edmcouncil.org/job/fibo-infra-publish/lastSuccessfulBuild/artifact/jenkins/bin/dev_toolkit.zip')">https://jenkins.edmcouncil.org/job/fibo-infra-publish/lastSuccessfulBuild/artifact/jenkins/bin/dev_toolkit.zip</a>
            <span style="color: red;"> [DOES NOT WORK]</span>.  Unzip this into your FIBO installation directory. 
          </li>
          <li>
            Create a catalog file by running the shell command <code>./createCatalog.sh</code> (optional, for use with Protege or CCM only)
          </li>
          <li>
            Create the About files by running the shell command <code>./createAbout.sh</code> (this can take a while)
          </li>
          <li>
            Load AboutProd.ttl (.rdf) or AboutDev.ttl (.rdf) to perform local tests. 
          </li>
        </ol>
        <p class="text">
          Step 3 needs to be done again whenever you create a new file or change the base URI of a file. 
        </p>
        <p class="text">
          Step 4 needs to be done again whenever you change the maturity level or base URI of a file, add a new file or delete a file. 
        </p>


        <h5>Automated Testing</h5>
        <p class="text">
          When FIBO is 'pushed' to a registered fork, a Jenkins job runs to perform standard tests. These tests are strict and comprehensive for the Production release of FIBO and are quite lax for the Development release of FIBO (for Development, they just check that nothing is referenced unless it is defined)
        </p>


        <h5>Automated Publication</h5>
        <p class="text">
          When a pull request results in a new version of FIBO in the EDMC repository, a series of publication processes are performed according to the FIBO publication policy.
        </p>
      </article>
    </main>
  </div>
</template>

<script>
import helpers from '../store/helpers.js';
import { outboundClick, outboundLinkClick } from '../helpers/ga';

export default {
  extends: helpers,
  name: 'FIBOCommunities',
  components: {},
  methods: {
    outboundClick,
    outboundLinkClick,
  },
};
</script>

<style lang="scss" scoped>
ol li{
  list-style-type: inherit;
  padding-left: 10px;
}
ol li:before{
  display: none;
}
</style>
