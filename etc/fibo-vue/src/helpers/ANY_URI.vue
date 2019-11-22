<template>
  <a :href="value" target="_blank">{{ value }}</a>
</template>
<script>
import Vue from 'vue';

export default {
  name: 'ANY_URI',
  props: ['value'],
};
</script>
