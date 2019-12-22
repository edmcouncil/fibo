<template>
  <div class="container">
    <main>
      <article>
        <h1>
          <span>FINANCIAL INDUSTRY BUSINESS DATA MODEL (FIB-DM)</span>
        </h1>

        <p class="text-margin-top text">
          FIB-DM is a complete model transformation of the FIBO into a Conceptual Data Model.
        </p>
        
        <figure class="wp-block-image size-large text-center">
          <img src="@/assets/img/FIBO-in-Data-Modeling-tools.png"
              alt="FIBO in Data Modeling tools"
              class=""
              sizes="(max-width: 885px) 100vw, 885px">
          <figcaption>
            The FIBO in PowerDesigner, ERWin, Sparx EA, ER/Studio, Visual Paradigm, and other modeling tools
          </figcaption>
        </figure>



        

        <hr class="wp-block-separator">

        <p class="text">Many midsize EDMC members want to leverage the industry standard, but don’t have ontology tooling, databases, and the human expertise inhouse yet. </p>

        <p>The FIBO development team created FIBO-derived glossaries and dictionaries available in MS-Excel to help. However, data architects still have to manually transcribe diagrams into their data modeling tool and copy &amp; paste definitions. The Financial Industry Business Data Model supplements the EDMC FIBO-derived formats.</p>

        <hr class="wp-block-separator">


        <p class="text">We created FIB-DM with CODT our&nbsp;<a href="https://fib-dm.com/patent/">patent-pending</a>&nbsp;Configurable Ontology to Data-model Transformation. </p>

        <figure class="wp-block-image size-large text-center">
          <a href="https://www.linkedin.com/pulse/open-source-data-model-financial-industry-jurgen-ziemer/"
              target="_blank" rel="noreferrer noopener">
            <img src="@/assets/img/Ontology-Graph-to-Entity-Replationship-diagram.png"
                alt="Ontology Graph to Entity Replationship diagram" class="wp-image-103" 
                sizes="(max-width: 990px) 100vw, 990px">
          </a>
        <figcaption>Ontology Graph to Entity Relationship diagram</figcaption></figure>

        <p>CODT derives FIB-DM entities from FIBO classes, associative entities from object properties, relationships from the domain, range, and class restrictions, and attributes from data properties. The data model entities contain the complete FIBO documentation and lineage to the source FIBO class URI link.</p>

        <hr class="wp-block-separator">


        <p class="text">Standalone FIB-DM is an Enterprise Data Model, a lower-cost alternative to industry vendor models. We believe that the ontology-derived data model is also more comprehensive, modern, and conceptually sound, thanks to the exceptional work of the FIBO development team and EDMC members supporting the content groups. </p>

        <p class="text">Strategically, adopting the industry standard for relational and object modeling today, you are fully prepared for Semantic Enterprise Information Architecture with the ontology at the apex and derived models for data, message, object, and process in the future.</p>

        <figure class="wp-block-image size-large text-center">
          <a href="https://fib-dm.com/semantics-for-finance-users/" target="_blank" rel="noreferrer noopener">
            <img src="@/assets/img/Semantic-Enterprise-Information-Architecture-1024x418.png"
                alt="Semantic Enterprise Information Architecture diagram" class="wp-image-1676"
                sizes="(max-width: 1024px) 100vw, 1024px">
          </a><figcaption>Semantic Enterprise Information Architecture.</figcaption></figure>

        <p>As a FIB-DM architect, you can easily learn OWL and ontology tooling because you recognize the familiar concepts and design patterns. As a business user or analyst, you find the FIB-CM concept maps intuitive and far less complicated than graphs and data models. Common names and definitions across the enterprise facilitate integration between applications, RDBMS and RDF-stores.  </p>

        <hr class="wp-block-separator">


        <p class="text">FIB-DM core is the Open Source (<a aria-label=" (opens in a new tab)" rel="noreferrer noopener" href="https://opensource.org/licenses/GPL-3.0" target="_blank">GPL-3.0</a> copyleft) version for smaller financial institutions, academic research, and your unlimited evaluation. The 1029-entity model derived from FIBO Foundation, Business Entities, and Finance Business &amp; Commerce modules. More than two hundred users already downloaded the model. </p>

        <p class="text">FIB-DM extended is the full 1875-entity version including current FIBO Production modules for Securities, Derivatives, and Indices &amp; Indicators. Licensees with a maintenance contract receive upgrades when new modules for Loans, Business Processes, Corporate Actions, Collective Investment Vehicles, and Market Data release into FIBO production in 2020.</p>

        <p class="text">Both models are released as SAP PowerDesigner Conceptual and Logical Data Models. Most data modeling tools can import native PowerDesigner files. For other tools and uses <a href="https://fib-dm.com/tutorial-1-addendum/">FIB-UM</a>, the Universal Model is the FIBO in    UML-XMI. </p>

        <p>Licenses are priced for institution size, using your EDMC membership tier as a segment.   </p>

        <hr class="wp-block-separator">


        <p class="text">To learn more watch the introduction videos, “Semantics for midsize Banks/for Managers/for Finance Users/for Data Architects” on <a aria-label=" (opens in a new tab)" rel="noreferrer noopener" href="https://www.youtube.com/c/fib-dm" target="_blank">YouTube</a>, download the data model, diagrams, education PowerPoints, and the full model report on the <a href="https://fib-dm.com/">FIB-DM website</a>, and follow the discussion on <a aria-label=" (opens in a new tab)" rel="noreferrer noopener" href="https://www.linkedin.com/showcase/fib-dm" target="_blank">LinkedIn</a>.</p>

        <p>Please contact me with any questions or to arrange an overview meeting. Thanks, Jurgen Ziemer, ontologist and data architect (<a href="mailto:jziemer@jayzed.com">jziemer@jayzed.com</a>).</p>

      </article>
    </main>
  </div>
</template>


<script>
import { outboundLinkClick } from '../helpers/ga';

export default {
  name: 'schema',
  components: {},
  methods: {
    outboundLinkClick,
  },
};
</script>

<style lang="scss" scoped>
hr.wp-block-separator{
  border-bottom: 1px solid;
}
</style>
