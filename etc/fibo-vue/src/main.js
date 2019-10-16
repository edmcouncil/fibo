import 'bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import VueAnalytics from 'vue-analytics'

Vue.config.productionTip = false;

Vue.use(VueAnalytics, {
  id: 'UA-124531442-2',
  router
})

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app');
