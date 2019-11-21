import 'bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import Vue from 'vue';
import Clipboard from 'v-clipboard'
import App from './App.vue';
import router from './router';
import store from './store';
import moduleTree from './helpers/moduleElement.vue';

Vue.config.productionTip = false;
Vue.component('module-tree', moduleTree);
Vue.use(Clipboard)

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app');
