<template>
  <div class="container">
    <main>
      <article>
        <h1>
          <span>FIBO OWL</span>
        </h1>
        <h2>
          FIBO is available in a number of RDF formats. These are available for offline use (i.e., download
          all of FIBO as a zip), or online use. Each FIBO ontology file is available for follow your nose treatment, a
          general description of which is available here.
        </h2>

        <p>Each FIBO product is published in two releases:</p>
        <ul>
          <li>
            <b>FIBO Production</b> is published at the end of each calendar quarter and has
            been vetted by SMEs and passed standard industry
            <i>hygiene</i> tests for OWL.
          </li>
          <li>
            <b>FIBO Development</b> is published in real time as changes are incorporated
            by the FIBO Leadership Team and consists of draft as well vetted content.
          </li>
        </ul>

        <h3 v-if="serializations">Serializations of FIBO OWL</h3>
        <div v-if="serializations" class="table-responsive">
          <table class="table table-style-striped">
            <tr>
              <th>FIBO OWL</th>
              <th>RDF-XML</th>
              <th>Turtle</th>
              <th>JSON-LD</th>
              <th>N-Quads/N-Triples</th>
            </tr>

            <tr v-for="element in serializations" :key="element.name">
              <td>
                {{element.name}}
                <span v-if="element.link && element.link.name">
                  (
                  <a :href="timestamped(element.link, timestamp)">{{element.link.name}}</a>)
                </span>
              </td>
              <td>
                <a
                  v-for="xmlLink in element.xml"
                  :key="xmlLink.name"
                  :href="timestamped(xmlLink, timestamp)"
                  class="inline"
                >{{xmlLink.name}}</a>
                <span v-if="!element.xml || element.xml.length === 0">N/A</span>
              </td>
              <td>
                <a
                  v-for="xmlLink in element.ttl"
                  :key="xmlLink.name"
                  :href="timestamped(xmlLink, timestamp)"
                  class="inline"
                >{{xmlLink.name}}</a>
                <span v-if="!element.ttl || element.ttl.length === 0">N/A</span>
              </td>
              <td>
                <a
                  v-for="xmlLink in element.json"
                  :key="xmlLink.name"
                  :href="timestamped(xmlLink, timestamp)"
                  class="inline"
                >{{xmlLink.name}}</a>
                <span v-if="!element.json || element.json.length === 0">N/A</span>
              </td>
              <td>
                <a
                  v-for="xmlLink in element.nq"
                  :key="xmlLink.name"
                  :href="timestamped(xmlLink, timestamp)"
                  class="inline"
                >{{xmlLink.name}}</a>
                <span v-if="!element.nq || element.nq.length === 0">N/A</span>
              </td>
            </tr>
          </table>
        </div>
      </article>
    </main>
  </div>
</template>


<script>
import { mapState } from 'vuex';
import helpers from '../store/helpers.js';

export default {
  extends: helpers,
  name: 'OWL',
  components: {},
  computed: {
    ...mapState('OWL', {
      serializations: state => state.serializations,
    }),
    ...mapState('helpers', {
      timestamp: state => state.timestamp,
    }),
  },
  methods: {
    timestamped(link, timestamp) {
      return (typeof link.PRODUCT === 'string' ? this.hrefP(link.name, link.PRODUCT) : (typeof link.product === 'string' ? this.hrefD(link.name, link.product) : eval(`\`${link.url}\``)));
    },
  },
};
</script>


<style lang="scss" scoped>
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
  .inline {
    display: inline-block;
  }
  li {
    line-height: 24px;
  }
</style>
