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
      path: '/linked-data-fragments',
      name: 'LinkedDataFragments',
      component: () => import(/* webpackChunkName: "LinkedDataFragments" */ './views/LinkedDataFragments.vue'),
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
      path: '/glossary',
      name: 'Glossary',
      component: () => import(/* webpackChunkName: "Glossary" */ './views/Glossary.vue'),
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
      path: '/ontology-test',
      name: 'ontology',
      component: () => import(/* webpackChunkName: "Schema" */ './views/Ontology.vue'),
    },
    {
      path: '*',
      redirect: '/',
    },
  ],
});
