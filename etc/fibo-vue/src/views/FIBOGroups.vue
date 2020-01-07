<template>
  <div class="container">
            <main>
              <article>

                <h1>
                  <span>FIBO Groups</span>
                </h1>

                <p class="text">
                  FIBO development process is organized by two groups: the <strong>FIBO Steering Group</strong> and the <strong>FIBO Community Group</strong>.
                </p>

                <h3>FIBO Steering Group (FSG)</h3>
                <p>
                  The FIBO Steering Group (FSG) is responsible for
                </p>
                
                <ul>
                  <li>
                    the strategic orientation of the FIBO evolution
                  </li>
                  <li>
                    review and approval of new releases
                  </li>
                  <li>
                    changes in the FSG membership
                  </li>
                </ul>

                <p class="text">
                  The FSG is constituted by the representatives of the companies and the experienced senior experts that are interested in supporting the development of FIBO.
                </p>

                <p class="text">
                  The FSG members will be announced soon.
                </p>

                <p class="text">
                  The FSG is chaired by John Bottega, who acts in this capacity on behalf of the EDMC. The FSG makes decisions remaining in close touch with the chair of the FIBO Community Group.
                </p>
                

                <h3>FIBO Community Group (FCG)</h3>
                <p class="text">
                  The FIBO Community Group (FCG) is open to any interested individuals, groups, and organizations that have agreed to
                  <a href="https://github.com/edmcouncil/fibo/blob/master/README.md#developer-certificate-of-origin-dco">the Developer's Certificate of Origin 1.1</a>.
                </p>
                
                <p class="text">
                  The FCG role is to propose, discuss and prepare changes to FIBO.
                </p>
                
                <p class="text">
                  Every proposed FIBO extension should strictly follow the rigorous and well-defined
                  <a href="https://github.com/edmcouncil/fibo/blob/master/CONTRIBUTING.md">rules and principles</a>,
                  including the 
                  <a href="https://github.com/edmcouncil/fibo/blob/INFRA-489/ONTOLOGY_GUIDE.md">principles of best practices for FIBO</a>.
                  FIBO project also adheres to the Contributor Covenant
                  <a href="https://github.com/edmcouncil/fibo/blob/master/CODE_OF_CONDUCT.md">code of conduct</a>.
                </p>
                
                <p class="text">
                  The FCG chair will be announced soon.
                </p>
                
                
           
                <h3>FIBO GitHub repository and FIBO website</h3>
                <p>
                  Since January 2020, the FIBO
                  <a href="https://github.com/edmcouncil/fibo"
                    v-on:click="outboundLinkClick('https://github.com/edmcouncil/fibo')">GitHub repository</a> is the main platform for the FIBO Community Group
                  discussion and the FIBO website is the space where all the official FIBO materials are located.
                </p>
              </article>
            </main>
          </div>
        </div>
      </div>

    </div>
  </div>
</template>

<script>
import helpers from '../store/helpers.js';
import { outboundClick, outboundLinkClick } from '../helpers/ga';

export default {
  extends: helpers,
  name: 'FIBOCommunities',
  components: {},
  methods: {
    outboundClick,
    outboundLinkClick,
  },
};
</script>

<style lang="scss" scoped>
</style>
