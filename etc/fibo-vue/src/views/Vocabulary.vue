<template>
  <div class="container">
    <main>
      <article>
        <h1>
          <span>FIBO Vocabulary</span>
        </h1>
        <h2>
          The FIBO vocabulary is distributed using the Simple Knowledge
          Organization System
          (<a href="https://www.w3.org/2004/02/skos/"
              v-on:click="outboundLinkClick('https://www.w3.org/2004/02/skos/')"
            >SKOS</a>). SKOS is a W3C Recommendation that supports the use of knowledge organization systems (KOS) such as thesauri, classification schemes, subject heading lists, and taxonomies within the framework of the Semantic Web. The FIBO Vocabulary uses SKOS to provide a machine-readable dictionary of the FIBO terminology.
        </h2>

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
        <p>
          The FIBO Vocabulary is distributed as a machine-readable file in which the FIBO class hierarchy is rendered as a tree structure of broader and narrower terms. Properties in FIBO appear as properties in the FIBO vocabulary. Logical restrictions
          relating pairs of FIBO classes are rendered as simple
          relationships between corresponding concepts in FIBO Vocabulary.
          The FIBO Vocabulary, therefore, does not reflect the full richness
          of the FIBO Ontologies, and is provided to support knowledge
          organization applications that do not require the full logic of
          FIBO.
        </p>

        <p>
          The FIBO Vocabulary machine-readable files are intended to
          provide input to a range of tools, usually characterized as
          Glossary or Vocabulary tools. These tools are generally used to provide further business-facing presentations of the content of these files.
        </p>

        <h3>Release Notes:</h3>
        <ul>
          <li>
            <b>2018 Q2</b>
            <ul>
              <li>Minor bug fixes</li>
            </ul>
          </li>

          <li>
            <b>2018 Q1</b>
            <ul>
              <li>Added simpler provenance links, hasDomain and hasSubDomain</li>
            </ul>
          </li>

          <li>
            <b>2017 Q4</b>
            <ul>
              <li>Change namespace conventions to simplify the IRIs of concepts</li>
              <li>Indicate for each concept its source domain, using dct:isPartOf</li>
            </ul>
          </li>

          <li>
            <b>2017 Q3</b>
            <ul>
              <li>Initial release</li>
            </ul>
          </li>
        </ul>
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

<style>
article {
  padding-top: 30px;
}
article h2 {
  font-size: 17px;
  color: #455560;
  line-height: 28px;
  text-transform: none;
  padding-top: 30px;
  padding-bottom: 10px;
  text-align: left;
  font-weight: 400;
  letter-spacing: 1px;
}
</style>
