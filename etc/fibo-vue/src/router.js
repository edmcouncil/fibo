import Vue from 'vue';
import Router from 'vue-router';
import Home from './views/Home.vue';

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/:branch/:tag',
      name: 'home',
      component: Home,
    },
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/development/:branch?/:tag?',
      name: 'development',
      component: () => import(/* webpackChunkName: "development" */ './views/Development.vue'),
    },
    {
      path: '/working-group/:branch?/:tag?',
      name: 'workingGroups',
      component: () => import(/* webpackChunkName: "workingGroups" */ './views/WorkingGroups.vue'),
    },
    {
      path: '/ontology-tools/:branch?/:tag?',
      name: 'ontologyTools',
      component: () => import(/* webpackChunkName: "ontologyTools" */ './views/OntologyTools.vue'),
    },
    {
      path: '/SMIF-UML/:branch?/:tag?',
      name: 'SMIF-UML',
      component: () => import(/* webpackChunkName: "SMIF-UML" */ './views/SMIF-UML.vue'),
    },
    {
      path: '/linked-data-fragments/:branch?/:tag?',
      name: 'LinkedDataFragments',
      component: () => import(/* webpackChunkName: "LinkedDataFragments" */ './views/LinkedDataFragments.vue'),
    },
    {
      path: '/contact/:branch?/:tag?',
      name: 'Contact',
      component: () => import(/* webpackChunkName: "Contact" */ './views/Contact.vue'),
    },
    {
      path: '/products/:branch?/:tag?',
      name: 'Products',
      component: () => import(/* webpackChunkName: "Products" */ './views/Products.vue'),
    },
    {
      path: '/OWL/:branch?/:tag?',
      name: 'OWL',
      component: () => import(/* webpackChunkName: "OWL" */ './views/OWL.vue'),
    },
    {
      path: '/glossary/:branch?/:tag?',
      name: 'Glossary',
      component: () => import(/* webpackChunkName: "Glossary" */ './views/Glossary.vue'),
    },
    {
      path: '/vocabulary/:branch?/:tag?',
      name: 'Vocabulary',
      component: () => import(/* webpackChunkName: "Vocabulary" */ './views/Vocabulary.vue'),
    },
    {
      path: '/schema/:branch?/:tag?',
      name: 'Schema',
      component: () => import(/* webpackChunkName: "Schema" */ './views/Schema.vue'),
    },
    {
      path: '/ontology/:domain?/:module?/:ontology?/:concept?',
      name: 'Ontology',
      component: () => import(/* webpackChunkName: "Schema" */ './views/Ontology.vue'),
      meta: {
        plainLayout: true,
      },
    },
    {
      path: '*',
      redirect: '/',
    },
  ],
});
