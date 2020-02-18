<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-2 col-xxxl-3 d-none d-xxl-block">
        <div class="module-tree float-right">
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
                      label="labelForInternalSearch"
                      track-by="iri"
                      placeholder="Search..."
                      tagPlaceholder="Search for..."
                      selectLabel="Display ontology"
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
                      :preserve-search="true"
                      :show-no-results="false"
                      :hide-selected="true"
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
          <h5 style="padding-top: 0px; margin-bottom: 20px;">Search results for "{{searchBox.selectedData.iri}}":</h5>
          <div v-if="searchBox.searchResults && searchBox.searchResults.length">
            <div v-for="result in searchBox.searchResults" :key="result" class="row">
              <div class="col-12">
                <div class="row">
                  <div class="col-12">
                    <customLink class="custom-link" :name="result.label" :query="result.iri" :customLinkOnClick="searchResultClicked"></customLink>
                  </div>
                </div>
                <div class="row">
                  <div class="col-12 text-link">
                    {{result.iri}}
                  </div>
                </div>
                <div class="row">
                  <div class="col-12 text">
                    {{result.description}}
                  </div>
                </div>
                <div class="border-bottom"></div>
              </div>
            </div>
          </div>
          <div v-else>
            <!-- No results -->
          </div>
        </div>

        <div v-else>
          <div class="row" v-if="data">
            <div class="col-12">
              
              <div class="alert alert-primary alert-maturity" role="alert" v-if="data.maturityLevel.label != 'release' && data.maturityLevel.label != ''">
                This resource has maturity level <strong>{{this.data.maturityLevel.label}}</strong>. Read more about
                <customLink class="custom-link" :name="this.data.maturityLevel.label" :query="data.maturityLevel.iri" :customLinkOnClick="this.ontologyClicked"></customLink>.
              </div>
              
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
            <div class="module-tree col-md-12 col-lg-4 d-xxl-none">
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
              <main  v-if="!loader">
                <article>
                  <h1>
                    <span>FIBO Viewer</span>
                  </h1>

                  <h3>About FIBO Viewer</h3>
                  <p>
                    FIBO Viewer is a JAVA application that is specifically designed to access both the FIBO structure and its content
                    in the easiest possible way. It can serve both as a web application and REST API. FIBO Viewer is an open-source
                    project that is hosted by EDM Council.  See <a href="https://github.com/edmcouncil/fibo-viewer">https://github.com/edmcouncil/fibo-viewer</a> for details.
                  </p>

                  <h3>FIBO structure and maturity levels</h3>
                  <p class="text">
                    To fully benefit from the FIBO Viewer, one should keep in mind two very important things about FIBO.
                  </p>
                  <p>
                    1) FIBO is a set of ontologies. It is organized in a hierarchical directory structure to organize the ontologies.
                    Top-level directories are called <i>domains</i>; beneath that may be one or two levels of <i>sub-domain</i>
                    and then <i>modules</i> and dozens of <i>ontologies</i> at the bottom level:
                  </p>
                  
                  <ul>
                    <li>
                      FIBO domain
                      <ul>
                        <li>
                          (FIBO sub-domain)
                          <ul>
                            <li>
                              FIBO module
                              <ul>
                                <li>
                                  FIBO ontology
                                </li>
                              </ul>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                  </ul>

                  <p>
                    On the left-hand side, there is a list of eleven FIBO Domains staring with the Business Entities at the top and ending with Securities at the bottom.
                  </p>
                  
                  <p class="text">
                    2) Each FIBO ontology has one of <strong>three levels of maturity</strong>.
                  </p>
                  
                  <p class="">
                    <strong>Release</strong>
                  </p>
                  <ul class="maturity-levels">
                    <li>
                      Release ontologies have undergone unit and integration testing, and have passed the most rigorous tests for completeness, consistency, and correctness.
                    </li>
                  </ul>
                  
                  <p class="">
                    <strong>Provisional</strong>
                  </p>
                  <ul class="maturity-levels">
                    <li>
                      Provisional ontologies were developed in the early days of FIBO but have not been vetted or tested to the level of Release.
                    </li>
                  </ul>
                  
                  <p class="">
                    <strong>Informative</strong>
                  </p>
                  <ul class="maturity-levels">
                    <li>
                      Informative ontologies are ones that have been considered by the FIBO Community but have been explicitly rejected.
                      They are included in FIBO sources because they include information, without which FIBO would fail basic referential
                      consistency tests. Casual users should usually ignore them. Developers should consider these for information only,
                      to determine the detailed meaning of the things that reference them.
                    </li>
                  </ul>
                  
                  <p class="text">
                    One can see the maturity level for each FIBO ontology, see e.g.
                    <a href="https://spec.edmcouncil.org/fibo/ontology/BE/FunctionalEntities/FunctionalEntities/">https://spec.edmcouncil.org/fibo/ontology/BE/FunctionalEntities/FunctionalEntities/</a>
                  </p>
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
                      label="labelForInternalSearch"
                      track-by="iri"
                      placeholder="Search..."
                      tagPlaceholder="Search for..."
                      selectLabel="Display ontology"
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
                      :preserve-search="true"
                      :show-no-results="false"
                      :hide-selected="true"
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
      this.$router.push({ path: '/ontology', query: { searchBoxQuery: encodeURI(newTag) }});
    },
    async handleSearchBoxQuery(searchBQuery){
      try {
        const result = await getOntology(searchBQuery, this.ontologyServer);
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
        iri: searchBQuery,
        label: searchBQuery,
        labelForInternalSearch: searchBQuery
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
        hints.forEach(el => {
          el.labelForInternalSearch = el.label + " "; //this is hacky to make it possible to search text (add tag) the same as the label in hint results
        })
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
    },
    searchResultClicked(){
      this.$root.ontologyRouteIsUpdating = true;
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
      if(this.query == 'https://spec.edmcouncil.org/fibo/ontology'){
        this.query = '';
        this.data = null;
      }
      this.$nextTick(async function () {
        this.fetchData(this.query);
      });
    };
    next();
  },
  updated(){
    //scrollTo: ontologyViewerTopOfContainer
    if(
      (this.$root.ontologyRouteIsUpdating) ||
      (this.$route.query.scrollToTop == 'true'))
    {
      this.searchBox.selectedData = null; //to hide search results after rerouting on ontology page
    }
    this.scrollToOntologyViewerTopOfContainer(); //move it to above IF to scroll only after internal navigaion (not on page load)
    

    if(this.$route.query.searchBoxQuery && (this.$route.query.searchBoxQuery_isExecuted !== true)){
      this.handleSearchBoxQuery(decodeURI(this.$route.query.searchBoxQuery));
      this.$route.query.searchBoxQuery_isExecuted = true;
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
.alert-maturity{
  margin: 20px;
}
.card {
  margin: 20px;
  background: #f3f3f3;
}
.search-box {
  margin: 20px;
}
.module-tree ul,
.module-tree li {
  padding: 0;
  line-height: 24px;

  ::before {
    margin-top: 10px;
    display: none;
  }
}
@media (min-width: 1px){
  .modules-list {
    margin: 20px 0 0 20px;
  }
}
@media (min-width: 1900px){
  .modules-list {
    margin: 30px 0 0 20px;
  }
}
article ul.maturity-levels li{
  line-height: 1.5;
}
article ul.maturity-levels li:before{
  margin-top: 10px;
}
.searchResults{
  margin: 20px 20px 0px 20px;
}
.searchResults a{
  font-weight: 500;
  margin-bottom: 5px;
  display: block;
}
.searchResults .text{
  color: #707070;
}
.searchResults .text-link{
  color: #adb5bd;
}
.border-bottom{
  margin-bottom: 5px;
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
.multiselect__option--highlight,
.multiselect__option--highlight:after {
  background: #f3f3f3;
  color: #000;
}
</style>
