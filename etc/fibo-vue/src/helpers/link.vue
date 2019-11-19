<template>
  <router-link :to="{ name: 'ontology', query: { query }}">{{name}}</router-link>
</template>
<script>
export default {
  name: "customLink",
  props: ["name", "query"],
  beforeRouteUpdate(to, from, next) {
    next();
  }
};
</script>
