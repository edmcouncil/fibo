<template>
  <div class="container">
    <main>
      <article>
        <h1>
          <span>FIBO Vocabulary</span>
        </h1>

        <p class="text text-margin-top">
          The FIBO vocabulary is distributed using the Simple Knowledge Organization System
          (<a href="https://www.w3.org/2004/02/skos/"
              v-on:click="outboundLinkClick('https://www.w3.org/2004/02/skos/')"
            >SKOS</a>). SKOS is a W3C Recommendation that supports the use of knowledge organization systems (KOS) such as thesauri, classification schemes, subject heading lists, and taxonomies within the framework of the Semantic Web.
        </p>

        <p class="text">
          The FIBO vocabulary is distributed as a machine-readable file in which the FIBO class hierarchy is rendered as a tree structure of broader and narrower terms. Properties in FIBO appear as properties in the FIBO vocabulary. Logical restrictions relating pairs of FIBO classes are rendered as simple relationships between corresponding concepts in FIBO Vocabulary. The FIBO Vocabulary, therefore, does not reflect the full richness of the FIBO Ontologies and is provided to support knowledge organization applications that do not require the full logic of FIBO.
        </p>

        <p>
          The FIBO Vocabulary machine-readable files are intended to provide input to a range of tools, usually characterized as Glossary or Vocabulary tools. These tools are generally used to provide further business-facing presentations of the content of these files.
        </p>

        <div class="table-responsive">
          <table class="table table-style-grey">
            <tr>
              <th>FIBO SKOS</th>
              <th>RDF-XML</th>
              <th>Turtle</th>
              <th>JSON-LD</th>
            </tr>

            <tr>
              <td>FIBO-V (Development)</td>
              <td>
                <a v-bind:href="hrefD('fibo-vD.rdf')"
                  v-on:click="outboundClick('fibo-vD.rdf')">fibo-vD.rdf</a> (<a v-bind:href="hrefD('fibo-vD.rdf.zip')"
                  v-on:click="outboundClick('fibo-vD.rdf.zip')">zip</a>)
              </td>
              <td>
                <a v-bind:href="hrefD('fibo-vD.ttl')"
                  v-on:click="outboundClick('fibo-vD.ttl')">fibo-vD.ttl</a> (<a v-bind:href="hrefD('fibo-vD.ttl.zip')"
                  v-on:click="outboundClick('fibo-vD.ttl.zip')">zip</a>)
              </td>
              <td>
                <a v-bind:href="hrefD('fibo-vD.jsonld')"
                  v-on:click="outboundClick('fibo-vD.jsonld')">fibo-vD.jsonld</a> (<a v-bind:href="hrefD('fibo-vD.jsonld.zip')"
                  v-on:click="outboundClick('fibo-vD.jsonld.zip')">jsonld</a>)
              </td>
            </tr>

            <tr>
              <td>FIBO-V (Production)</td>
              <td>
                <a v-bind:href="hrefP('fibo-vP.rdf')"
                  v-on:click="outboundClick('fibo-vP.rdf')">fibo-vP.rdf</a> (<a v-bind:href="hrefP('fibo-vP.rdf.zip')"
                  v-on:click="outboundClick('fibo-vP.rdf.zip')">zip</a>)
              </td>
              <td>
                <a v-bind:href="hrefP('fibo-vP.ttl')"
                  v-on:click="outboundClick('fibo-vP.ttl')">fibo-vP.ttl</a> (<a v-bind:href="hrefP('fibo-vP.ttl.zip')"
                  v-on:click="outboundClick('fibo-vP.ttl.zip')">zip</a>)
              </td>
              <td>
                <a v-bind:href="hrefP('fibo-vP.jsonld')"
                  v-on:click="outboundClick('fibo-vP.jsonld')">fibo-vP.jsonld</a> (<a v-bind:href="hrefP('fibo-vP.jsonld.zip')"
                  v-on:click="outboundClick('fibo-vP.jsonld.zip')">zip</a>)
              </td>
            </tr>
          </table>
        </div>
      </article>
    </main>
  </div>
</template>


<script>
import helpers from '../store/helpers.js';
import { outboundClick } from '../helpers/ga';

export default {
  extends: helpers,
  name: 'vocabulary',
  components: {},
  methods: {
    outboundClick,
  },
};
</script>

<style lang="scss" scoped>
</style>
