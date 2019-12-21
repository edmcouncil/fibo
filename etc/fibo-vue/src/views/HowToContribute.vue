<template>
  <div class="container">
    <main>
      <article>
        <h1>
          <span>How To Contribute</span>
        </h1>
        


        Since January 2020, FIBO has been developed by an open community process. Official documentation of the FIBO project is located in its Github repository. The following files are important for any FIBO contributors:

<ul>
  <li>
        LICENSE: FIBO is made available under MIT License.
  </li>
  <li>

        DCO: We enforce the Developer Certificate of Origin (DCO) on Pull Requests. It requires all commit messages to contain the Signed-off-by line with an email address that matches the commit author. Contributors sign-off that they adhere to these requirements by adding a "Signed-off-by" line to commit messages.

  </li>
  <li>
        README: The README is the instruction manual. It explains how to get started.

  </li>
  <li>
        CONTRIBUTING and ONTOLOGY_GUIDE: These contributing documents explain what types of contributions are needed and how the process works. 

  </li>
  <li>

        CODE_OF_CONDUCT: The code of conduct sets ground rules for participants’ behavior associated and helps to facilitate a friendly, welcoming environment. The FIBO project adheres to the Contributor Covenant code of conduct. By participating, you are expected to uphold this code.
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
