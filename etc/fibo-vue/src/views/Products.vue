<template>
  <div class="container">
    <main>
      <article>
      <h1><span>FIBO Products</span></h1>

        <h2>
          <strong>FIBO</strong> is intended for a range of uses, including in its simplest form as an English language glossary or a bank or regulator's data dictionary. In its most complex form,
          <router-link :to="{ path: router('OWL') }">FIBO in its native Web Ontology Language (OWL)</router-link>, could be used as a bank's operational ontology. There are also external uses of FIBO, such as FIBO.schema.org, which use FIBO as a reference for search indexing of specific information on the Internet.
        </h2>

        <h3>FIBO OWL</h3>
        <p>
          Although FIBO can be seen as a "product family", it is primarily an OWL ontology. FIBO OWL, both in its Production and Development versions, is available <router-link :to="{ path: router('OWL') }">here</router-link>. The FIBO OWL is best viewed using
          <router-link :to="{ path: router('ontology-tools') }">dedicated ontology tools</router-link>.
        </p>

        <h3>FIBO derived products</h3>
        <p>
          FIBO is also available as derived products. All FIBO products are generated or derived with an automated process from the
          <router-link :to="{ path: router('OWL') }">FIBO OWL</router-link>. Thus all changes in the FIBO OWL will be reflected in all other products. We are making all of FIBO available now because we have already seen amazing work done with FIBO and we welcome, almost demand, your feedback:
          <a
            href="mailto:rtrypuz@edmcouncil.org"
          >rtrypuz@edmcouncil.org</a>
        </p>
        <div class="table-responsive">
          <table class="table table-style-grey">
            <tr>
              <td>
                <router-link :to="{ path: router('data-dictionary') }">FIBO data dictionary</router-link>
              </td>
              <td>Web searchable, downloadable in .csv and .xlsx</td>
              <td>
                Includes web-searchable people and machine generated definitions, and as a spreadsheet that may be
                downloaded and worked with offline
              </td>
            </tr>
            <tr>
              <td>
                <router-link :to="{ path: hrefP('/', 'datadictionary', false) }">FIBO data dictionary</router-link>
              </td>
              <td>
                data dictionary downloadable in .csv and .xlsx
              </td>
              <td>
                A summary of each operational class in FIBO, with its properties, presented in the form of tables and fields for viewers familiar with relational data dictionaries.
              </td>
            </tr>

            <tr>
              <td>
                <router-link :to="{ path: router('vocabulary') }">FIBO vocabulary (SKOS)</router-link>
              </td>
              <td>The FIBO Vocabulary in SKOS</td>
              <td>
                FIBO rendered using the W3C
                <a
                  href="https://www.w3.org/2004/02/skos/intro"
                  v-on:click="outboundLinkClick('https://www.w3.org/2004/02/skos/intro')"
                >SKOS</a> standard, using
                extensions to represent FIBO relationships.
              </td>
            </tr>

            <tr>
              <td>
                <router-link :to="{ path: router('schema') }">FIBO extension to schema.org</router-link>
              </td>
              <td>The FIBO schema.org files</td>
              <td>
                This page provides background information on the use of
                <a
                  href="http://schema.org/"
                  v-on:click="outboundLinkClick('http://schema.org/')"
                >schema.org</a>
                for marking up banks and their products.
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
import { outboundClick, outboundLinkClick } from '../helpers/ga';

export default {
  extends: helpers,
  name: 'products',
  components: {},
  methods: {
    outboundClick,
    outboundLinkClick,
  },
};
</script>

<style lang="scss" scoped>
</style>
