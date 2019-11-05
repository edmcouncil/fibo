<template>
  <div class="container">
    <div class="row" v-if="!loader">
      <div class="col-12">
        <div class="input-group mb-3">
          <input
            type="text"
            class="form-control"
            placeholder="Ontology"
            aria-describedby="basic-addon2"
            v-model="query"
          />
          <div class="input-group-append">
            <button
              class="btn btn-outline-secondary"
              type="button"
              v-on:click="queryForOntology"
            >Search</button>
          </div>
        </div>
      </div>
    </div>
    <div class="row" v-if="loader">Loading data.</div>
    <div class="row" v-if="data">
      <div class="col-12" v-bind:id="pretty">
        <div class="row">
          <div class="col-12">
            {{data.label}}
            {{data.iri}}
          </div>
        </div>
        <div class="row" v-for="(section, sectionName) in data.properties" :key="sectionName">
          <div class="col-12">
            <b>{{sectionName}}</b>
            <br />
            <div v-for="( property, name ) in data.properties[sectionName]" :key="name">
              {{name}}
              <component
                v-for="field in property"
                :key="field.id"
                :is="field.type"
                :value="field.value"
                :entityMaping="field.entityMaping"
                v-bind="field"
              ></component>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import { getOntology } from "../api/ontology";
import { parsers } from "../helpers/ontology";
import AXIOM from "../helpers/AXIOM";
import STRING from "../helpers/STRING";
import DIRECT_SUBCLASSES from "../helpers/DIRECT_SUBCLASSES";
import MODULES from "../helpers/MODULES";
import IRI from "../helpers/IRI";
import INSTANCES from "../helpers/INSTANCES";

export default {
  components: {
    AXIOM,
    STRING,
    DIRECT_SUBCLASSES,
    MODULES,
    IRI,
    INSTANCES
  },
  data() {
    return {
      loader: false,
      data: null,
      query: "",
      ontologyServer: null
    };
  },
  mounted: function() {
    //this.query = window.location.href.replace(/^.*\/fibo\/ontology/, "https://spec.edmcouncil.org/fibo/ontology");

    let queryParam = "";
    if (this.$route.query && this.$route.query.query) {
      queryParam = this.$route.query.query || "";
    }

    if (this.$route.query && this.$route.query.domain) {
      this.ontologyServer = this.$route.query.domain;
    } else {
      this.ontologyServer = this.ontologyDefaultDomain;
    }

    this.query = queryParam;
    this.$nextTick(async function() {
      this.fetchData(this.query);
    });

    console.log(this.$route);
  },
  methods: {
    queryForOntology: function() {
      let query = this.query;
      this.$router.push({ path: this.$route.path, query: { query} });
      this.fetchData(this.query);
    },
    fetchData: async function(query) {
      if (query) {
        this.loader = true;
        this.data = null;
        console.log('fetchData: query="' + query + '"');
        let result = await getOntology(query, this.ontologyServer);
        var body = await result.json();
        console.log('fetchData: body="' + JSON.stringify(body) + '"');
        this.loader = false;
        this.data = body;
      }
    },
    dataParser: function(dataChunk) {
      if (!dataChunk.type) {
        return "No type!";
      }

      if (!parsers[dataChunk.type]) {
        return "Not supported type";
      }

      return parsers[dataChunk.type](dataChunk);
    }
  },
  computed: {
    ...mapState({
      ontologyDefaultDomain: state => state.ontologyDefaultDomain
    })
  },
  beforeRouteUpdate(to, from, next) {
    next();
  }
};
</script>
