<template>
  <div class="container">
    <div class="row" v-if="loader">Loading data.</div>
    <div class="row" v-if="data">
      <div class="col-12">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">{{data.label.toUpperCase()}}</h5>
            <h6 class="card-subtitle mb-2 text-muted">{{data.iri}}</h6>
            <h6 class="card-subtitle mb-2 text-muted">{{data.qName}}</h6>
            <span v-if="data.taxonomy && data.taxonomy.value">
              <p v-for="taxonomy in data.taxonomy.value" :key="taxonomy" class="taxonomy">
                <span v-for="(element,index) in taxonomy" :key="element">
                  <customLink :name="element.valueA.value" :query="element.valueB.value"></customLink>
                  <span
                    class="card-subtitle mb-2 text-muted"
                    v-if="index != Object.keys(taxonomy).length - 1"
                  >></span>
                </span>
              </p>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 col-lg-4">
        <ul class="modules-list list-unstyled">
          <module-tree :item="item" v-for="item in modulesList" :location="data" :key="item.label" />
        </ul>
      </div>
      <div class="col-md-12 col-lg-8" v-if="data">
        <div class="row">
          <div
            class="col-md-12"
            v-for="(section, sectionName) in data.properties"
            :key="sectionName"
          >
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">{{sectionName}}</h5>
                <dl
                  class="row"
                  v-for="( property, name ) in data.properties[sectionName]"
                  :key="name"
                >
                  <dt class="col-sm-3">{{name}}</dt>
                  <dd class="col-sm-9">
                    <component
                      v-for="field in property"
                      :key="field.id"
                      :is="field.type"
                      :value="field.value"
                      :entityMaping="field.entityMaping"
                      v-bind="field"
                    ></component>
                  </dd>
                </dl>
              </div>
            </div>
          </div>
        </div>
        <div class="row" v-if="data && data.graph">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Data model for {{data.label}}</h5>
                <graph :data="data.graph" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import { getOntology, getModules } from "../api/ontology";

export default {
  components: {
    AXIOM: () => import(/* webpackChunkName: "AXIOM" */ "../helpers/AXIOM"),
    STRING: () => import(/* webpackChunkName: "STRING" */ "../helpers/STRING"),
    DIRECT_SUBCLASSES: () =>
      import(
        /* webpackChunkName: "DIRECT_SUBCLASSES" */ "../helpers/DIRECT_SUBCLASSES"
      ),
    MODULES: () =>
      import(/* webpackChunkName: "MODULES" */ "../helpers/MODULES"),
    IRI: () => import(/* webpackChunkName: "IRI" */ "../helpers/IRI"),
    INSTANCES: () =>
      import(/* webpackChunkName: "INSTANCES" */ "../helpers/INSTANCES"),
    ANY_URI: () =>
      import(/* webpackChunkName: "ANY_URI" */ "../helpers/ANY_URI"),
    graph: () => import(/* webpackChunkName: "ANY_URI" */ "../helpers/graph")
  },
  props: ["ontology"],
  data() {
    return {
      loader: false,
      data: null,
      query: "",
      ontologyServer: null,
      modulesServer: null,
      modulesList: null,
      treeData: {
        name: "My Tree",
        children: [
          { name: "hello" },
          { name: "wat" },
          {
            name: "child folder",
            children: [
              {
                name: "child folder",
                children: [{ name: "hello" }, { name: "wat" }]
              },
              { name: "hello" },
              { name: "wat" },
              {
                name: "child folder",
                children: [{ name: "hello" }, { name: "wat" }]
              }
            ]
          }
        ]
      }
    };
  },
  mounted: function() {
    let queryParam = "";
    
    if (this.$route.params && this.$route.params[1]) {
      var ontologyQuery = Object.values(this.$route.params)
        .filter(function(el) {
          return el != null;
        })
        .join("/");
      queryParam = `https://spec.edmcouncil.org/fibo/ontology/${ontologyQuery}`;
      console.log(queryParam);
    } else {
      if (this.$route.query && this.$route.query.query) {
        queryParam = this.$route.query.query || "";
      }
    }

    if (this.$route.query && this.$route.query.domain) {
      this.ontologyServer = this.$route.query.domain;
    } else {
      this.ontologyServer = this.ontologyDefaultDomain;
    }

    if (this.$route.query && this.$route.query.modules) {
      this.modulesServer = this.$route.query.modules;
    } else {
      this.modulesServer = this.modulesDefaultDomain;
    }

    this.query = queryParam;
    this.$nextTick(async function() {
      this.fetchData(this.query);
    });
    this.fetchModules();
  },
  methods: {
    queryForOntology: function() {
      let query = this.query;
      this.$router.push({ path: this.$route.path, query: { query } });
      this.fetchData(this.query);
    },
    fetchData: async function(query) {
      if (query) {
        this.loader = true;
        this.data = null;
        let result = await getOntology(query, this.ontologyServer);
        var body = await result.json();
        this.loader = false;
        this.data = body;
      }
    },
    fetchModules: async function() {
      let result = await getModules(this.modulesServer);
      this.modulesList = await result.json();
    }
  },
  computed: {
    ...mapState({
      ontologyDefaultDomain: state => state.ontologyDefaultDomain,
      modulesDefaultDomain: state => state.modulesDefaultDomain
    })
  },
  watch: {
    "$route.query.query"(query) {
      this.fetchData(query);
    }
  },
  beforeRouteUpdate(to, from, next) {
    next();
  }
};
</script>

<style lang="scss" scoped>
h5,
h6 {
  padding-top: 10px;
}
.card {
  margin: 20px;
  background: #f3f3f3;
}
.search-box {
  margin: 20px;
}
ul,
li {
  margin: 0;
  padding: 0;
  line-height: 24px;

  ::before {
    margin-top: 10px;
    display: none;
  }
}
.modules-list {
  margin: 20px 0 0 20px;
}
</style>