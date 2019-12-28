<template>
    <div class="container">
        <main>
            <article>
                <h1>
          <span>Use Cases</span>
        </h1>

                <p class="text">Below there are the summaries of the following FIBO use cases:</p>
                <ol>
                    <li><a href="#SEC-02">Exchange Instrument Data Offering</a></li>
                    <li><a href="#DER-STD-REP">Unified Standard for Regulatory Reporting of Derivatives</a></li>
                    <li><a href="#DER-CPTY-EXP">Counterparty exposure in a derivatives trading network</a></li>
                    <li><a href="#IND-EFT-DEV">Index analysis for ETF development</a></li>
                </ol>

                <!--         -->

                <h3 id="SEC-02">
          <span>Exchange Instrument Data Offering</span>
        </h3>

                <div class="table-responsive">
                    <table class="table table-style-grey">
                        <tr>
                            <th colspan=2>I. Use Case Description</th>
                        </tr>

                        <tr>
                            <td>Use Case Name</td>
                            <td>
                                Exchange Instrument Data Offering
                            </td>
                        </tr>

                        <tr>
                            <td>Use Case Identifier</td>
                            <td>
                                SEC-02
                            </td>
                        </tr>

                        <tr>
                            <td>Source</td>
                            <td>

                                <a href="https://wiki.edmcouncil.org/display/SEC/Use+case%3A+SEC-02" v-on:click="outboundClick('https://wiki.edmcouncil.org/display/SEC/Use+case%3A+SEC-02')">Securities FIBO Content Team</a>
                            </td>
                        </tr>

                        <tr>
                            <td>Point of Contact</td>
                            <td>
                                <a href="mailto:fibo@edmcouncil.org?subject=use case: SEC-02&body=Hi! I'd like to learn more about this use case.">EDMC FIBO Team</a>
                            </td>
                        </tr>

                    </table>
                </div>

                <div class="table-responsive">
                    <table class="table table-style-grey">
                        <tr>
                            <th colspan=2>II. Use Case Summary</th>
                        </tr>

                        <tr>
                            <td>Goal</td>
                            <td>
                                <p>There is no single publicly available model for instrument reference data for market traded instruments. FIBO should provide the core content for such a model, which is needed across the industry, including EDMC member institutions. While there are a number of proprietary models, such as those of data vendors, there is no general consensus. </p>

                                <p>This use case is focused on a fictitious offering of securities instrument data to users by an exchange, to establish a constrained baseline for the overarching use case defined in SEC-01.</p>
                            </td>
                        </tr>

                        <tr>
                            <td>Requirements</td>
                            <td>
                                Specify the essential securities instrument information needed for core securities master data management, specifically the subset that an exchange might publish.
                            </td>
                        </tr>

                        <tr>
                            <td>Scope</td>
                            <td>
                                In order to constrain the scope further, in this use case we will focus on (1) equities and (2) bonds.
                            </td>
                        </tr>

                        <tr>
                            <td>Priority</td>
                            <td>
                                This is high priority in order to (1) provide a much-needed reference model for securities master data management and (2) demonstrate how to use an ontology successfully and in a cost-effective way as the basis for other work inside an institution.
                            </td>
                        </tr>                        

                        <tr>
                            <td>Stakeholders</td>
                            <td>
                                Primary stakeholders include any exchange that might publish instrument related information, consumers of that information including traders, front and back office personnel as well as compliance officers at institutions whose portfolios include securities and that need to manage information about those securities, other individual investors interested in the information, and various systems supporting all of the above.
                            </td>
                        </tr>

                        <tr>
                            <td>Description</td>
                            <td>

                                <p class="text">There are a number of organizations that publish certain master data elements that we can use as the basis for coming up with a composite view, including OpenFIGI, the DTCC Security Master Data File (including intra-day), various exchanges including the NYSE and Nasdaq, and possibly CME.  The purpose of the use case is to show how one might leverage data coming from multiple sources to manage security master data using FIBO.</p>                                
                            </td>
                        </tr>

                        <tr>
                            <td>Actors / Interfaces</td>
                            <td>
                                <p class="text">Actors include the stakeholders listed above, systems that maintain security master data including but not limited to those at the exchange, inside of an institution, or managed by regulators, and any other consumer of security master data.</p>
                            </td>
                        </tr>

                    </table>
                </div>

                <h3 id="DER-STD-REP">
          <span>Unified Standard for Regulatory Reporting of Derivatives</span>
        </h3>

                <div class="table-responsive">
                    <table class="table table-style-grey">
                        <tr>
                            <th colspan=2>I. Use Case Description</th>
                        </tr>

                        <tr>
                            <td>Use Case Name</td>
                            <td>
                                Unified Standard for Regulatory Reporting of Derivatives
                            </td>
                        </tr>

                        <tr>
                            <td>Use Case Identifier</td>
                            <td>
                                DER-STD-REP
                            </td>
                        </tr>

                        <tr>
                            <td>Source</td>
                            <td>

                                <a href="https://wiki.edmcouncil.org/display/DER/Use+case%3A+DER-Standardized+Reporting" v-on:click="outboundClick('https://wiki.edmcouncil.org/display/DER/Use+case%3A+DER-Standardized+Reporting')">Derivatives FIBO Content Team</a>
                            </td>
                        </tr>

                        <tr>
                            <td>Point of Contact</td>
                            <td>
                                <a href="mailto:fibo@edmcouncil.org?subject=use case: DER-STD-REP&body=Hi! I'd like to learn more about this use case.">EDMC FIBO Team</a>
                            </td>
                        </tr>

                    </table>
                </div>

                <div class="table-responsive">
                    <table class="table table-style-grey">
                        <tr>
                            <th colspan=2>II. Use Case Summary</th>
                        </tr>

                        <tr>
                            <td>Goal</td>
                            <td>
                                To provide greater accuracy, timeliness, harmonization, aggregation, more transparency, and higher quality in general across diverse derivatives reporting sources
                            </td>
                        </tr>

                        <tr>
                            <td>Requirements</td>
                            <td>
                                To provide a more efficient, less expensive, and standardized reporting capability for derivatives using a common financial language in an actionable way
                            </td>
                        </tr>

                        <tr>
                            <td>Scope</td>
                            <td>
                                <p class="text">Reporting, specifically limited to reporting on derivatives contracts (rather than stress tests or other kinds of regulatory reports) could be viewed from a number of perspectives:</p>

                                <ol>
                                    <li>(1) from the perspective of an institution, to be able to create accurate regulatory and internal reports in a timely way with respect to derivatives on their books, including counterparties to their portfolio(s) (i.e., what is the best way for an institution to report on the derivative contracts on their books to a regulator), </li>

                                    <li>(2) from the perspective of a broker/dealer or swap execution facility, to be able to analyze and report on the derivatives they manage and/or own, and the counterparties to those instruments, whether they are on their own books or those of their clients, and report on them to an SDR, </li>

                                    <li>(3) from the perspective of an SDR, exchange, clearing house, or other recipient, to receive reports that are provided in a common, standardized representation that makes them easier to ingest, and to be able to analyze and report on the derivatives for which they receive reports in an accurate and timely way, including analysis of the counterparties to the instruments included in those reports, and</li>

                                    <li>(4) from the perspective of a regulator or other organization receiving information from a variety of sources that are not aligned with one another, to have the ability to map that information to a common vocabulary to facilitate analysis and ultimately to have a common framework for reporting that would enable understanding as well as reporting from third parties.</li>
                                </ol>

                                <p class="text">Some reports, such as end-of-day positions, exposure reports, and stress tests, are provided periodically to the regulators. The frequency depends on the kind of information reported. These reports have all different forms and formats that are not normalized, and the data is difficult to compare as a consequence. </p>

                                <p class="text">Note that as we move towards distributed ledger technology, having standard language for reporting purposes could extend to smart contracts which would be more effective than use of legacy approaches to such reporting.</p>

                                <p class="text">The content required for each of the kinds of reports we intend to cover is given under the usage scenarios section, below.</p>
                            </td>
                        </tr>

                        <tr>
                            <td>Priority</td>
                            <td>
                                This use case represents the most accessible of the DER use cases we have, given that we believe we have most of the concepts required to support this. Starting from an individual instrument, to ensure that we can report on a single instrument, then on counterparties to a single instrument, and then expanding from there, we can demonstrate value with what is currently available in FIBO DER.
                            </td>
                        </tr>

                        <tr>
                            <td>Stakeholders</td>
                            <td>
                                Stakeholders include: internal front office, back office, and compliance teams that need to understand current positions at any point in time, broker/dealers and swap execution facilities who need to understand the portfolios they manage, SDRs, clearing houses, exchanges, and others that consume and aggregate reporting content provided to them, and regulators that need to analyze and oversee the market
                            </td>
                        </tr>

                        <tr>
                            <td>Description</td>
                            <td>
                                This use case involves specifying the concepts and terminology required for reporting on derivatives, both generally, across all kinds of derivatives, and specific to the most common derivatives in the marketplace to facilitate reporting about them. The level of detail depends on the specific reporting requirements, outlined in the usage scenarios, below. Initial targets include swaps - interest rate and commodity swaps, options, futures and forwards, and various asset-backed securities. Note that transformations from/to the ESMA / ISO 20022 format in the EU (or at least, CPMI IOSCO), and to the CFTC format in the US, may be needed to support this kind of reporting, and possibly the ACTUS contract definitions of some of the terms of these contracts. These various formats all lead to some understanding of what terms should be included to identify derivative contracts and what variants should be included in order to provide basic coverage.
                            </td>
                        </tr>

                    </table>
                </div>

                <!--         -->

                <h3 id="DER-CPTY-EXP">
          <span>Counterparty exposure in a derivatives trading network</span>
        </h3>

                <div class="table-responsive">
                    <table class="table table-style-grey">
                        <tr>
                            <th colspan=2>I. Use Case Description</th>
                        </tr>

                        <tr>
                            <td>Use Case Name</td>
                            <td>
                                Counterparty exposure in a derivatives trading network
                            </td>
                        </tr>

                        <tr>
                            <td>Use Case Identifier</td>
                            <td>
                                DER-CPTY-EXP
                            </td>
                        </tr>

                        <tr>
                            <td>Source</td>
                            <td>

                                <a href="https://wiki.edmcouncil.org/display/DER/Use+case%3A+DER-Counterparty+Exposure" v-on:click="outboundClick('https://wiki.edmcouncil.org/display/DER/Use+case%3A+DER-Counterparty+Exposure')">Derivatives FIBO Content Team</a>
                            </td>
                        </tr>

                        <tr>
                            <td>Point of Contact</td>
                            <td>
                                <a href="mailto:fibo@edmcouncil.org?subject=use case: DER-CPTY-EXP&body=Hi! I'd like to learn more about this use case.">EDMC FIBO Team</a>
                            </td>
                        </tr>

                    </table>
                </div>

                <div class="table-responsive">
                    <table class="table table-style-grey">
                        <tr>
                            <th colspan=2>II. Use Case Summary</th>
                        </tr>

                        <tr>
                            <td>Goal</td>
                            <td>
                                Counterparty exposure is one aspect of managing risk related to derivatives reporting, as one of many requirements related to regulatory reporting on risk. It involves knowing who your counterparties are and rolling up the risk across legal entities under various scenarios - based on parameters required for stress testing. Clearly organizations need to understand their counterparty exposure regardless of the reporting requirement. Companies have many subsidiaries and complex relationships, and understanding total exposure across legal entities can be difficult at best. The goal is to show how to use FIBO to demonstrate total exposure to a given counterparty.
                            </td>
                        </tr>

                        <tr>
                            <td>Requirements</td>
                            <td>
                                <p class="text">Regulators are concerned with understanding the networks of counterparties, whereas in this case, typically an institution would act as one counterparty to the instruments on their books. Exposure, in this case, is intended to be from the perspective of a given counterparty, such as a majority stakeholder, minority stakeholder, or other owner, including a specific institution. Understanding exposure involves percent ownership, what the risk in a given subsidiary might be, what happens if the subsidiary goes under but the parent does not, backing / recourse behind such situations, etc.</p>

                                <p class="text">Another concern is to understand what is going on between counterparties, between traders, and so forth, where an institution or trader might be part of a network, especially in cases where a given trader uses multiple accounts to avoid certain reporting requirements, for example. Institutions need to understand the networks that their traders participate in as well, to make sure that they are not exceeding position limits or exposure requirements. They also need to understand counterparties from an ownership and control perspective to understand overall exposure to a higher-level organization.</p>
                            </td>
                        </tr>

                        <tr>
                            <td>Scope</td>
                            <td>
                                <p class="text">Counterparty exposure could be viewed from a number of perspectives, building on the reporting use case:
                                </p>

                                <ol>
                                    <li>(1) from the perspective of an institution, to be able to understand their exposure in aggregate, or with respect to a given counterparty including its ownership and control relations, or with respect to a given trader or group of traders, for derivatives (including futures and swaps, among others) and spot market instruments on their books, </li>

                                    <li>(2) similarly, from the perspective of a broker/dealer, to be able to understand their exposure in aggregate, or with respect to a given counterparty including its ownership and control relations, or with respect to a given trader or group of traders for the derivatives and spot market instruments they manage and/or own, whether they are on their own books or those of their clients,</li>

                                    <li>(3) from the perspective of an SDR, exchange, clearing house, or other recipient, to understand their clients' exposure in aggregate, or with respect to a given counterparty including its ownership and control relations, or with respect to a given trader or group of traders from which they receive counterparty information, and be able to spot issues in those networks and report them back to their clients and/or to the regulators in a timely way,</li>

                                    <li>(4) from the perspective of a regulator or other organization receiving information from a variety of sources that are not aligned with one another, to have the ability (1) to understand exposure in various networks of counterparties, including drilling down to the trader level, where those traders might be using multiple accounts across multiple institutions to spread their trades, whereby they may exceed position limits or other exposure requirements (whether or not they do so on purpose), and (2) to aggregate counterparty risk across groups of institutions, groups of traders, markets, and so forth.</li>
                                </ol>
                            </td>
                        </tr>

                        <tr>
                            <td>Priority</td>
                            <td>
                                This use case follows from the regulatory reporting use case, but requires additional content in FIBO to support understanding exposure, and in particular, counterparty exposure.
                            </td>
                        </tr>

                        <tr>
                            <td>Stakeholders</td>
                            <td>
                                Executives within financial control / risk, anyone within the risk organization responsible for identifying counterparty risk, chief risk officer and other C-level executives, board of directors, regulators ...
                            </td>
                        </tr>

                        <tr>
                            <td>Description</td>
                            <td>

                                <p class="text">For the purposes of this use case, the following definitions apply:</p>
                                <ul>
                                    <li>counterparty - 'in the event that a contract identifies either party to that contract as being the principal, this is the other party to that contract'
                                        <ol>
                                            <li>there can be multiple parties to a contract, rather than simply two, so this definition, which is truly central to everything we are doing, needs revision to at least include multiple parties vs. the principal</li>
                                        </ol>
                                    </li>
                                    <li>exposure - 'the extent to which an individual or organization is unprotected and open to damage, danger, risk of suffering a loss, or uncertainty'</li>
                                    <li>financial exposure - 'the extent to which an individual or organization is open to risk of suffering a loss in a transaction, or with respect to some investment or set of investments, e.g., some holding; the amount one stands to lose in that transaction or investment' The latter, financial exposure, is what we are talking about with regards to this use case, and includes obligations as well as investments (perhaps the definition should be amended to include that).</li>
                                </ul>

                                <p class="text">The use case that consists of analyzing, assessing or measuring “counterparty exposure”, is -- owing to the variety of dimensions and facets of both of the two primary domains that make up the topic (i.e., “counterparties” and “exposure”) – itself a potentially very robust and broad use case by virtue of the large number of cross-products of the dimensions and facets inherent with the combination of those two principle domains.</p>

                                <p class="text">In order to better manage the elaboration of this use case, it would be useful to understand the types, and depth of detail, regarding the dimensions and facets that comprise “counterparty exposure”. Two approaches to the effective examination of counterparty exposure use case could be taken: (1) in which the number of factors and dimensions are purposely constrained in order to be able to feasibly consider a broad and inclusive treatment of counterparty exposure by limiting the depth of the classifications, or (2) a more narrowly scoped use case that would consider, in greater detail and depth, a specific example of counterparty exposure that would be limited to a particular type of counterparty and a particular type of exposure.</p>

                                <p class="text">Given the definition of “counterparty exposure in a derivatives trading network”, this use case is perhaps best described as something between (1) and (2) above, having both some broader aspects as well some more narrow ones.</p>

                                <p class="text">What are the appropriate dimensions and facets of the ‘counterparty’ domain to consider for this use case? These could perhaps be first grouped into what might be called ‘horizontal’ and ‘vertical’ dimensions: the ‘horizontal’ aspect pertaining to the classification of different types of counterparties, and the ‘vertical’ one that considers where in a hierarchy of related counterparties does a counterparty sit? </p>

                                <p class="text">Given the ‘derivatives trading’ sector of the use case, the type of counterparties that would be relevant would consist primarily of “central banks”, “commercial banks”, “clearing organizations”, “municipal jurisdictions” and “private companies”, since any of those entities could be counterparties to derivative transactions. “Retail consumers” would not be included since derivative contracts almost never involve individuals. Furthermore, if the focus is truly on counterparty exposure (as in, risk), then one would conceivably omit regulatory reporting, as the focus and objective of regulatory reporting is primarily on systemic risk and financial system stability. </p>

                                <p class="text">If we consider the ‘vertical’ (i.e., hierarchical or relationship) counterparty dimension, then the aggregation of counterparty exposure up organizational hierarchies (whether private or public) could conceivably bring some measure of counterparty exposure at an aggregate or systemic level into consideration. This is somewhat counter-intuitive, however, since a network or systemic measure of counterparty exposure is a very different type of metric than, say, the set of counterparty exposures of a single entity vis-a-vis its immediate counterparties.</p>

                                <p class="text">When it comes to the “exposure” topic itself, the classification dimensions and facets become much more varied and numerous. </p>

                                <p class="text">There is, of course, the exposure to a single derivative contract. Since derivative contracts are inherently customizable, there are also a substantial number of different derivative contract types. Furthermore, an entity can have many, many derivative contracts with another single entity (consider those between one large commercial bank and another large commercial bank). </p>

                                <p class="text">And, as is the widespread practice in measures of exposures (and credit risk), factors such as the related industry sector, geopolitical domicile, currency, market reference rates, and/or interest reference rates that are contained in derivative contracts -- and, importantly, properties of the counterparty on the other side of the contract -- are all relevant to counterparty exposure.</p>

                                <p class="text">Hence, “counterparty exposure in a derivatives trading network” is a fairly robust use case, even with limitations and restrictions.</p>
                            </td>
                        </tr>

                    </table>
                </div>

                <!--         -->

                <h3 id="IND-EFT-DEV">
          <span>Index analysis for ETF development</span>
        </h3>

                <div class="table-responsive">
                    <table class="table table-style-grey">
                        <tr>
                            <th colspan=2>I. Use Case Description</th>
                        </tr>

                        <tr>
                            <td>Use Case Name</td>
                            <td>
                                Index analysis for ETF development
                            </td>
                        </tr>

                        <tr>
                            <td>Use Case Identifier</td>
                            <td>
                                IND-EFT-DEV
                            </td>
                        </tr>

                        <tr>
                            <td>Source</td>
                            <td>

                                <a href="https://wiki.edmcouncil.org/display/IND/Use+case%3A+IND-EFT-DEV" v-on:click="outboundClick('https://wiki.edmcouncil.org/display/IND/Use+case%3A+IND-EFT-DEV')">Indices and Indicators FIBO Content Team</a>
                            </td>
                        </tr>

                        <tr>
                            <td>Point of Contact</td>
                            <td>
                                <a href="mailto:fibo@edmcouncil.org?subject=use case: IND-EFT-DEV&body=Hi! I'd like to learn more about this use case.">EDMC FIBO Team</a>
                            </td>
                        </tr>

                    </table>
                </div>

                <div class="table-responsive">
                    <table class="table table-style-grey">
                        <tr>
                            <th colspan=2>II. Use Case Summary</th>
                        </tr>

                        <tr>
                            <td>Goal</td>
                            <td>
                                Enable development of a new fund whose performance can be compared to a benchmark
                            </td>
                        </tr>

                        <tr>
                            <td>Scope</td>
                            <td>
                                Coverage is limited to equity indices rather than indices that include bond, credit, or commodities indices or economic indicators for this use case.
                            </td>
                        </tr>

                        <tr>
                            <td>Stakeholders</td>
                            <td>
                                Traders who will be trading the fund based on the index, Compliance/Risk (for managing risk related to the fund), Clearing and Settlement Team (for trades related to the fund), Finance Team (for managing the fund flows if there are trades happening), Index Administrator, external stakeholders such as market data providers
                            </td>
                        </tr>

                        <tr>
                            <td>Description</td>
                            <td>

                                <p class="text">A business analyst/front-office salesperson is interested in selecting one or more equity indices as the basis for predicting/comparing the performance of a new exchange-traded fund (ETF). This may require understanding the make-up of a benchmark based on a balance of small, medium, and large cap organizations, overall performance during some prior period, based on a mix of national and international instruments, based on avoiding being overly exposed to a single sector, company, or country, etc. in order to meet the performance goals of the fund, however the goal of this use case is for limited comparison. In other words, we will not necessarily create a number of sector classification schemes for this use case. In general, the goal is either for the fund to track the index or for its performance to exceed that of the index.</p>

                                <p class="text">This means being able to describe 10- 15 benchmarks that are commonly used, without detailed sector classification, but sufficient to distinguish one major index from another. This initial use case involves limiting the scope to equities only. We will create a subsequent use case to cover bond/debt indicies. We will only use content that is published about each of the indexes, and avoid assumptions about classification schemes (at least, in depth classification) for the purposes of this use case.</p>

                                <p class="text">Indices under consideration include: </p>

                                <ol>
                                    <li>Standard & Poor’s Composite Index of 500 Stocks (S&P 500)</li>
                                    <li>The Nasdaq Composite Index</li>
                                    <li>Morgan Stanley Capital International’s (MSCI) Europe, Australasia, Far East (EAFE) Index</li>
                                    <li>Value Line Composite Index (stocks)</li>
                                    <li>Russell 2000 Index (small-cap stocks)</li>
                                    <li>Dow Jones World Stock Market Index (major international markets, including the U.S. market)</li>
                                    <li>Wilshire 5000: U.S. Broad Market</li>
                                </ol>

                                <p class="text">The goal of this use case is to provide references to the definitive source for the details of how any of these indices is composed at some point in time, not to provide reference data for these indices and maintain it. Any individuals developed that provide example reference data will necessarily represent it as a snapshot for examples only, with no intent to maintain that information going forward.</p>
                            </td>
                        </tr>

                        <tr>
                            <td>Actors / Interfaces</td>
                            <td>
                                <p class="text">People: Business Analyst developing the fund, Index Administrator (entity that manages the index), Issuer of the constituents of the index (maybe)</p>

                                <p class="text">Systems:
                                    <ol>
                                        <li>Requirements development tooling (DB uses JAMA) - used to define the requirements for the fund</li>
                                        <li> System where the index data is mastered, may or may not be the same system where the underlying constituent data (for the equities that make up the index) is mastered</li>
                                    </ol>
                                </p>

                                <p class="text">There may be another actor that represents the fund, or another system that needs to access information about the index, in addition to the above.</p>
                            </td>
                        </tr>

                        <tr>
                            <td>Assumptions</td>
                            <td>
                                <p class="text">The business analyst has a template for defining the contents of the fund provided by their organization that allows them to vary the index based on desired goals. For every index, information about the stocks that participate in the index must be provided (i.e., the list of stocks). If there are derivatives based on the benchmark, then links to those derivatives must be provided (all done by the reference data team).</p>
                            </td>
                        </tr>

                    </table>
                </div>

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
        name: 'useCases',
        components: {},
        methods: {
            outboundClick,
            outboundLinkClick,
        },
    };
</script>

<style lang="scss" scoped>

</style>