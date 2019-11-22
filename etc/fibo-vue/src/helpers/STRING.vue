<template>
  <div v-html="dataWithLineBreaks(value)"></div>
</template>
<script>
export default {
  name: 'STRING',
  props: ['value'],

  methods: {
    dataWithLineBreaks(data) {
      return data.replace(/(?:\r\n|\r|\n)/g, '<br />');
    },
  },
};
</script>
