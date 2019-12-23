<template>
  <div class="container">
    <main>
      <article>
        <h1>
          <span>Courses</span>
        </h1>
      </article>
    </main>
  </div>
</template>

<script>
import helpers from '../store/helpers.js';
import { outboundClick, outboundLinkClick } from '../helpers/ga';

export default {
  extends: helpers,
  name: 'courses',
  components: {},
  methods: {
    outboundClick,
    outboundLinkClick,
  },
};
</script>

<style lang="scss" scoped>
</style>
