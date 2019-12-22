<template>
  <div class="container">
    <main>
      <article>
        <h1>
          <span>FIBO Development</span>
        </h1>

        <h2>
          FIBO is being developed in a continuous process by
          <a
            href="working-group.html#fibo-working-groups"
          >
            FIBO
            Content Teams (FCT)
          </a>. To serve the wide array of users, FIBO is published quarterly on this website as
          <a href="products.html">a variety of products</a> in file formats and dialects ranging from HTML to JSON-LD.
          All are generated, or derived from, the <a href="fibo_owl.html">FIBO OWL</a> system of record using the
          Build-Test-Deploy-Maintain Methodology in a
          continuous development process governed by automation including the Council-developed open source
          RDF ToolKit, GitHub, Jenkins, SourceTree, and a number of wikis for collaboration.
        </h2>

        <h3>Build, Test, Deploy, Maintain Methodology</h3>
        <p>
          FIBO is viewed as being very similar to the build of a complex, open-source software system. Ontologies are treated in the same way as "sources" like Java or C++ with the same challenges, such as managing dependencies and merging differences. Modern software engineering principles are therefore being applied to the process of
          building FIBO ontologies including Test-Driven Development (TDD), Continuous Integration and Continuous
          Improvement. Additional principles specific to ontology development include adherence to modeling policies and best practices, testing for logical consistency, and testing for deductive closure.
          These practices are highly dependent on automation to merge Build, Test, Deploy, and Maintain into a continuous process. The orchestration of all the builds is done by an open-source Continuous Integration platform called
          <a
            href="https://jenkins.edmcouncil.org"
          >Jenkins</a>. For every change in any branch in the
          <a
            href="https://github.com/edmcouncil/fibo"
          >GitHub based git-repository</a> (accessible for members only) that contains all the source OWL documents, Jenkins will start the so-called "ontology-publisher" which is a program that executes fully automated "Build", "Test" and "Deployment" end-to-end in sequential stages. Deployment in our case is also often called "Publish" because it means that the final version is published for the general public on this website.
        </p>

        <p>
          The FIBO is a grand vision; it is a standard that will be used across the financial industry for decades. It will grow and adapt as the years go by, and the user demands change. It is therefore crucial that the FIBO Build,
          Test, Deploy, and Maintain process have clear and unambiguous goals expressed below.
        </p>

        <h5>Build</h5>
        <p>
          Build is the process of fleshing out FIBO as an RDF/OWL model using W3C Standards. FIBO source files are
          maintained in
          <a
            href="https://github.com/edmcouncil/fibo"
          >a private GitHub repository</a> where the end
          results of the build process and published on this website (see
          <a
            href="products.html"
          >
            all FIBO
            products
          </a>).
          FIBO can be seen as a "product family" where each of the products in that family is generated with an automated process, which is "the build" that's being done by "the ontology-publisher". So all products, like
          the
          <a
            href="vocabulary.html"
          >FIBO Vocabulary</a>, are all derived from the original OWL source files that
          reside in the GitHub repository (the up-to-date version of FIBO OWL can be downloaded
          <a
            href="fibo_owl.html"
          >here</a>).
        </p>

        <h5>Test</h5>
        <p>
          Test includes unit tests, integration tests, "hygiene tests" and instance data tests that are automatically
          run against the ontologies and related artifacts to ensure conformance to requirements.
        </p>
        <h5>Deployment</h5>
        <p>
          Deployment for FIBO began when an initial FIBO Conceptual Ontology (BCO) began to be formed in 2008 by a team of Subject Matter Experts. FIBO is being used in the industry today. Examples can be found here and here. At
          this writing, FIBO deployment includes popular
          <a
            href="fibo_owl.html"
          >OWL formats</a>,
          <router-link replace :to="{ path: router('vocabulary') }">SKOS</router-link>,
          <a href>a Data Dictionary</a>,
          <a href>
            a Natural Language
            Glossary
          </a>,
          <a href>
            UML conforming to the Semantic Modeling for Information Federation (SMIF)
            specification
          </a>,
          <a href>FIBOPedia</a> and
          <a href>Linked Data Fragments</a>. Within the industry,
          FIBO as OWL or any of its derived products such as the glossary and the data dictionary could be used as the basis for a semantic graph database (aka RDF database or triple store) or any other type of database, be integrated with reasoners, be offered as a web service, or within a service, or some other particular architecture. In fact, FIBO is the ideal core set of ontologies for any financial institution that operates an
          Enterprise Knowledge Graph.
        </p>
        <h5>Maintenance</h5>
        <p>
          Maintenance is a continuous process where the FIBO GitHub Development Repository is central. All
          <a
            href="working-group.html"
          >FIBO Content Teams (FCT’s)</a> apply changes to this git repository that are
          documented in
          <a
            href="https://jira.edmcouncil.org"
          >JIRA</a>. For each discussed and approved JIRA-based change request, there can be one or more "committed changes" to that git repository where each series of changes triggers the build process on Jenkins. Production-FIBO is the tested, vetted version and is published quarterly. Development-FIBO is published as the content is added and tested. FIBO automation extends opportunities to all FIBO participants in the industry for both fixes and enhancements.
        </p>

        <h6>
          See FIBO
          <a href="/fibo/release.html">Release Notes</a>.
        </h6>
      </article>
    </main>
  </div>
</template>


<script>
import helpers from '../store/helpers.js';

export default {
  extends: helpers,
  name: 'development',
  components: {},
};
</script>

<style lang="scss" scoped>
</style>
