<template>
  <component v-bind:is="processedHtml"></component>
</template>
<script>
import customLink from "./link";
import Vue from "vue";
Vue.component("customLink", customLink);

export default {
  name: "MODULES",
  components: {
    customLink
  },
  props: ["value", "entityMaping"],
  computed: {
    processedHtml() {
      let html = `<customLink name="${this.value.valueA}" query="${this.value.valueB}"></customLink>`;
      return {
        template: "<div>" + html + "</div>"
      };
    }
  }
};
</script>