<template>
  <div class="container">
    <main>
      <article>
        <h1>
          <span>FIBO schema.org</span>
        </h1>
        <h2>
          This
          <a href="http://schema.org/docs/financial.html"
            v-on:click="outboundLinkClick('http://schema.org/docs/financial.html')"
          >page</a> provides background information on the use of
          <a href="https://schema.org/"
            v-on:click="outboundLinkClick('https://schema.org/')"
          >schema.org</a> for marking up banks and their financial products.
        </h2>
      </article>
    </main>
  </div>
</template>


<script>
import { outboundLinkClick } from '../helpers/ga';

export default {
  name: 'schema',
  components: {},
  methods: {
    outboundLinkClick,
  },
};
</script>

<style>
article {
  padding-top: 30px;
}
article h2 {
  font-size: 17px;
  color: #455560;
  line-height: 28px;
  text-transform: none;
  padding-top: 30px;
  padding-bottom: 10px;
  text-align: left;
  font-weight: 400;
  letter-spacing: 1px;
}
</style>
