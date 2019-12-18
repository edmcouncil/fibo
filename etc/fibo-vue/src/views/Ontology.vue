<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-2 col-xxxl-3 d-none d-xxl-block">
        <div class="float-right">
          <ul class="modules-list list-unstyled">
            <module-tree :item="item" v-for="item in modulesList" :location="data" :key="item.label" />
          </ul>
        </div>
      </div>
      <div class="col-12 col-xxl-8 col-xxxl-6">

  <div class="container">
    <a name="ontologyViewerTopOfContainer" id="ontologyViewerTopOfContainer"></a>
    <div class="row" v-if="loader">
      <div class="col-12">
        <div class="text-center">
          <div class="spinner-border" role="status">
            <span class="sr-only">Loading...</span>
          </div>
        </div>
      </div>
    </div>
    <div class="row" v-if="error">
      <div class="col-12">
        <div class="alert alert-danger" role="alert">
          <strong>Error!</strong> Cannot fetch data, please try later.
        </div>
      </div>
    </div>
    <div class="row" v-if="data">
      <div class="col-12">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">{{data.label.toUpperCase()}}</h5>
            <h6 class="card-subtitle mb-2 text-muted" v-if="data.iri">
              {{data.iri}}
              <button v-clipboard="data.iri" type="button" class="btn btn-sm btn-outline-primary">Copy</button>
            </h6>
            <h6 class="card-subtitle mb-2 text-muted" v-if="data.qName">
              {{data.qName}}
              <button v-clipboard="data.qName.replace('QName: ', '')" type="button" class="btn btn-sm btn-outline-primary">Copy</button>
            </h6>
            <span v-if="data.taxonomy && data.taxonomy.value">
              <p v-for="taxonomy in data.taxonomy.value" :key="taxonomy" class="taxonomy">
                <span v-for="(element,index) in taxonomy" :key="element">
                  <customLink :name="element.valueA.value" :query="element.valueB.value"></customLink>
                  <span
                    class="card-subtitle mb-2 text-muted"
                    v-if="index != Object.keys(taxonomy).length - 1"
                  >&nbsp;>&nbsp;</span>
                </span>
              </p>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="row" v-else>
      <div class="col-12">
        <main>
          <article>
            <h1>
              <span>What is Viewer?</span>
            </h1>
          </article>
        </main>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 col-lg-4 d-xxl-none">
        <ul class="modules-list list-unstyled">
          <module-tree :item="item" v-for="item in modulesList" :location="data" :key="item.label" />
        </ul>
        <div class="text-center" v-if="!modulesList && !error">
          <div class="spinner-border" role="status">
            <span class="sr-only">Loading...</span>
          </div>
        </div>
      </div>
      <div class="col-md-12 col-lg-8 col-xxl-12" v-if="data">
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
                <vis-network :data="data.graph" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

      </div>
      <div class="col-2 col-xxxl-3 d-none d-xxl-block"></div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex';
import { getOntology, getModules } from '../api/ontology';

export default {
  components: {
    AXIOM: () => import(/* webpackChunkName: "AXIOM" */ '../components/chunks/AXIOM'),
    STRING: () => import(/* webpackChunkName: "STRING" */ '../components/chunks/STRING'),
    DIRECT_SUBCLASSES: () => import(
      /* webpackChunkName: "DIRECT_SUBCLASSES" */ '../components/chunks/DIRECT_SUBCLASSES'
    ),
    MODULES: () => import(/* webpackChunkName: "MODULES" */ '../components/chunks/MODULES'),
    IRI: () => import(/* webpackChunkName: "IRI" */ '../components/chunks/IRI'),
    INSTANCES: () => import(/* webpackChunkName: "INSTANCES" */ '../components/chunks/INSTANCES'),
    ANY_URI: () => import(/* webpackChunkName: "ANY_URI" */ '../components/chunks/ANY_URI'),
    VisNetwork: () => import(/* webpackChunkName: "ANY_URI" */ '../components/VisNetwork'),
  },
  props: ['ontology'],
  data() {
    return {
      loader: false,
      data: null,
      query: '',
      ontologyServer: null,
      modulesServer: null,
      modulesList: null,
      error: false,
    };
  },
  mounted() {
    let queryParam = '';

    if (this.$route.params && this.$route.params[1]) {
      const ontologyQuery = window.location.pathname.replace('/fibo/ontology/', '');
      queryParam = `https://spec.edmcouncil.org/fibo/ontology/${ontologyQuery}`;
    } else if (this.$route.query && this.$route.query.query) {
      queryParam = this.$route.query.query || '';
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
    this.$nextTick(async function () {
      this.fetchData(this.query);
    });
    this.fetchModules();
  },
  methods: {
    queryForOntology() {
      const { query } = this;
      this.$router.push({ path: this.$route.path, query: { query } });
      this.fetchData(this.query);
    },
    async fetchData(query) {
      if (query) {
        this.loader = true;
        this.data = null;
        try {
          const result = await getOntology(query, this.ontologyServer);
          const body = await result.json();
          this.data = body;
          this.error = false;
        } catch (err) {
          console.error(err);
          this.error = true;
        }

        this.loader = false;
      }
    },
    async fetchModules() {
      try {
        const result = await getModules(this.modulesServer);
        this.modulesList = await result.json();
      } catch (err) {
        console.error(err);
        this.error = true;
      }
    },
  },
  computed: {
    ...mapState({
      ontologyDefaultDomain: state => state.ontologyDefaultDomain,
      modulesDefaultDomain: state => state.modulesDefaultDomain,
    }),
  },
  watch: {
    '$route.query.query': function (query) {
      this.fetchData(query);
    },
  },
  beforeRouteUpdate(to, from, next) {
    this.$root.ontologyRouteIsUpdating = true;
    if (to != from) {
      let queryParam = '';

      if (to.query && to.query.query) {
        queryParam = to.query.query || '';
      } else {
        queryParam = 'https://spec.edmcouncil.org/fibo' + to.path;
      }
      console.log(queryParam);
      this.query = queryParam;
      this.$nextTick(async function () {
        this.fetchData(this.query);
      });
    };
    next();
  },
  updated(){
    //scrollTo: ontologyViewerTopOfContainer
    if(
      ((this.data != undefined) && (this.data.iri != undefined) && (this.$root.ontologyRouteIsUpdating)) ||
      (this.$route.query.scrollToTop == 'true'))
    {
      var element = document.getElementById('ontologyViewerTopOfContainer');
      var top = element.offsetTop;
      window.scrollTo(0, top);
      this.$root.ontologyRouteIsUpdating = false;
    }
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

<style lang="scss">
@media (min-width: 1px){
  #ontograph{
    height: 500px;
  }
}
@media (min-width: 1900px){
  #ontograph{
    height: 1000px;
  }
}
</style>
