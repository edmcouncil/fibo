<template>
  <component v-bind:is="processedHtml"></component>
</template>
<script>
import Vue from 'vue';
import customLink from './link';

Vue.component('customLink', customLink);

export default {
  name: 'AXIOM',
  components: {
    customLink,
  },
  props: ['value', 'entityMaping'],
  computed: {
    processedHtml() {
      let html = this.value;
      if (this.entityMaping) {
        Object.keys(this.entityMaping).forEach((name) => {
          const value = this.entityMaping[name];
          html = html.replace(
            name,
            `<customLink name="${value.label}" query="${value.iri}"></customLink>`,
          );
        });
      }
      return {
        template: `<div>${html}</div>`,
      };
    },
  },
};
</script>
