<template>
  <component v-bind:is="processedHtml"></component>
</template>
<script>
import customLink from "./link";
import Vue from "vue";
Vue.component("customLink", customLink);

export default {
  name: "AXIOM",
  components: {
    customLink
  },
  props: ["value", "entityMaping"],
  computed: {
    processedHtml() {
      let html = this.value;
      if (this.entityMaping) {
        Object.keys(this.entityMaping).forEach(name => {
          let value = this.entityMaping[name];
          html = html.replace(
            name,
            `<customLink name="${name}" query="${value}"></customLink>`
          );
        });
      }
      return {
        template: "<div>" + html + "</div>"
      };
    }
  }
};
</script>