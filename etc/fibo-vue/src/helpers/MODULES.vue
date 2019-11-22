<template>
  <component v-bind:is="processedHtml"></component>
</template>
<script>
import Vue from 'vue';
import customLink from './link';

Vue.component('customLink', customLink);

export default {
  name: 'MODULES',
  components: {
    customLink,
  },
  props: ['value', 'entityMaping'],
  computed: {
    processedHtml() {
      const html = `<customLink name="${this.value.valueA}" query="${this.value.valueB}"></customLink>`;
      return {
        template: `<div>${html}</div>`,
      };
    },
  },
};
</script>
