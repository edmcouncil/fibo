<template>
  <div class="container">
    <main>
      <article>
        <h1>
          <span>EDM Council FIBO Glossary</span>
        </h1>
        <h2>
          Generated from the OWL, the FIBO glossary is a list of classes and properties defined in FIBO, including
          their logical definition, curated natural language definition and synonyms where available. As with all of
          FIBO, there is a Production version of the Glossary, which includes definitions of terms that have been
          vetted by the FIBO content teams, as well as a Development version, which includes terms that are currently
          being developed.
        </h2>There are four ways to work with the FIBO Glossary.
        <ol>
          <li>
            <a href="#WS">Web Searchable</a>
          </li>
          <li>
            <a href="#CSV">Downloadable as a .csv for working in a spreadsheet</a>
          </li>
          <li>
            <a href="#XLS">Downloadable as a .xlsx for working in a spreadsheet</a>
          </li>
          <li>
            <a href="#NOTE">Downloadable as RDF annotations for use with FIBO itself</a>
          </li>
        </ol>The glossary incudes human-readable versions of the logical relationships in FIBO that are represented in
        OWL. These definitions are available on their own as annotations on the FIBO classes in
        <a
          href="../../derived_products/glossary/master/latest/LogicalAnnotations.rdf"
        >rdf-xml</a> and
        <a href="../../derived_products/glossary/master/latest/LogicalAnnotations.ttl">ttl</a>
        formats.
        <h3>
          <a name="WS">Web Searchable</a>
        </h3>
        <ul>
          <li>
            <a href="glossary_production.html">Production</a>
          </li>
          <li>
            <a href="glossary_development.html">Development</a>
          </li>
        </ul>A user-friendly web page that includes label, curated definition, synonyms (where available) and
        model-generated definitions for all classes and properties in FIBO.
        <p>Example:</p>
        <img border="1" src="../assets/img/glossary1.png" class="img-fluid">

        <h3>
          <a name="CSV">Comma Separated Values format</a>
        </h3>A comma-separated file with the same information as the web page; label, curated defintion, synonyms and
        model-generated defintion. For use in spreadsheets, including Excel.
        <ul>
          <li>
            <a href="../../fibo/glossary/master/2019Q2/glossary-prod.csv">Production</a>
          </li>
          <li>
            <a href="../../fibo/glossary/master/latest/glossary-dev.csv">Development</a>
          </li>
        </ul>

        <h3>
          <a name="XLS">Excel format</a>
        </h3>A file that can be read with Microsoft Excel, containing label, curated definition, synonyms,
        model-generated definition, examples and explanatory notes (when available). Exclusively for use with Excel,
        this file includes formatting to make the spreadsheet easier to read.
        <ul>
          <li>
            <a href="../../fibo/glossary/master/2019Q2/glossary-prod.xlsx">Production</a>
          </li>
          <li>
            <a href="../../fibo/glossary/master/latest/glossary-dev.xlsx">Development</a>
          </li>
        </ul>
        <p>Example:</p>
        <img border="1" src="../assets/img/glossary2.png" class="img-fluid" alt="glossary example">
        <p/>

        <h3>
          <a name="NOTE">Downloadable RDF Annotations</a>
        </h3>For application developer who want to be able to query for the human-readable versions of the FIBO logic,
        that is avaiable in
        <a
          href="../../fibo/glossary/master/latest/LogicalAnnotations.ttl"
        >ttl</a> and
        <a href="../../fibo/glossary/master/latest/LogicalAnnotations.rdf">RDF/XML</a> formats.
        Release Notes:
        <ul>
          <li>
            <b>2018 Q3</b>
            <ul>
              <li>Publication of human-readable logic in RDF</li>
            </ul>
          </li>

          <li>
            <b>2018 Q1</b>
            <ul>
              <li>Improved spreadsheet generation</li>
              <li>Added fields to the tabular glossary</li>
            </ul>
          </li>

          <li>
            <b>2017 Q4</b>
            <ul>
              <li>Overhaul of the glossary generation system to keep glossaries in sync with all versions of FIBO</li>
              <li>Updated the Excel format to freeze the title row</li>
              <li>Improved natural language rendition of model-driven definitions</li>
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
export default {
  name: 'glossary',
  components: {},
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
