<template>
  <div class="container">
    <main>
      <article>
        <h1>
          <span>What is FIBO?</span>
        </h1>

        <h3>What is an ontology?</h3>
        <p>
          An ontology in OWL is made up of statements about Classes (i.e. sets of things) and Properties (ways that
          things relate to other things). FIBO defines the sets of things that are of interest in financial business
          applications, and the ways that those things can relate to one another. In this way, FIBO can give meaning to
          any data (e.g., spreadsheets, relational databases, XML documents) that describe the business of finance. FIBO
          considers both Classes and Properties to be Concepts. The languages of Ontologies were originally developed by
          the US DoD and are codified by the World Wide Web Consortium (W3C).
        </p>

        <h3>What is FIBO?</h3>
        <p>
          <img src="../assets/img/FIBO_logo.jpg" class="fibo-logo img-fluid">
          <strong>The Financial Industry Business Ontology (FIBO)</strong> is the industry standard resource for the
          definitions of business concepts in the financial services industry. It is developed and hosted by the
          Enterprise Data Management Council (EDMC) and is published in a number for formats for operating use and for
          business definitions.
          <a
            href="fibo_owl.html"
          >
            FIBO is developed as an ontology in the Web Ontology Language
            (OWL)
          </a>. As such it is not a data model but a representation of the "things in the world" of financial
          services. The use of logic ensures that each real-world concept is framed in a way that is unambiguous and
          that is readable both by humans and machines. These common concepts have been reviewed by EDM Council member
          firms over a period of years and represent a consensus of the common concepts as understood in the industry
          and as reflected in industry data models and message standards. FIBO is developed according to a rigorous and
          well-defined process, referred to as the
          <a
            href="development.html"
          >
            "Build-Test-Deploy-Maintain"
            methodology
          </a>. In essence, the FIBO ontology is developed and maintained by FIBO Content Teams which are
          coordinated by a single FIBO Leadership Team, with process and automation support provided by a FIBO Process
          team.
        </p>

        <p
          class="pt-5 pb-5"
        >The figure below shows FIBO Domains: Derivatives, Loans, Indices and Indicators, Securities, Business Entities, Financial Business and Commerce and Foundations.</p>
        <center>
          <img src="../assets/img/fiibo_modules.png" width="500" height="400" class="img-fluid">
        </center>

        <p>
          The
          <a
            href="https://edmcouncil.org/resource/collection/16D6DC67-430E-4F75-9E07-08B1EC228091/FIBO_Primer_v0.2.pdf"
          >
            FIBO
            Primer
          </a>
          provides a layman's version of what is FIBO and how to use its content.
        </p>
      </article>
    </main>
  </div>
</template>

<script>
// @ is an alias to /src

export default {
  name: 'home',
  components: {},
};
</script>

<style>
</style>
