<template>
  <div class="container">
    <main>
      <article>
        <h1>
          <span>FIBO data dictionary</span>
        </h1>


        <p>
          FIBO data dictionary (aka glossary) is downloadable in .csv and .xlsx. It contains a summary of each operational class in FIBO, with its properties, presented in the form of tables and fields for viewers familiar with relational data dictionaries.
        </p>
        
        <h3>
          <a name="CSV">Comma Separated Values format</a>
        </h3>
        
        <p class="text">
          A comma-separated file with the same information as the web page; label, curated defintion, synonyms and
          model-generated defintion. For use in spreadsheets, including Excel.
        </p>

        <ul>
          <li>
            <a
              :href="hrefP('glossary-prod.csv','glossary')"
              v-on:click="outboundClick('glossary-prod.csv')"
            >Production</a>
          </li>
          <li>
            <a
              :href="hrefD('glossary-dev.csv','glossary')"
              v-on:click="outboundClick('glossary-dev.csv')"
            >Development</a>
          </li>
        </ul>

        <h3>
          <a name="XLS">Excel format</a>
        </h3>
        
        <p class="text">
          A file that can be read with Microsoft Excel, containing a label, curated definition, synonyms,
          model-generated definition, examples, and explanatory notes (when available). Exclusively for use with Excel,
          this file includes formatting to make the spreadsheet easier to read.
        </p>

        <ul>
          <li>
            <a
              :href="hrefP('glossary-prod.xlsx','glossary')"
              v-on:click="outboundClick('glossary-prod.xlsx')"
            >Production</a>
          </li>
          <li>
            <a
              :href="hrefD('glossary-dev.xlsx','glossary')"
              v-on:click="outboundClick('glossary-dev.xlsx')"
            >Development</a>
          </li>
        </ul>
        <p>Example:</p>
        <img border="1" src="../assets/img/glossary2.png" class="img-fluid" alt="glossary example" />
        <p />

      </article>
    </main>
  </div>
</template>


<script>
import helpers from '../store/helpers.js';
import { outboundClick } from '../helpers/ga';

export default {
  extends: helpers,
  name: 'glossary',
  components: {},
  methods: {
    outboundClick,
  },
};
</script>

<style lang="scss" scoped>
</style>
