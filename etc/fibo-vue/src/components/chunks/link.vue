<template>
  <router-link :to="{ name: 'ontology', query: { query }}"
    @click.native="customLinkOnClick">{{name}}</router-link>
</template>
<script>
export default {
  name: 'customLink',
  props: {name: String, query: String, customLinkOnClick: Function},
  beforeRouteUpdate(to, from, next) {
    next();
  },
};
</script>
