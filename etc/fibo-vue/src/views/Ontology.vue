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
            v-bind:value=$route.query.query
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
            <div
              v-for="( property, name ) in data.properties[sectionName]"
              :key="name"
            >
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
import { getOntology } from "../api/ontology";
import { parsers } from "../helpers/ontology";
import AXIOM from "../helpers/AXIOM";
import STRING from "../helpers/STRING";
import DIRECT_SUBCLASSES from "../helpers/DIRECT_SUBCLASSES"
import MODULES from "../helpers/MODULES"
import IRI from "../helpers/IRI"
import INSTANCES from "../helpers/INSTANCES"

export default {
  components: {
    AXIOM,
    STRING,
    DIRECT_SUBCLASSES,
    MODULES,
    IRI,
    INSTANCES,
  },
  data() {
    return {
      loader: false,
      data: null,
      query: null,
    };
  },
  mounted: function() {
    this.query = window.location.href.replace(/^.*\/fibo\/ontology/, "https://spec.edmcouncil.org/fibo/ontology");
    this.$nextTick(async function() {
      this.fetchData(this.query);
    });
  },
  methods: {
    queryForOntology: function() {
      let query = this.query;
      this.$router.push({ path: query.replace(/^.*\/fibo\/ontology/, "/ontology") });
    },
    fetchData: async function(query) {
      if (query) {
        this.loader = true;
        this.data = null;
        console.log('fetchData: query="'+query+'"');
        let result = await getOntology(query);
        var body = await result.json();
        console.log('fetchData: body="'+JSON.stringify(body)+'"');
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
  beforeRouteUpdate(to, from, next) {
    this.query = "https://spec.edmcouncil.org/fibo" + to.path;
    this.fetchData(this.query);
  }
};
</script>
