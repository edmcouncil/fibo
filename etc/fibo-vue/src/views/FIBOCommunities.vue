<template>
  <div class="container">
            <main>
              <article>

                <h1>
                  <span>FIBO Communities</span>
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
                    review and approval of new releases (by voting; with the assistance of the chair of the FIBO Community Group)
                  </li>
                  <li>
                    changes in the FSG membership
                  </li>
                </ul>

                <p class="text">
                  The FSG is constituted by the representatives of the companies and the experienced senior experts that are interested in supporting the development of FIBO.
                </p>

                <p class="text">
                  The FSG members are: Jurgen Ziemer (Jayzed Data Models Inc.), ...
                </p>

                <p class="text">
                  The FSG is chaired by John Bottega, who acts in this capacity on behalf of the EDMC. The FSG makes decisions remaining in close touch with the chair of the FIBO Community Group.
                </p>
                

                <h3>FIBO Community Group (FCG)</h3>
                <p class="text">
                  The FIBO Community Group (FCG) is open to any interested individuals, groups, and organizations that have agreed to
                  the Developer's Certificate of Origin 1.1 [ref to DCO and <a href="/">README.md</a>].
                </p>
                
                <p class="text">
                  The FCG role is to propose, discuss and prepare changes to FIBO.
                </p>
                
                <p class="text">
                  Any proposed FIBO extension should strictly follow the code of conduct [ref to code of conduct in repo],
                  which includes the principles for best practice
                  [ref to <a href="/">C. Ontology guide</a>]
                  and the steps described in the FIBO developer guide [ref to <a href="/">B. Development process</a>].
                </p>
                
                <p class="text">
                  The FCG is chaired by ..., who acts in this capacity on behalf of the EDMC.
                </p>
                
                
           
                <h3>FIBO GitHub repository and FIBO website</h3>
                <p>
                  Since January 2020, the FIBO <a href="/">GitHub repository</a> is the main platform for the FIBO Community Group
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
import { outboundClick } from '../helpers/ga';

export default {
  name: 'FIBOCommunities',
  components: {},
  methods: {
    outboundClick,
  },
};
</script>

<style lang="scss" scoped>
h1{
  margin-bottom: 30px;
}
</style>
