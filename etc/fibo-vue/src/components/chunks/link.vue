<template>
  <router-link v-if="query.match(/^https:\/\/spec\.edmcouncil\.org\/fibo/)" :to="{ path: query.replace(/https:\/\/spec\.edmcouncil\.org\/fibo/,'') }">{{name}}</router-link>
  <router-link v-else :to="{ name: 'ontology', query: { query }}">{{name}}</router-link>
</template>
<script>
export default {
  name: 'customLink',
  props: ['name', 'query'],
  beforeRouteUpdate(to, from, next) {
    next();
  },
};
</script>
