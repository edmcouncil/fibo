<template>
    <div class="container">
        <main>
            <article>
                <h1>
          <span>What is FIBO</span>
        </h1>

                <h3>What is FIBO</h3>

                <img src="../assets/img/FIBO_logo.jpg" class="fibo-logo img-fluid" />

                <p>
                    The Financial Industry Business Ontology (FIBO) defines the sets of things that are of interest in financial business applications and the ways that those things can relate to one another. In this way, FIBO can give meaning to any data (e.g., spreadsheets, relational databases, XML documents) that describe the business of finance.
                </p>
                <br>
                <p>
                    FIBO is hosted and sponsored by the Enterprise Data Management Council (EDMC) and is published in a number of formats for operating use and business definitions. FIBO is a trademark of EDM Council, Inc. It is also standardized by the Object Management Group (OMG).
                </p>
                <br>
                <p>
                    FIBO is developed as an ontology in the Web Ontology Language (OWL). The language is codified by the World Wide Web Consortium (W3C), and it is based on Description Logic. The use of logic ensures that each FIBO concept is framed in a way that is unambiguous and that is readable both by humans and machines.
                </p>

                <h3>EDM Council</h3>
                <img src="../assets/img/EDM-council-RGB_200w.png" class="fibo-logo img-fluid" />

                <p>

                    FIBO concepts have been reviewed by <a href="https://edmcouncil.org/page/listofmembersreview">EDMC member firms</a> over the years and represent a consensus of the common concepts as understood in the industry and as reflected in industry data models and message standards.
                </p>
                <br>
                <p>
                    A number of companies and people have made substantial contributions to FIBO over the years. These include 88 Solutions, Adaptive, Inc., BIAN, Bloomberg LP, Bureau of Economic Analysis (BEA, US Department of Commerce), Bureau of Labor Statistics (BLS, US Department of Commerce), Census Bureau (US Department of Commerce), Citigroup, Commodities Futures Trading Commission (CFTC), Credit Suisse, Deutsche Bank, Exprentis, Federal Reserve Bank of Kansas City, Goldman Sachs, HP Enterprise / Mphasis, MakoLab, Mizuho, NoMagic, Nordea Bank AB, Office of Financial Research (US Dept of the Treasury), Pinnacle Bank (Morgan Hill, California), Quarule, State Street Bank and Trust, Statistics Canada, Tahoe Blue Ltd, Thematix Partners LLC, Wells Fargo, and Working Ontologist.
                </p>

                <h3>Mission</h3>
                <img src="../assets/img/target-3535310_640.jpg" class="fibo-logo img-fluid" width="200px" /> 
                <p>
                    Since January 2020, EDMC FIBO has been developed by an open community process with a mission to develop, maintain, and promote global platform-independent, machine-readable and unambiguous data standard that enables understanding of the financial terminology, cross-system federation and aggregation of data to improve effectiveness of decisions, to improve efficiency in regulatory reporting and to fast-track the adoption of advanced analytical capabilities for financial services.
                </p>
                <br>
                

                <h3>How to contribute</h3>
                <img src="../assets/img/connect-316638_640.jpg" class="fibo-logo img-fluid" width="200px" /> 

                <p class="">
                    The FIBO development process follows rigorous and well-defined
                    <router-link :to="{ path: router('how-to-contribute') }">rules and principles</router-link>.
                </p>
                <p class="">
                    FIBO activities and development process are organized via two groups:
                    <router-link :to="{ path: router('FIBO-Groups') }">the FIBO Steering Group and the FIBO Community Group</router-link>.
                </p>
                <p class="">
                    Since January 2020, the FIBO
                    <a href="https://github.com/edmcouncil/fibo" v-on:click="outboundLinkClick('https://github.com/edmcouncil/fibo')">GitHub repository</a> is the main platform for the FIBO Community Group discussion. Please read <a href="https://github.com/edmcouncil/fibo/blob/master/README.md" v-on:click="outboundClick('https://github.com/edmcouncil/fibo/blob/master/README.md')">READ.md</a> for details.
                </p>
            </article>
        </main>
    </div>
</template>

<script>
    import helpers from '../store/helpers.js';
    import {
        outboundClick, outboundLinkClick
    }
    from '../helpers/ga';

    export default {
        extends: helpers,
        name: 'home',
        components: {},
        methods: {
            outboundClick,
            outboundLinkClick,
        },
    };
</script>

<style lang="scss" scoped>

</style>