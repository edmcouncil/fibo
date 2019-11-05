import Vue from 'vue';
import Vuex from 'vuex';
import OWL from './OWL';
import helpers from './helpers';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    ontologyDefaultDomain: "http://172.30.1.116:8080/search/json",
  },
  mutations: {

  },
  actions: {

  },
  modules: {
    OWL,
    helpers,
  },
});