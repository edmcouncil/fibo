<template>
  <div class="container">
    <main>
      <article>
        <h1>
          <span>How To Contribute</span>
        </h1>
        

        <p class="text">
          Since January 2020, FIBO has been developed by an open community process. Official documentation of the FIBO project is located in its Github repository. The following files are important for any FIBO contributors:
        </p>

        <ul>
          <li>
                <a href="https://github.com/edmcouncil/fibo/blob/master/LICENSE"
                    v-on:click="outboundClick('https://github.com/edmcouncil/fibo/blob/master/LICENSE')">LICENSE</a>: FIBO is made available under MIT License.
          </li>
          <li>

                <a href="https://github.com/edmcouncil/fibo/blob/master/DCO"
                    v-on:click="outboundClick('https://github.com/edmcouncil/fibo/blob/master/DCO')">DCO</a>: We enforce the Developer Certificate of Origin (DCO) on Pull Requests. It requires all commit messages to contain the Signed-off-by line with an email address that matches the commit author. Contributors sign-off that they adhere to these requirements by adding a "Signed-off-by" line to commit messages.

          </li>
          <li>
                <a href="https://github.com/edmcouncil/fibo/blob/master/README.md"
                    v-on:click="outboundClick('https://github.com/edmcouncil/fibo/blob/master/README.md')">READ.md</a>: The README is the instruction manual. It explains how to get started.

          </li>
          <li>
                <a href="https://github.com/edmcouncil/fibo/blob/master/CONTRIBUTING.md"
                    v-on:click="outboundClick('https://github.com/edmcouncil/fibo/blob/master/CONTRIBUTING.md')">CONTRIBUTING.md</a> and <a href="https://github.com/edmcouncil/fibo/blob/master/ONTOLOGY_GUIDE.md"
                    v-on:click="outboundClick('https://github.com/edmcouncil/fibo/blob/master/ONTOLOGY_GUIDE.md')">ONTOLOGY_GUIDE.md</a>: These contributing documents explain what types of contributions are needed and how the process works. 

          </li>
          <li>

                <a href="https://github.com/edmcouncil/fibo/blob/master/CODE_OF_CONDUCT.md"
                    v-on:click="outboundClick('https://github.com/edmcouncil/fibo/blob/master/CODE_OF_CONDUCT.md')">CODE_OF_CONDUCT.md</a>: The code of conduct sets ground rules for participants’ behavior associated and helps to facilitate a friendly, welcoming environment. The FIBO project adheres to the Contributor Covenant code of conduct. By participating, you are expected to uphold this code.
          </li>
        </ul>
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

<style lang="scss" scoped>
</style>
