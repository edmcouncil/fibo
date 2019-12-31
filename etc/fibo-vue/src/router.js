import Vue from 'vue';
import Router from 'vue-router';
import Home from './views/Home.vue';

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/development',
      name: 'development',
      component: () => import(/* webpackChunkName: "development" */ './views/Development.vue'),
    },
    {
      path: '/working-group',
      name: 'workingGroups',
      component: () => import(/* webpackChunkName: "workingGroups" */ './views/WorkingGroups.vue'),
    },
    {
      path: '/ontology-tools',
      name: 'ontologyTools',
      component: () => import(/* webpackChunkName: "ontologyTools" */ './views/OntologyTools.vue'),
    },
    {
      path: '/SMIF-UML',
      name: 'SMIF-UML',
      component: () => import(/* webpackChunkName: "SMIF-UML" */ './views/SMIF-UML.vue'),
    },
    {
      path: '/contact',
      name: 'Contact',
      component: () => import(/* webpackChunkName: "Contact" */ './views/Contact.vue'),
    },
    {
      path: '/products',
      name: 'Products',
      component: () => import(/* webpackChunkName: "Products" */ './views/Products.vue'),
    },
    {
      path: '/OWL',
      name: 'OWL',
      component: () => import(/* webpackChunkName: "OWL" */ './views/OWL.vue'),
    },
    {
      path: '/data-dictionary',
      name: 'DataDictionary',
      component: () => import(/* webpackChunkName: "DataDictionary" */ './views/DataDictionary.vue'),
    },
    {
      path: '/vocabulary',
      name: 'Vocabulary',
      component: () => import(/* webpackChunkName: "Vocabulary" */ './views/Vocabulary.vue'),
    },
    {
      path: '/schema',
      name: 'Schema',
      component: () => import(/* webpackChunkName: "Schema" */ './views/Schema.vue'),
    },
    {
      path: '/FIBO-Groups',
      name: 'FIBOGroups',
      component: () => import(/* webpackChunkName: "FIBOCommunities" */ './views/FIBOGroups.vue'),
    },
    {
      path: '/development-process',
      name: 'DevelopmentProcess',
      component: () => import(/* webpackChunkName: "DevelopmentProcess" */ './views/DevelopmentProcess.vue'),
    },
    {
      path: '/FIB-DM',
      name: 'FIB-DM',
      component: () => import(/* webpackChunkName: "FIB-DM" */ './views/FIB-DM.vue'),
    },
    {
      path: '/how-to-contribute',
      name: 'HowToContribute',
      component: () => import(/* webpackChunkName: "FIB-DM" */ './views/HowToContribute.vue'),
    },
    {
      path: '/FIBO-Release-Notes',
      name: 'FIBOReleaseNotes',
      component: () => import(/* webpackChunkName: "FIBOReleaseNotes" */ './views/FIBOReleaseNotes.vue'),
    },     
    {
      path: '/courses',
      name: 'Courses',
      component: () => import(/* webpackChunkName: "Courses" */ './views/Courses.vue'),
    },
    {
      path: '/use-cases',
      name: 'UseCases',
      component: () => import(/* webpackChunkName: "UseCases" */ './views/UseCases.vue'),
    },
    {
      path: '/ontology/:1?/:2?/:3?/:4?/:5?',
      name: 'ontology',
      component: () => import(/* webpackChunkName: "Schema" */ './views/Ontology.vue'),
      meta: {
        plainLayout: false, // Layout without banner
      },
    },
    {
      path: '*',
      redirect: '/',
    },
  ],
});
