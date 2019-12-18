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

    <div class="d-xxl-none multiselect-container">
      <multiselect v-model="searchBox.selectedData"
                   id="ajax"
                   label="label"
                   track-by="iri"
                   placeholder="Search for FIBO resource IRI"
                   open-direction="bottom"
                   :options="searchBox.data"
                   :multiple="false"
                   :searchable="true"
                   :loading="searchBox.isLoading"
                   :internal-search="false"
                   :clear-on-select="false"
                   :close-on-select="true"
                   :options-limit="300" :limit="3" :limit-text="searchBox_limitText"
                   :max-height="600"
                   :show-no-results="false"
                   :hide-selected="false"
                   :taggable="true"
                   @select="searchBox_optionSelected"
                   @tag="searchBox_addTag"
                   @search-change="searchBox_asyncFind">
        <template slot="tag" slot-scope="{ option, remove }"><span class="custom__tag"><span>{{ option.label }}</span><span class="custom__remove" @click="remove(option)">❌</span></span></template>
        <template slot="clear" slot-scope="props">
          <div class="multiselect__clear" v-if="searchBox.selectedData" @mousedown.prevent.stop="clearAll(props.search)"></div>
        </template><span slot="noResult">Oops! No elements found. Consider changing the search query.</span>
      </multiselect>
      <!-- <pre class="language-json"><code>{{ searchBox.selectedData }}</code></pre> -->
    </div>

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

    <div class="searchResults" v-if="searchBox.selectedData && searchBox.selectedData.isSearch">
      <div v-for="result in searchBox.searchResults" :key="result" class="row">
        <div class="col-12">
          <div class="row">
            <div class="col-12">
              <a :href="result.iri.replace('https://spec.edmcouncil.org', '')">{{result.label}}</a>
            </div>
          </div>
          <div class="row">
            <div class="col-12 text-link">
              {{result.iri}}
            </div>
          </div>
          <div class="border-bottom"></div>
        </div>
      </div>
    </div>

    <div v-else>
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
      <div class="col-md-12 col-lg-8 col-xxl-12" v-else>
        <main>
          <article>
            <h1>
              <span>What is Viewer?</span>
            </h1>
          </article>
        </main>
      </div>
    </div>
    </div>
  </div>

      </div>
      <div class="col-2 col-xxxl-3 d-none d-xxl-block">
        
        <div class="multiselect-xxl-container">
          <multiselect v-model="searchBox.selectedData"
                      id="ajax2"
                      label="label"
                      track-by="iri"
                      placeholder="Search for FIBO resource IRI"
                      open-direction="bottom"
                      :options="searchBox.data"
                      :multiple="false"
                      :searchable="true"
                      :loading="searchBox.isLoading"
                      :internal-search="false"
                      :clear-on-select="false"
                      :close-on-select="true"
                      :options-limit="300" :limit="3" :limit-text="searchBox_limitText"
                      :max-height="600"
                      :show-no-results="false"
                      :hide-selected="false"
                      :taggable="true"
                      @select="searchBox_optionSelected"
                      @tag="searchBox_addTag"
                      @search-change="searchBox_asyncFind">
            <template slot="tag" slot-scope="{ option, remove }"><span class="custom__tag"><span>{{ option.label }}</span><span class="custom__remove" @click="remove(option)">❌</span></span></template>
            <template slot="clear" slot-scope="props">
              <div class="multiselect__clear" v-if="searchBox.selectedData" @mousedown.prevent.stop="clearAll(props.search)"></div>
            </template><span slot="noResult">Oops! No elements found. Consider changing the search query.</span>
          </multiselect>
          <!-- <pre class="language-json"><code>{{ searchBox.selectedData }}</code></pre> -->
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex';
import { getOntology, getModules, getHint } from '../api/ontology';
import Multiselect from 'vue-multiselect';

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
    Multiselect,
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
      searchBox: {
        selectedData: null,
        data: [],
        isLoading: false,
        searchResults: null
      },
      scrollToOntologyViewerTopOfContainer: function(){
        var element = document.getElementById('ontologyViewerTopOfContainer');

        var rect = element.getBoundingClientRect(),
        scrollTop = rect.top + (window.pageYOffset || document.documentElement.scrollTop);

        window.scrollTo(0, scrollTop);
        this.$root.ontologyRouteIsUpdating = false;
      }
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
          if(body.type != "details"){
            console.error("body.type: " + body.type + ", expected: details");
          }
          this.data = body.result;
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
    
    //vue-multiselect
    searchBox_limitText (count) {
      return `and ${count} other results`
    },
    searchBox_optionSelected(selectedOption, id){
      var destRoute = selectedOption.iri;
      if(destRoute.startsWith('https://spec.edmcouncil.org/fibo')){
        //internal ontology
        destRoute = destRoute.replace('https://spec.edmcouncil.org/fibo', '');
        this.$router.push(destRoute);
      }else{
        //external ontology
        this.$router.push({ path: '/ontology', query: { query: encodeURI(destRoute) }})
      }
      this.scrollToOntologyViewerTopOfContainer();
    },
    async searchBox_addTag (newTag) {
      try {
        const result = await getOntology(newTag, this.ontologyServer);
        const body = await result.json();
        if(body.type != "list"){
          console.error("body.type: " + body.type + ", expected: list");
        }
        this.searchBox.searchResults = body.result;
        this.error = false;
      } catch (err) {
        console.error(err);
        this.error = true;
      }

      const tag = {
        isSearch: true,
        iri: newTag,
        label: newTag
      };
      this.searchBox.selectedData = tag;
    },
    async searchBox_asyncFind (query) {
      if(query.trim().length == 0){
        this.searchBox.data = [];
        return;
      }

      this.searchBox.isLoading = true
      try {
        const result = await getHint(query, '/hint');
        const hints = await result.json();
        this.searchBox.data = hints;
        this.error = false;
      } catch (err) {
        console.error(err);
        this.error = true;
      }
      this.searchBox.isLoading = false;
    },
    clearAll () {
      this.searchBox.selectedData = null;
    }
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
      this.scrollToOntologyViewerTopOfContainer();
    }
  },
};
</script>


<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>

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
.searchResults{
  margin: 20px 20px 0px 20px;
}
.searchResults a{
  font-weight: 500;
  margin-bottom: 5px;
  display: block;
}
.searchResults .text-link{
  color: #adb5bd;
}
.multiselect-container{
  margin: 20px 20px 0px 20px;
}
.multiselect-xxl-container{
  margin-top: 20px;
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
