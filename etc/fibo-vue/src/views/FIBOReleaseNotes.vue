<template>
    <div class="container">
        <main>
            <article>

                <h1>
                  <span>FIBO Release Notes</span>
                </h1>
                <p class="text"><b>2019</b></p>
                <ul>
                  <li><a href="#2019Q4">2019 Q4</a></li>
                  <li><a href="#2019Q3">2019 Q3</a></li>
                  <li><a href="#2019Q2">2019 Q2</a></li>
                  <li><a href="#2019Q1">2019 Q1</a></li>
                </ul>
                <p class="text"><b>2018</b></p>
                <ul>
                  <li><a href="#2018Q4">2018 Q4</a></li>
                  <li><a href="#2018Q3">2018 Q3</a></li>
                  <li><a href="#2018Q2">2018 Q2</a></li>
                  <li><a href="#2018Q1">2018 Q1</a></li>
                </ul>
                <p class="text"><b>2017</b></p>
                <ul>
                  <li><a href="#2017Q4">2017 Q4</a></li>
                  <li><a href="#2017Q3">2017 Q3</a></li>
                </ul>                

                <h1>
                  <span>@@@</span>
                </h1>

                <h3 id="2019Q4"><strong>2019 Q4</strong></h3>
                <h4>Foundations</h4>
                <p class="text"><em>Highlights</em></p>
                <p>Changes this quarter were mainly in support of other domain areas, including clean up of a few definitions and merging/eliminating the informative Time and Math ontologies, which were confusing to users.</p>
                
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>"FND" has been removed from &lt;owl:imports rdf:resource="https://spec.edmcouncil.org/fibo/ontology/FND/FND/DatesAndTimes/FinancialDates/"/&gt;</li>
                    <li>FND-225 hasNotionalAmount Expanded explanatory note to describe a wider range of potential uses of this property for different instrument types, based on available sources, and corrected it from wrongly being styled as an editorial note. Restyled the definition to capture the essential intended nature of this relationship, removing the near-circularity in which nominal was substituted for notional in previous drafts.</li>
                    <li>FND-225 Revision to proposed definition in FND-225 (remove redundant account of monetary amount) and addition of explanatory note for usage of this concept in derivatives markets.</li>
                    <li>FND-225 updated definition of hasNotionalAmount to remove circularity, using suggested wording in place of the offending part of the definition and retaining the rest, in FND/Accounting/CurrencyAmount</li>
                    <li>FND-229 Modified definition of the class CurrencyIdentifier in FND/Accounting/CurrencyAmount.rdf to remove the word trigraph. Also made the definition more generic, to reflect the class as framed by the DL assertions, and changed from the definite to the indefinite article. Modified the explanatoryNote to indicate that this is specific to the kind of CurrencyIdentifier which is an ISO 3166 Currency Identifier. Change to definition in line with recommendation on the pull request comments</li>
                    <li>FND-265 - eliminate remaining references to the FIBO TimeExt Time ontology and related metadata ontology (#798)</li>
                    <li>FND-266 - eliminated references to the largely redundant Math ontology in MathExt, replacing them with appropriate references from Analytics or other ontologies; eliminated AnalysisCurves, also duplicative of the Analytics ontology; eliminated DebtInterestAmounts and DebtRedemptionAmounts that were largely redundant with the FBC Debt ontology or related DebtInstruments and Bonds ontologies (and were extensions of the Math ontology) (#799)</li>
                    <li>FND-267 - corrected URI for explanatoryNote on hasNotionalAmount; revised metadata for the ontology as needed (#806)</li>
                </ul>
                <h4>Financial Business and Commerce</h4>
                <p class="text"><em>Highlights</em></p>
                <p>Changes this quarter include: (a) additional work on the provisional credit ratings and credit events based on use case requirements from IND-EFT-DEV (for credit events) and user feedback, (b) revision of market identifiers (MIC codes) to reflect the 12/6/2019 update by ISO, and (c) miscellaneous bug fixing.</p>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>FBC-208 - additional clean-up in order to move both the credit events and credit ratings ontologies further along towards release</li>
                    <li>FBC-208 - additional clean-up of definitions and property names</li>
                    <li>FBC-227 - added financial asset as a parent of letter of credit (#796)</li>
                    <li>FBC-234 - revised MIC codes and business centers per the December 6th update made by ISO (#797)</li>
                    <li>FBC-208 - added basic downgrade, made hard and soft credit events disjoint, corrected spelling error</li>
                    <li>FBC-208 - fixed explanatory note</li>
                    <li>FBC-208 - update to some of the definitions in the credit events ontology</li>
                    <li>FBC-208 - initial pass at cleaning up credit events so that we can publish it along with basket indices</li>
                    <li>FBC-233 - Revised the ClientsAndAccounts ontology to eliminate the disjointness between a deposit account and investment account to allow for certain portfolio management accounts that have characteristics of both. (#781)</li>
                </ul>
                <h4>Indices and Indicators</h4>
                <p class="text"><em>Highlights</em></p>
                <p>Changes this quarter were mainly to support the IND-EFT-DEV use case, the goal of which is to support representation of market index data sufficient for analytics by financial institutions that monitor various indices and their make-up internally, that manage various funds based on those indices, and so forth. The revisions include, but are not limited to: adding support for weighted baskets and weighting functions, further work on representing filters for baskets, and preliminary development of examples that FIBO users can leverage to build out internal models for index analysis and management.</p>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>IND-11 - additional revisions needed to pull the basket indices ontology up to date for IND-EFT-DEV</li>
                    <li>IND-11 - partial revisions to better represent an index per the IND-EFT-DEV use case</li>
                    <li>IND-81 - added the concept of a weighted basket and weighted basket constituent to support the definition of market indices in IND</li>
                    <li>IND-81 - adds the concepts of weight and weighting function to the analytics ontology for use in defining the various weighing functions used to calculate the weighted value that a given security contributes to some index (e.g., price weighted, market cap weighted, revenue weighted, float adjusted, etc.)</li>
                    <li>IND-81 - revised the example for a weighting function to simplify it and make it more understandable</li>
                    <li>IND-81 - revised the weight to be a property rather than class</li>
                    <li>IND-89 - eliminated basket constituent hierarchy issues (#804)</li>
                </ul>
                <h4>Securities</h4>
                <p class="text"><em>Highlights</em></p>
                <p>Changes this quarter were made primarily in support of the SEC-02 use case, the goal of which is to support representation of instrument data for market traded instruments, for regulatory purposes, for decision making, or for portfolio management. The use case specifically targets the subset of security master file data that might be published by an exchange. Revisions include, but are not limited to: differentiating the concept of a security from a listing of that security, representation of additional key properties of listings, cleaning up definitions and terminology that has been superseded by recent work, and adding a preliminary example that we can use for further testing and as the basis for more revisions in Q1.</p>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>SEC-101 - removed asymmetric relation on isSeniorTo due to reasoning issues</li>
                    <li>SEC-106 - added a property, hasIssue, to link a market listing (exchange traded security) to the more general issue; incorporated an example for Wells Fargo common stock to show how this works, and an 'all file' to facilitate review in Protege</li>
                    <li>SEC-106 - added inheritance for hasIssue</li>
                    <li>SEC-106 - modified example individuals to remove property values from exchange-specific share that belong on the common share</li>
                    <li>SEC-106 - revised hierarchy for common and exchange-specific shares to move registration details to common shares</li>
                    <li>SEC-106 - revised restriction with respect to dividend payments to make it optional; fixed definitions to eliminate leading article</li>
                    <li>SEC-106 - revised top-level XML catalog to match current configuration</li>
                    <li>SEC-109 - replaced property 'hasFloatingSupply' with 4 properties: hasFloatingShares, hsIssuedShares, hasOutstandingShares, and hasTreasuryShares with proper definitions</li>
                    <li>SEC-96 - address missing labels and definitions caught during hygiene testing</li>
                    <li>SEC-96 - initial pass at revising properties and definitions per the SEC-96 issue</li>
                    <li>SEC-96 - restructure the definition of a listing, separate characteristics of the listing from those of the security, simplify naming throughout and provide more consistent definitions</li>
                    <li>SEC-96 - moved restriction w.r.t. last trading date / time from ExchangeTradedSecurity to ListedSecurity, per discussion</li>
                    <li>SEC-96 - renamed SecurityListing to Listing and augmented it with a number of characteristics per this issue resolution, moved some restrictions from exchange-traded security to listed security, made notional financial marketplace and security listing deprecated, etc.</li>
                    <li>SEC-98 revised the way that dividends are defined, such that they can reflect multiple payments, various schedules, etc. revised the definition and added special dividend (#794)</li>
                    <li>SEC-101 - made isSeniorTo transitive and asymmetric</li>
                    <li>SEC-101 - made isSeniorTo transitive and asymmetric</li>
                    <li>SEC-102 - revised the definition of precedence right</li>
                    <li>SEC-102 - revised the definition of precedence right</li>
                    <li>SEC-108 - improved the definition of corporate bond based on discussion; added explanatory notes to distinguish a corporate bond from commercial paper, kinds of bonds that are considered corporate bonds (#801)</li>
                    <li>SEC-109 - replaced property 'hasFloatingSupply' with 4 properties: hasFloatingShares, hasIssuedShares, hasOutstandingShares, and hasTreasuryShares with proper definitions (#802)</li>
                    <li>SEC-111 - merged the redundant 'securities exchange' concept with 'exchange' (#795)</li>
                    <li>SEC-114 - moved the restriction for isTradedOn from ListedSecurity to Listing; revised the example individuals to reflect this and added the currency to the listing for WF common stock as traded on the NYSE (#800)</li>
                </ul>
                <h4>Infrastructure</h4>
                <p class="text"><em>Highlights</em></p>
                <p>Update FIBO viewer to have more functionality from FIBOpedia and FIBO Glossary.</p>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>INFRA-468 - preserve the search query when opening/closing the searchBox</li>
                    <li>INFRA-468 - there was no action on click in search result link</li>
                    <li>INFRA-468 - double click on graph element redirected to URL with ?query=</li>
                    <li>INFRA-468 - do not show the selected option in list of hints</li>
                    <li>INFRA-468 - removed green background in searchBox hint list</li>
                    <li>INFRA-480 Update FIBO website (open FIBO model content) - Main menu structure updated - added content for "Ontology.vue" page</li>
                    <li>INFRA-468 - scroll to top of ontology on page load</li>
                    <li>INFRA-468 Introduce FIBO Viewer functional changes - added "Description" in search results - after searching the click on ontology tree didn't work - after searching the clikck on result didn't scroll to top - external ontologies in search results should be by "?query=" Introduce FIBO Viewer functional changes - fixed searchResults layout - fixed searchBox layout - Move the FIBO Viewer list of modules left &amp; expand all gray fileds. - fixed: scrolling to the top didn't work after doubleClick on diagram - fixed: scrolling to the top didn't work when we clicked on links in "grey boxes" on the right side of the tree fix containerName in dockerScript.groovy After clicking any link in FIBO Viewer, the Viewer page should look like in 7.png; so the top of the page should be just below the slider. Change the IRI scheme of FIBO Viewer</li>
                    <li>FIBO-97 Implement search functionality for FIBO Viewer - searchBox and its functionality (TODO: the layout) Solve modules display problem 1) Expand tree to the specific ontology opened 2) Make only one branch to be open (or module to be underlined) fix for HTTP/HTTPS MixedContent Change the IRI scheme of FIBO Viewer</li>
                    <li>INFRA-467 Apply FIBO website changes - Please remove the website: https://spec.edmcouncil.org/fibo/linked-data-fragments Also ref to the page from the top menu; it is located under "DOCUMENTATION".</li>
                    <li>INFRA-466 GA implementation on sec.edmcouncil.org website Links to be tracked only for links on the webpages in the DOWNLOADS (top menu) section (minus FIBO glossary).</li>
                    <li>INFRA-296 Query for ontology with ending /</li>
                    <li>INFRA-296 Add error handling</li>
                    <li>INFRA-296 Allow parsing query as uri properties</li>
                    <li>INFRA-296 Update viewer to latest backend changes</li>
                    <li>INFRA-296 Create About files using the instructions on the Dev Guide</li>
                    <li>[INFRA-445] Add page tracking for GA</li>
                    <li>Links to LoadFIBOxxx added. AboutFIBOxxx changed into LoadFIBOxxx. Change ontology url for testing purposes Links to LoadFIBOxxx added. AboutFIBOxxx changed into LoadFIBOxxx.</li>
                </ul>

                <h3 id="2019Q3"><strong>2019 Q3</strong></h3>
                <h4>Derivatives</h4>
                <p class="text"><em>Highlights</em></p>
                <p>Clean up ontologies to remove circular dependencies.</p>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>DER-63 - eliminated circular dependency between commodity forwards and commodities delivery by merging the two ontologies; integrated commodities with precious metals in FND (#741)</li>
                    <li>DER-63 fibo-der-com-del;CommodityCashCloseout to fibo-der-com-fwd;CommodityCashCloseout</li>
                    <li>DER-63 fibo-der-com-del;CommodityForwardDelivery to fibo-der-com-fwd;CommodityForwardDelivery</li>
                    <li>DER-63 fibo-der-com-del;CommodityPhysicalDelivery to fibo-der-com-fwd;CommodityPhysicalDelivery</li>
                </ul>
                <h4>Financial Business and Commerce</h4>
                <p class="text"><em>Highlights</em></p>
                <p>Two major updates this quarter:</p>
                <ul>
                    <li>Integrate new postal addressing models, covering US and international</li>
                    <li>Update MIC codes to correspond to recent ISO 10383 release</li>
                </ul>
                <p>This release also included fixes to minor errors in labels and URIs.</p>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>FBC-226 - Integrate new postal addressing (U.S Publication 28 specific) content into FBC, including but not limited to the government entities for the U.S. Postal Service</li>
                    <li>FBC-226 - added international address, labels in Spanish in some cases, details for a Puerto Rico address (needs additional supplemental address components for condominiums, certain other residential details), details for some addresses other than conventional addresses (e.g., rural route, highway contract route, etc.)</li>
                    <li>FBC-226 - corrected URI for Classifier and added restriction for street sufix on street address</li>
                    <li>FBC-226 - corrected URI, revised additional street suffix representations M-O</li>
                    <li>FBC-226 - preliminary commit of the new US postal service and addressing ontology (missing urbanization, Puerto Rican addresses, international addresses, and most street suffixes)</li>
                    <li>FBC-226 - refactored street suffixes from O thru Z, added preferred abbreviations for US states and territories per Pub 28</li>
                    <li>FBC-226 - revised cardinality restriction on street suffix</li>
                    <li>FBC-226 - revisions to suffixes to mitigate duplication of Key, individual formatting updates, from G-L</li>
                    <li>FBC-226 - simplify the address hierarchy by deprecating PostalAddress, which was hardly used, in favor of PhysicalAddress</li>
                    <li>FBC-226 - simplify the set of restrictions on DeliveryAddress and its children, since several apply to all of the children</li>
                    <li>FBC-228 - corrected label on packaged financial product (#749)</li>
                    <li>FBC-229 - corrected imports for LCC ontologies (#754)</li>
                    <li>FBC-229 - revision to the business centers and exchange codes corresponding to the Aug 2019 update to the ISO 10383 MIC codes</li>
                    <li>FBC-229 - revision to the business centers and exchange code&hellip;</li>
                    <li>FBC-231 - revised business centers to support the 9/2019 MIC codes update (added Boca Raton, minor other corrections)</li>
                    <li>FBC-231 - updated ISO MIC codes as of 9/6/2019</li>
                </ul>
                <h4>Foundations</h4>
                <p class="text"><em>Highlights</em></p>
                <p>This release includes widespread elimination of deprecated entities, to prepare for FIBO 2.0 baseline. Other highlights include:</p>
                <ul>
                    <li>Updates to Values based on consistent treatment of datatypes across FIBO</li>
                    <li>Updates to simplify Contracts</li>
                    <li>Adjustments to correspond with requirements from Ratings</li>
                </ul>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>FND-104 in FND/Utililties/Values.rdf change all occurrences of the hasValue FIBO property to hasDataValue and update label and definition references; in FND/TimeExt/Time.rdf change one reference to hasValue to hasDataValue; in LOAN/LoanExt/LoanGeneric change 2 references to hasValue to hasDataValule</li>
                    <li>FND-104 in FND/Utilities/Values.rdf renamed hasValue to hasDataValue</li>
                    <li>FND-209 in MD/TemporalCore/SecurityTradingStatuses.rdf remove the equivalent class indication for the class Security (which is itself in another ontology,untouched). No impact on references or other material expected. (#761)</li>
                    <li>FND-221 - replaced hasPrincipal with hasPrincipalParty in contracts in FND to avoid having two properties with the same name and distinct meanings (#734)</li>
                    <li>FND-226 incorporating the remaining actions in the resolution of FND-224 (Contracts). In FND/Agreements/Agreements.rdf changed the definition to reflect the model semantics, removed the explanatory notes that qualified the previous, inapplicable definition and removed the definition origin as this no longer applies. In FND/Agreements/Contracts, added an explanatory note describing the nature of a contractual relationship and asserting how parts of those requirement are met by inheritance from Agreements now that the concept is as defined in this issue resolution. (#764)</li>
                    <li>FND-233 - added a usage note to hasRelatedPartyInRole and eliminated a restriction and overly constrained subclass relationship on LoanOriginator</li>
                    <li>FND-233 - added new party identifier and scheme, and new hasRelatedParty property to the parties ontology; adjusted other ontologies to leverage these additions, and eliminated references to remaining PartyExt ontologies which were no longer needed</li>
                    <li>FND-233 - address feedback that the names 'party identifier', 'party identification scheme' and 'has related party' were ambiguous and should include 'party-in-role' to be more precise</li>
                    <li>FND-256 - This adds the concept of an assessment report, needed for ratings as well as other kinds of assessments, such as valuation and appraisal reports which loans depend on, and cleans up the definition of assessment activity to correspond to the definition of assessment event</li>
                    <li>FND-256 - additional adjustments based on FCT final review, revised status for assessments and ratings to release for formal integration into FIBO</li>
                    <li>FND-256 - additional modifications / simplifications to the assessments ontology after discussion with ratings team; simplifications and revisions to the ratings ontology as per the same discussions, reflecting work by the ratings FCT over the last several weeks</li>
                    <li>FND-256 - corrected hygiene issue with inverse property</li>
                    <li>FND-257 - replaced hasDefinition with isDefinedIn to clarify intent based on feedback from users due to confusion they had with respect to this property (#740)</li>
                    <li>FND-257 migrated fibo-fnd-rel-rel;hasDefinition to fibo-fnd-rel-rel;isDefinedIn</li>
                    <li>FND-260 - adds two properties - hasBestMeasure and hasWorstMeasure, as subproperties of hasMeasureWithinScale, to indicate the most and least desirable potential values for some rating on a given scale that can be used to assess where along that scale some rating falls</li>
                    <li>FND-261 - eliminate all uses of deprecated elements in FIBO, across all ontologies, for the FIBO 2.0 Baseline</li>
                    <li>FND-262 - remove references to USPS ontologies that are not yet integrated into Dev</li>
                    <li>FND-263 - eliminated default URIs in ontologies (#768)</li>
                </ul>
                <h4>Securities</h4>
                <p class="text"><em>Highlights</em></p>
                <p>The main update to Securities this quarter is the addition of Bonds. Other changes were in support of this major update.</p>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>SEC-103 - moved a number of concepts to ABS from Bonds that were more appropriate for structured instruments</li>
                    <li>SEC-103 - revised properties to eliminate duplicates, revise names to be verbs, added/revised definitions as appropriate</li>
                    <li>SEC-103 - updated all files and top-level catalog, which did not work using AboutFIBOProd or AboutFIBODev (missing ontologies, extra ontologies, incorrect URIs, etc.)</li>
                    <li>SEC-103 - updated metadata to include contributors for Bonds and Traded Short-Term Debt</li>
                    <li>SEC-105 - addressed several final comments related to the release of the Bonds ontology (#765)</li>
                    <li>SEC-85 - added ticker symbol to securities identification, deprecated 'publicly traded share' in favor of 'exchange specific share'</li>
                    <li>SEC-85 - changed named individuals for securities identifiers to classes</li>
                    <li>SEC-85 - migrated fibo-sec-eq-eq:PubliclyTradedShare fibo-sec-eq-eq:ExchangeSpecificShare</li>
                    <li>SEC-86 - corrected label on ticker symbol (#744)</li>
                    <li>SEC-89 - eliminate remaining references to share terms (and the ontology itself)</li>
                    <li>SEC-89 - merged EquityInstruments and ShareTerms ontologies to simplify namespace management</li>
                    <li>SEC-91 - modified isIssuedIn to be isIssuedOn, loosened restrictions on securities exchange to include exchanges more generally</li>
                    <li>SEC-91 - modified isIssuedIn to be isIssuedOn, loosened rest&hellip;</li>
                </ul>
                <h4>Infrastructure</h4>
                <p class="text"><em>Highlights</em></p>
                <p>In 2019 Q2, we released a new web site. It still points to the same products, but now with a styling and look-and-feel that is more in alignment with the main EDMC website.</p>
                <p>&nbsp;</p>
                
                <h3 id="2019Q2"><strong>2019 Q2</strong></h3>
                <h4>Business Entities</h4>
                <p class="text"><em>Highlights</em></p>
                <p>This quarter&rsquo;s BE updates were primarily (1) migrate remaining, relevant content that was originally in informative BE ontologies to various other ontologies (and thus eliminate the remaining obsolete informative ontologies), and (2) fix reasoning errors related to government entities.</p>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>BE-202 - eliminated references to BE/FunctionalEntitiesExt ontologies now that their contents have been merged into other ontologies as appropriate</li>
                    <li>BE-202 - integrated content from informative ontologies in BE/FunctionalEntitiesExt into the ontologies where those concepts were used</li>
                    <li>BE-203 - eliminated reasoning error which was caused by two separate but somewhat related issues: (1) an extra blank node in a reasoning loop for definining a government minister in unnecessary restrictions and (2) the fact that there were two ways to get to the same individual defining the legal entity for the government body, which is fine, but there were two tags on it as a result, and hasTag was incorrectly defined as being functional. If you can get to an individual that has a tag in more than one way, it can't be functional. And, anything that can be identified by more than one identifier could inadvertently also run into this problem. (#727)</li>
                </ul>
                <h4>Financial Business and Commerce</h4>
                <p class="text"><em>Highlights</em></p>
                <ul>
                    <li>adding the concept of an exempt security in support of ongoing work in SEC/Debt,</li>
                    <li>moving certain individuals around to improve modularity and reasoning performance, and</li>
                    <li>cleaning up the logic related to baskets and registries as indicated through additional testing.</li>
                </ul>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>FBC-103 - added the definition of exempt security, which is required for some of the definitions in the bonds and traded short-term debt ontologies, to financial instruments and made a registered security disjoint with exempt security (#717)</li>
                    <li>FBC-221 - addressed feedback received in GitHub comments</li>
                    <li>FBC-221 - moved certain registration authority individuals from primary business registries and markets ontologies to a new international individuals ontology to support better modularity and improve reasoning performance when they are not required (time for reasoning with HermiT over the primary ontologies in FND, BE, and FBC, without individuals, was reduced from 30+ minutes to just under 3 minutes as a result)</li>
                    <li>FBC-221 - revised the ontology name from International Financial Organizations to International Registries and Authorities to better reflect its scope</li>
                    <li>FBC-223 - cleaned up logic issues in securities identification individuals, eliminating reasoning issues, adjusted definitions for ISO 704 compliance and added missing definitions</li>
                    <li>FBC-223 - initial pass at unwinding a logic issue related to baskets and registries in some ontologies that extend these concepts</li>
                </ul>
                <h4>Foundations</h4>
                <p class="text"><em>Highlights</em></p>
                <p>Most of the work performed in FND this quarter involved integration and/or elimination of informative ontologies that were largely duplicative. However, there were a few changes of note:</p>
                <ul>
                    <li>the addition of new assessments and ratings ontologies, which are now released,</li>
                    <li>the addition of a new combined date time datatype that is useful for mapping knowledge graphs to back-end data stores whose representation of dates and times is inconsistent, and</li>
                    <li>the addition of identifiers associated with certain identity documents in support of data privacy and knowledge graph integration/interoperability use cases.</li>
                </ul>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>FND-240 - loosens the restrictions on certain date time properties to use the new combined date time datatype or its equivalent and as appropriate for representation of acquisition dates and times, sale dates and times, any member of a dated collection, such as a series of dates related to prices in a yield curve, etc.</li>
                    <li>FND-240 - loosens the restrictions on certain date time properties</li>
                    <li>FND-240 - revised change note in Arrangements and definition of Asset per feedback</li>
                    <li>FND-243 - moved the properties 'produces' and 'isProducedBy' from Products and Services (deprecated) to relations (#720)</li>
                    <li>FND-244 - additional commits to finalize elimination of the policy ontology</li>
                    <li>FND-244 - eliminate and/or move references from business goals in the BusinessExt module to other locations where they can be widely used; migrate concepts including hasObjective and BusinessObjective from the LegalPersons ontology to Objectives in FND to facilitate reuse of those concepts more broadly, with primary requirements related to investment objectives and others required for disclosures, risk, fund-related definitions, etc.</li>
                    <li>FND-244 - eliminated remaining references to AgentsContexts from FND/BusinessExt</li>
                    <li>FND-244 - revised the definition of business objective to incorporate a time frame and that it requires resources to execute; added restriction on a time period to the higher-level objective class; moved policy and reporting policy to Legal Capacity and incorporated a restriction indicating that a policy implements a legal construct, goal or objective (note that law and regulation in FBC are subclasses of legal construct, as is duty)</li>
                    <li>FND-246 - augmented the definition of identity document, birth certificate, driver's license and passport to be identified by specific identifiers rather than just have a tag associated with them to enable queries supporting GDPR and other privacy laws</li>
                    <li>FND-246 - eliminated references to the Publications ontology from these 3 ontologies, and changed 'terms set' to 'terms' where it appeared, in line with the naming we've used in the released ontologies, also reduced some of the duplication in properties</li>
                    <li>FND-246 - this commit includes the changes mentioned - i.e., integrating identification schemes</li>
                    <li>FND-248 - cleaned up additional redundancy, references to informative ontologies, and ambiguity where possible</li>
                    <li>FND-248 - corrected hygiene issues</li>
                    <li>FND-248 - eliminated all references to the FND/MathExt/Amounts ontology, including revision of embedded definitions that leveraged concepts from Amounts, such as MD/TemporalCore TimedNumericAmount and a few other time-specific concepts; Note that there is significant work remaining to eliminate the TimeExt and MathExt remaining ontologies, which are on the roadmap but out of scope for this issue resolution</li>
                    <li>FND-248 - eliminated references to the FND/MathExt/Quantities ontology, which was used only in one place and added no value</li>
                    <li>FND-248 - further refinement and elimination of some additional, duplicative properties based on feedback</li>
                    <li>FND-250 - eliminated reference to the assessment definition from the National Education glossary per request</li>
                    <li>FND-250 - revised the assessments ontology to add a reference to assessment activity, clean up the definition a bit, and add the concept of an opinion, needed for ratings</li>
                    <li>FND-250 - revised the assessments ontology to add a referenc&hellip; (#722)</li>
                    <li>FND-251 - eliminate the informative physical ontology, which was only used by other informative ontologies and included concepts that were too abstract to be required in any released ontology (#723)</li>
                    <li>FND-252 - addressed missing definition for hasExerciseTerms</li>
                    <li>FND-252 - corrected hygiene issues (missed references)</li>
                    <li>FND-252 - eliminated references to PublicationsExt in exchange traded options ontologies; merged exchange traded options, options exchanges, and options standardized terms to eliminate circularities and duplications</li>
                    <li>FND-252 - eliminated references to the PublicationsExt ontology in DER/ExchangeTradedDerivatives futures ontologies, and eliminated circular dependencies between the 3 futures ontologies by merging them, eliminating a number of duplicate properties, reusing concepts from the DerivativesBasics ontology</li>
                    <li>FND-252 - eliminated remaining references to the PublicationsExt ontologies</li>
                    <li>FND-252 - further revisions to the exchange traded options ontology to eliminate references to margin and clean up details with respect to contract terms; moved property hasExerciseTerms to to ExerciseConventions so that it can be used more broadly</li>
                </ul>
                <h4>Indices and Indicators</h4>
                <p class="text"><em>Highlights</em></p>
                <ul>
                    <li>migration of basic statistical concepts from IND to FND to enable wider use, and</li>
                    <li>work towards support for time series data, which is expected to be completed during Q3, to facilitate representation of versioned, time series indicators, market rates, and other reference data.</li>
                </ul>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>IND-24 - augmented the definition of statistical measure as discussed by the IND FCT and migrated all of the general statistics concepts from EconomicIndicators to FND/Utilities/Analytics (created/revised in FND, eliminated references to the quantities and units ontology to avoid circular dependencies and deprecated in IND)</li>
                    <li>IND-24 - augmented the definition of statistical measure</li>
                    <li>IND-24 - eliminated "smart quote" in explanatory note</li>
                    <li>IND-24 - eliminated all non-government source information used as input to definition development; normalized a few more definitions to be ISO 704 compliant, which the entire ontology now is, and added notes and references from the OECD glossary where possible.</li>
                    <li>IND-79 - eliminated unnecessary restriction (since the one that counts is in the IND interest rates ontology)</li>
                    <li>IND-79 - further integration of the disentangled quantities/analytics ontologies, deprecation of the confusing 'Rate' class and replacement of that class with an appropriate concept in other ontologies that referenced it</li>
                    <li>IND-79 - further refinements based on comments</li>
                    <li>IND-79 - initial pass unwinding dependencies between Analytics and Quantities and Units, elimination of redundant QuantitiesExt ontologies, addition of qualified and scoped measure</li>
                    <li>IND-79 - integrated further changes to better align with the BLS model</li>
                    <li>IND-79 - replaced use of actualExpression (annotation property) in IND with the equivalent property in Analytics and removed the equivalent property axiom, which was causing Widoco to fail in the publication process (unparsed triple error likely caused by a bug in the OWL API)</li>
                </ul>
                <h4>Securities</h4>
                <p class="text"><em>Highlights</em></p>
                <p>Most of the work this quarter built on work completed in Q1 to further simplify and clean up the bonds ontology in preparation for review and release in Q3 and to integrate / eliminate the last two informative ontologies remaining in the Securities hierarchy.</p>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>SEC-82 - eliminated remaining references to the provisional Values ontology; further simplified the notion of a bond registrar</li>
                    <li>SEC-82 - further simplification, normalization of definitions with added explanatory notes, etc.</li>
                    <li>SEC-82 - prelminary pass to simplify the bonds ontology, update certain definitions to conform to ISO 704 requirements, eliminate duplicate or unnecessary content that is not used elsewhere in FIBO</li>
                    <li>SEC-82 - eliminated spurious characters in certain definitions / notes</li>
                    <li>SEC-82 - second iteration to continue the simplification and integration process, eliminate unnecessary concepts, clean up definitions, etc.</li>
                    <li>SEC-83 - rationalized and simplified the securities regulation and restriction hierarchies, moved regulation from FBC to FND as a part of that process, and eliminated informative RegulatoryRestrictions and RegulatoryRequirements ontologies as a part of the rationalization process.</li>
                </ul>
                <h4>Infrastructure</h4>
                <p class="text"><em>Highlights</em></p>
                <p>In 2019 Q2, we released a new web site. It still points to the same products, but now with a styling and look-and-feel that is more in alignment with the main EDMC website.</p>
                

                <h3 id="2019Q1"><strong>2019 Q1</strong></h3>
                <p><em>Full change record</em></p>
                <h4>Business Entities</h4>
                <p class="text"><em>Highlights</em></p>
                <p>bug fixes and continued simplification of the legal entities hierarchy, enabling better support of the GLEIF LEI data</p>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>BE-196 - eliminate duplicate restriction on Shareholder</li>
                    <li>BE-197 - replaced union of legal entity and formal organization with formal organization</li>
                    <li>BE-198 - eliminate reasoning errors related to controlled party and controlled company - the issues have been in the ontology for awhile but only came to light after other things were corrected by BE-156</li>
                    <li>BE-199 - eliminated unused import of Corporations in FunctionalEntities</li>
                    <li>BE-200 - eliminated circular dependency by deleting older deprecated elements</li>
                    <li>BE-201 - corrected URI in prefixes in ownership parties</li>
                </ul>
                <h4>Derivatives</h4>
                <p class="text"><em>Highlights</em></p>
                <ul>
                    <li>bug fixes, minor change to the way USIs are interpreted</li>
                </ul>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>DER-52 - modified the parent for USI to financial instrument identifier, added a restriction on Swap that it optionally has a USI, since they apply primarily in the US</li>
                    <li>DER-60 - replaced references to the TimeExt ontology with those from the FinancialDates ontology, and cleaned up master agreement to define what early termination is rather referencing early termination date (which was not defined and used the TimeExt ontology for date determination agent)</li>
                    <li>DER-62 - augment the DerivativesContracts metadata with ParticipationNotes</li>
                </ul>
                <h4>Financial Business and Commerce</h4>
                <p class="text"><em>Highlights</em></p>
                <ul>
                    <li>bug fixes,</li>
                    <li>updates to the GLEIF LEI related content to reflect recent insights and testing with actual data,</li>
                    <li>migration of provisional credit events and credit ratings ontologies to FBC from other legacy domain areas,</li>
                    <li>improved automation for MIC code processing allowing us to automatically update the ISO MIC codes on a monthly basis, corresponding to the ISO publication cycle,</li>
                    <li>introduction of integrated support for ratings in concert with the migration of the credit ratings legacy content (provisional),</li>
                    <li>revised identifier strategy for functional entities,</li>
                    <li>revision of a number of properties and restrictions, especially related to names, to allow for multi-lingual representation including language codes.</li>
                </ul>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>FBC-143 - Revised registration authorities to loosen some of the restrictions on registrar, allow either a registration authority or registrar to actually register something, added properties to identify the registration authority independently of the registrar, with inverses, and revised the US examples related to IIN and RTN to demonstrate that</li>
                    <li>FBC-196 - added new individuals for GLEIF LEI entity expiration reason and validation level; revised properties to use these individuals and deprecated the related datatypes; revised individuals in North American and European jurisdictions accordingly</li>
                    <li>FBC-196 - replaced classifier with code element; corrected spelling error</li>
                    <li>FBC-207 - merged duplicate bankruptcy event in CAE with bankruptcy in credit events; moved default event and installment event from CAE to FBC</li>
                    <li>FBC-207 - revise definition of default event to generalize it to support events such as failure to provide certain documentation in a timely manner or to meet contractual obligations that include but are not limited to failure to pay events; revise hierarchy accordingly</li>
                    <li>FBC-210 - replaced markets individuals to use (1) 'MIC-' as the prefix for the codes and (2) 'Exchange-' followed by the code for the markets, to ensure uniqueness of URIs, and updated the markets and codes to reflect the Jan 2019 publication by ISO</li>
                    <li>FBC-210 - revised US examples to update URIs to match the new representation strategy in the basic MIC codes ontology</li>
                    <li>FBC-210 - revised automatically generated market individuals to address bug Pete found in testing</li>
                    <li>FBC-211 - add the new ratings and credit ratings ontologies to the relevant metadata files</li>
                    <li>FBC-211 - added an additional reports on property to the reporting ontology after review with the FND FCT</li>
                    <li>FBC-211 - added assessments ontology to the about FIBO development load file</li>
                    <li>FBC-211 - added domain to hasRatingScore, corrected label per reviewer request</li>
                    <li>FBC-211 - added numeric rating score and rating score code per Fannie Mae model; relaxed constraints around rating party, which could be anyone depending on the circumstances</li>
                    <li>FBC-211 - added rating service</li>
                    <li>FBC-211 - added restriction with respect to the issuer of a given rating and tweaked definitions</li>
                    <li>FBC-211 - added the notion of an assessment which could have a rating as an output</li>
                    <li>FBC-211 - added two additional properties to the Relations ontology, evaluates, and is evaluated by, after review with the FND FCT</li>
                    <li>FBC-211 - changed rating scheme to rating scale based on feedback and review of rating agency definitions</li>
                    <li>FBC-211 - delete the old MD/TemporalCore/CreditRatings ontology now that it is no longer referenced by anything</li>
                    <li>FBC-211 - eliminate now redundant rating and rating scheme classes from the informative temporal info ontology</li>
                    <li>FBC-211 - eliminated unnecessary restriction in credit ratings, incorporated changes from team meeting of 1/23/2019</li>
                    <li>FBC-211 - makes rating and rating score classifiers rather than of type 'reference', adds an effective date and period to rating, eliminates spurious restriction on rating score, adds a new property to allow users to reference the rating in addition to the score per feedback from CC and Fannie Mae</li>
                    <li>FBC-211 - move the MD/TemporalCore/CreditRatings ontology to FBC and revise it to use the new ratings ontology (initial pass only, not complete)</li>
                    <li>FBC-211 - preliminary version of general rating ontology for the FND component of this requirement</li>
                    <li>FBC-211 - pulled assessment-related concepts out into a separate ontology for further work, to include evaluation, outcome, opinion, etc.</li>
                    <li>FBC-211 - replace all references to the original MD/TemporalCore/CreditRatings ontology with the migrated FBC credit ratings ontology</li>
                    <li>FBC-211 - revise the CIV ontology to reference the new ratings ontology rather than an informative ontology for rating score</li>
                    <li>FBC-211 - separated the rating from the score, integrated a rating assessment as a child of assessment, rating assessment event as a child of assessment event, added a rating report</li>
                    <li>FBC-211 replace spurious imports and remaining references to the MD/TemporalCore/CreditRatings ontology with the migrated FBC ontology (URIs)</li>
                    <li>FBC-211 revised cardinalities, definitions per team discussions</li>
                    <li>FBC-212 - determined that one of the issues with the individuals was related to the identifiers for banking functions, which were originally organization identifiers, thus causing all functional entities that had such identifiers to be inferred to be formal organizations (introducing a logical inconsistency); added a new financial service provider identifier that is determined by function, corrected a restriction in control parties, referenced the new identifier and eliminated redundant restrictions in US regulatory agencies and used (and tested) the fix with US financial services entities individuals and added new content to reflect the revised BE entity ownership properties</li>
                    <li>FBC-214 - added USMarketsAndExchanges to the metadata for FBC Functional Entities (eliminated an erroneous imports statement)</li>
                    <li>FBC-217 - revised MIC codes as of February 11 2019</li>
                    <li>FBC-218 - revised MIC codes to support the March 11, 2019 ISO published codes</li>
                    <li>FBC-219 - eliminated all remaining explicit range restrictions using rdfs:Literal in the range, in qualified cardinality restrictions (made unqualified), and a couple of cases that were missed</li>
                    <li>FBC-219 - loosened range restrictions on names to rdfs:Literal to allow for either xsd:string or rdf:langString (i.e., language tagged strings), enabling multilingual representation of names of entities</li>
                </ul>
                <h4>Foundations</h4>
                <p class="text"><em>Highlights</em></p>
                <ul>
                    <li>simplification of the party hierarchy,</li>
                    <li>addition of a new combined date / date time / date time stamp datatype that can be used as needed to map to inconsistent data and support time stamps that include milliseconds or smaller increments,</li>
                    <li>the introduction of new, provisional assessments and ratings content</li>
                </ul>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>FND-230 Make hasMaturityLevel an AnnotationProperty.</li>
                    <li>FND-232 - made independent party a child of autonomous agent; made person and organization direct subclasses of independent party - to assert the semantics previously only inferred</li>
                    <li>FND-232 - simplified the definition of independent party to correspond to its usage in general across FIBO</li>
                    <li>FND-235 - augment the financial dates ontology with a composite date value datatype that allows certain properties and restrictions to vary with respect to the precise datatype representation of a date for use in mappings and cases where the representation is ambiguous; leverage this new datatype in the definition of an occurrence (event)</li>
                    <li>FND-235 - renamed the datatype from composite date value to combined date time, per FND FCT discussion, and eliminated the corresponding property</li>
                    <li>FND-235 - replace declarations of the same composite date value datatype across FIBO domains with the new base datatype</li>
                    <li>FND-236 - added Assessments to the metadata for Arrangements (Ratings was already there)</li>
                </ul>
                <h4>Loans</h4>
                <p class="text"><em>Highlights</em></p>
                <p>minor bug fixes only</p>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>LOAN-144 - corrected URI for metadata ontology in header declarations</li>
                    <li>LOAN-145 - replace references to the informative TimeExt ontology with those in the released FinancialDates ontology, as appropriate</li>
                </ul>
                <h4>Securities</h4>
                <p class="text"><em>Highlights</em></p>
                <p>bug fixes and clean up of several provisional debt-specific ontologies in preparation for release</p>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>SEC-69 - move the restriction from discounted commercial paper up to commercial paper and delete the two unnecessary subclasses per FCT discussion of 2/4/2019</li>
                    <li>SEC-76 - based on usage of exercise conventions across FIBO, separated the notion of the convention from the contractual terms that specify a given convention so that both concepts are now part of this ontology</li>
                    <li>SEC-76 - integrated metadata, revised definitions to be ISO 704 compliant in preparation for integration into release</li>
                    <li>SEC-76 - integrated revised terminology for exercise conventions and contractual terms with the ontologies that use them as appropriate</li>
                    <li>SEC-77 - replace the 'specifies' property with 'uses' for better semantic alignment</li>
                    <li>SEC-77 - revised load files to include exercise conventions</li>
                    <li>SEC-79 - addressed hygiene errors</li>
                    <li>SEC-79 - eliminated duplicate definitions for maturity in provisional / informative ontologies, added missing axiom to debt instruments that was in one of the analytics ontologies</li>
                    <li>SEC-79 - moved has scheduled maturity date and has duration to maturity to financial instruments; added has time to maturity; revised debt instruments to deprecate the two properties, and revised traded short term debt to use the new has duration to maturity property</li>
                    <li>SEC-80 - eliminated extra / duplicate restriction from tradable debt instrument</li>
                </ul>
                <h4>Infrastructure</h4>
                <p class="text"><em>Highlights</em></p>
                <p>2019Q1 marks a sea-change in the FIBO publication process, whereby all publishing activities have been migrated to docker. This makes the process more portable, repeatable, and simplifies testing. .</p>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>Addition of "quickstart" products that allow FIBO to be read in a single file.</li>
                    <li>rdf-toolkit can now work on whole directories</li>
                    <li>Fixed issue with rdf-toolkit output being the same as the input</li>
                    <li>Migrate to newer version of widoco</li>
                    <li>New XSLT to create CSV file of FIBOpedia content with a row per ontology and columns for Domain label, Module label, Ontology label, Ontology abstract, Maturity</li>
                    <li>Add a file that publishes official namespace prefixes for FIBO</li>
                </ul>
                

                <h3 id="2018Q4"><strong>2018 Q4</strong></h3>
                <h4>Business Entities</h4>
                <p class="text"><em>Highlights</em></p>
                <ul>
                    <li>Integrated support for GLEIF LEI Level 2 accounting consolidation relationships and made other revisions with respect to GLEIF LEI representation to better support automation of reference data and reflect the nature of the GLIEF published information with respect to entity legal forms</li>
                    <li>Simplified the hierarchies involving formal organizations and legal entities substantially, including deprecating 'formally constituted organization' and 'juridical person', and adding the latter as a synonym of 'legal entity'</li>
                    <li>Clarified the distinction between a natural person and legally competent natural person</li>
                </ul>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>BE-195 - moved the restriction that an entity may be identified by a legal entity identifier from LEIEligibleEntity to LegalPerson and deprecated LEIEligibleEntity as a part of organization hierarchy simplification</li>
                    <li>BE-181 - replaced 'natural person' with 'legally competent natural person' across ontologies where that concept was required</li>
                    <li>BE-181 - added a new class to replace 'natural person', called 'legally competent natural person', for the sake of clarity</li>
                    <li>BE-181 - deprecate legally capable person in favor of natural person, which includes a more general definition of the concept of legal competence. Legal competence is jurisdiction and situation specific - in some jurisdictions, people that are under the age of 'maturity' can apply for jobs, can enter into contracts, are considered competent to make certain decisions for themselves in a court of law, etc. For the purposes of FIBO, legal competence generally means that an individual can take on liabilities, such as taxes on earnings, or fees associated with an account, or potentially take on a debt, or own property or join the military. The revised definition of natural person includes the concept of liability capacity and is jurisdiction specific. Merging these two concepts in favor of natural person simplifies the conceptual representation and hierarchy and clarifies what is intended.</li>
                    <li>BE-180 - as a part of the organizational hierarchy simplification, replaced uses of FormallyConstitutedOrganization with either FormalOrganization, LegalPerson or LegalEntity, as appropriate, across FIBO domains</li>
                    <li>BE-180 - merged the concept of FormallyConstitutedOrganization with LegalEntity in BE, given that the definitions were almost identical and that FormallyConstitutedOrganization simply added complexity without significant value to the organizational hierarchy</li>
                    <li>BE-180 - replaced references to FormallyConstitutedOrganization with FormalOrganization from FND, which eliminated a number of out-of-domain references in FND informative ontologies</li>
                    <li>BE-180 - merge the definitions of legal entity and juridical person to simplify the legal persons and organizations hierarchies; make Polity a child of GovernmentBody, again to simplify the hierarchy</li>
                    <li>BE-178 - revised the definition of supranational entity to use the definition from ISO 20275, added adapted from the ISO standard</li>
                    <li>BE-156 - revised property naming from parent / child to direct ownership and investment, loosened certain ownership relationships to allow business entities (including sole proprietorships), legal entities, and not for profit organizations (such as certain foundations used for tax purposes primarily) but not ownership of people (i.e., broader than legal entity but not as broad as legal person)</li>
                    <li>BE-156 - added a relationship period qualifier and made active and inactive relationships status individuals of that qualifier, revised definitions accordingly; reorganized the two individuals of relationship status so that the status itself is at the end of the name and revised definitions to be closer to the GLIEF definitions for these status indicators; simplified names of consolidatation related properties</li>
                    <li>BE-156 - added new records property to Documents to allow a record to reference the thing that it is recording</li>
                    <li>BE-156 - added restriction on entity ownership for relationship classifier (which would cover the information relevant to the time frame for the relationship)</li>
                    <li>BE-156 - loosened constraints on properties in Contracts - is evidenced by and is evidence for; slight revisions to representation in ownership parties based on testing</li>
                    <li>BE-156 - added a couple of missing concepts, revised restrictions after review of test data</li>
                    <li>BE-156 - initial version of a revised entity ownership reified relation for the purposes of GLEIF level 2 support</li>
                    <li>BE-141 - added synonyms for code sets (also addresses FBC-172)</li>
                    <li>BE-141 - added the registry / registry entry for entity legal forms; added the entity legal form identifier and scheme, as well as individuals for ISO 20275 code set and ISO 17442 code set (LEI)</li>
                    <li>BE-114 - added explanatory note indicating that a license may also be an agreement or contract, depending on the license and jurisdiction</li>
                    <li>BE-141 - moved restriction on hasLegalFormAbbreviation to EntityLegalForm; added new property hasTransliteratedLegalFormAbbreviation and other restrictions to EntityLegalForm to correspond to the GLIEF ELF standard</li>
                    <li>BE-114 - modified the parent of License from Agreement to LegalDocument, which is more appropriate (all licenses, including fishing licenses, business licenses, and software licenses are legal documents, but not necessarily agreements since they are often unilateral)</li>
                    <li>BE-141 - deprecated hasLegalFormAbbreviation in Corporations per BE-141; moved it to LEIEntities where the actual legal form is referenced and added the hasLegalFormAbbreviation and restriction there in parallel with the reference to the actual legal form</li>
                    <li>BE-115 - revised the definition of power of attorney to eliminate a restriction that the authoritiy is limited to the lifetime of the principal; moved some of the content to an explanatory note, added another source and a restriction that it has an effective date (in most cases, not all, thus min 0)</li>
                    <li>BE-110 - modified the definition of responsible party to correspond to its intended usage, i.e. with respect to people rather than organizations as well as people</li>
                    <li>BE-88 - generalized the parents of beneficial owner to be beneficiary and owner; revised the definition to move an explanatory component out to an explanatory note, updated annotation properties as appropriate</li>
                </ul>
                <h4>Derivatives</h4>
                <p class="text"><em>Highlights</em></p>
                <ul>
                    <li>Primary changes this quarter in DER were bug fixes.</li>
                </ul>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>DER-59 - eliminated improperly defined valuationTime property which is not referenced by anything</li>
                    <li>DER-59 - eliminated the extraneous property for relativeNotionalAmount, as the class that it was used on already had a restriction on notional amount</li>
                    <li>DER-20 - made having a notional step schedule optional on an interest rate swap leg to cover the simpler cases where that level of complexity is not required; the notional is already available at the leg level to support calculation of a basic payment</li>
                    <li>DER-20 - made having a notional step schedule optional on an interest rate swap leg to cover the simpler cases where that level of complexity is not required; the notional is already available at the leg level to support calculation of a basic payment</li>
                </ul>
                <h4>Business and Commerce</h4>
                <p class="text"><em>Highlights</em></p>
                <ul>
                    <ul>
                        <li>Primary changes this quarter in FBC were related to inclusion of ISO 10383 MIC codes, which is now entirely automated. three months were processed, with September 2018 initially, followed by November and finally December 2018, which allowed for refinement of the automation process.</li>
                        <li>FBC-194 covers the initial integration work for the FpML Business Centers, additional MIC code municipalities and 9/2018 codes</li>
                        <li>FBC-206 covers the revision for November 2018</li>
                        <li>FBC-209 brings the codes up to date for December 2018</li>
                    </ul>
                </ul>
                <p>In addition to the MIC codes, other changes to FBC include:</p>
                <ul>
                    <li>Moving provisional credit events to FBC/Debt</li>
                    <li>Adding support for NAICS and SIC industry classification codes (high-level model only at this point without reference data)</li>
                    <li>Miscellaneous bug fixing</li>
                </ul>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>FBC-209 - corrected duplicate Deutsche Bank Systemmatic Internalizer to add a suffix on the one in London</li>
                    <li>FBC-209 - revised MIC codes (generated) as of December 12, 2018</li>
                    <li>FBC-209 - added Reggio Emilia to support the December revision to the MIC codes</li>
                    <li>FBC-206 - replaced "NewJersey" with Summit as the proper municipality for one of the exchanges</li>
                    <li>FBC-206 - revised MIC codes to eliminate long hyphens; revised two new business centers per the latest generation algorithm</li>
                    <li>FBC-206 - revised MIC codes generated from the 11/13/2018 revision</li>
                    <li>FBC-206 - revised business centers individuals per the latest revision (11/13/2018) of the ISO MIC codes</li>
                    <li>FBC-203 - moved the CreditEvents ontology from MD/TemporalCore to FBC/DebtAndEquities; revised all references to point to the new location; updated the ontology to eliminate references to other provisional ontologies and better integrated content with the current FIBO class hierarchy as a first pass to clean it up a bit</li>
                    <li>FBC-202 - added support for NAICS and SIC codes (model only, not individuals) for use in several PoCs (CFTC, Wells Fargo, etc.)</li>
                    <li>FBC-201 - corrected restrictions that caused a controlled company (relative entity) to be inferred to be an organization (independent entity)</li>
                    <li>FBC-197 - relaxed the super class for credit union to be a depository institution, made slight modification to the definition and added a reference to the federal credit union act that was the source of the definition</li>
                    <li>FBC-194 - corrected long dashes in some Nordic auction on demand markets and related codes</li>
                    <li>FBC-194 - corrected prefix on US states in business centers individuals</li>
                    <li>FBC-194 - corrected the following references for municipalities: Ebene_City --&gt; Ebene, Frankfurt_Am_Main --&gt; Frankfurt, Klagenfurt_Am_Woerthersee --&gt; Klagenfurt_am_Woerthersee, New_Jersey --&gt; Summit, Nicosia_lefkosia --&gt; Nicosia, S-hertogenbosch --&gt; s-Hertogenbosch, Saint-petersburg--&gt; Saint-Petersburg, St__Peter_Port --&gt; Saint_Peter_Port, and Washington_new_York --&gt; Washington_New_York</li>
                    <li>FBC-194 - eliminated references to non-existent markets for codes for XXXX, BILT, and XOFF</li>
                    <li>FBC-194 - integrated the markets individuals with the FBC European all file</li>
                    <li>FBC-194 - corrected another issue with the market codes related to SWISS CANTO</li>
                    <li>FBC-194 - added the example US markets individuals to the metadata for FBC Functional Entities</li>
                    <li>FBC-194 - revised US examples to reuse the codes and references in the primary market individuals ontology</li>
                    <li>FBC-194 - fixed additional issues in the generated codes, e.g. characters that were not proper in URIs, ampersands that were not escaped, etc.</li>
                    <li>FBC-194 - relaxed restriction on exchange name so that we can map detailed individuals that reflect the nature and other facts about an exchange to the generated content</li>
                    <li>FBC-194 - revised market identifiers to correct various issues</li>
                    <li>FBC-194 - corrected business centers that were modeled to be in Taiwan that are actually in India</li>
                    <li>FBC-194 - eliminated parent of 'has' on 'has municipality'</li>
                    <li>FBC-194 - replaced use of hasCity for those municipalities that are available in the new business centers individuals in US regulatory agencies</li>
                    <li>FBC-194 - replaced hasCity with hasMunicipality for addresses of US financial entities that are encoded in the new business centers individuals ontology</li>
                    <li>FBC-194 - replaced hasCity with hasMunicipality with the proper reference for the address of the Bank of Canada</li>
                    <li>FBC-194 - added a property for hasMunicipality to allow registration addresses to incorporate a business center or municipality as a first class object rather than strictly as a text string (as in hasCity); both are needed for cases where some city has not been represented as a municipality individual in FIBO (although geonames could be referenced as an alternative source, as desired)</li>
                    <li>FBC-194 revised business centers, municipalities, and markets based on issues uncovered by Pellet (unknown references, cities that were missing "_City" when referenced by markets or with other slight changes in their names, a couple of duplicates, etc.)</li>
                    <li>FBC-194 - added new ontologies for business centers and markets to the Functional Entities metadata for FBC</li>
                    <li>FBC-194 - Added new reference markets all file and imported it into the North American individuals all file rather than importing the individual ontologies</li>
                    <li>FBC-194 - revised the status of the business centers ontology to released</li>
                    <li>FBC-194 - corrected Ukranian INNEX exchange name and MIC code to address smart quotes in the source</li>
                    <li>FBC-194 - corrected various syntactic bugs: embedded "&amp;", messed up URIs embedded as websites mainly</li>
                    <li>FBC-194 - preliminary version of the market individuals, plus loading it into an all file for testing</li>
                    <li>FBC-194 - manual updates to municipalities to eliminate duplicates (e.g., St. Peter Port and Saint Peter Port) and add synonyms as appropriate, encoding issues present in the source file (e.g., Washington_new_York --&gt; Washington_New_York), change New_Jersey to Summit, etc.</li>
                    <li>FBC-194 Add municipalities (auto-generated) referenced in ISO 10383 MIC codes, that are not included in FpML business centers, as of the 2018-09-11T15:57:43 publication of the ISO 10383 MIC codes on the ISO web site</li>
                    <li>FBC-194 - revised business centers, including all of those processed automatically from FpML (a couple still need tweaking and 3 business day adjustments to be added)</li>
                    <li>FBC-194 - revised individuals to add business days for certain entities and business centers; eliminated unneeded references in the markets and exchanges individuals</li>
                    <li>FBC-194 - modified approach to representing cities as parts of subdivisions rather than as subdivisions of subdivisions to get desired reasoning results</li>
                    <li>FBC-194 - initial pass at encoding FpML business centers, starting with those in the U.S.</li>
                    <li>FBC-194 - revised the definition of holding company to be a child of functional business entity rather than business, which is more appropriate given the function of a holding company</li>
                    <li>FBC-194 - revised business dates to allow the property, has business center, to be used by more than the class called business day adjustment; revised the definition of business day adjustment to allow for the same adjustment to apply to multiple business centers (also agrees with the FpML specification); added a new ontology called business centers in FBC to support the set of FpML business centers, required for specifying the business center in which a given exchange operates</li>
                    <li>FBC-194 - added general holding company to certain organization definitions</li>
                    <li>FBC-194 - created the notion of a generic holding company, needed to represent the structures present in the various exchange corporate hierarchies</li>
                    <li>FBC-194 - modified the relationship between market segment and the operating level market it is a part of; changed the reference from operatesInCity to operatesInMunicipality (strings to things) to allow us to reference FpML business centers</li>
                    <li>FBC-194 - see prior comment re: definitions, the addition of New York Stock Exchange LLC, etc.</li>
                    <li>FBC-194 - added market segment-level and operating level markets under exchange; eliminated "individual representing" from various definitions, added New York Stock Exchange LLC and revised other definitions accordingly</li>
                    <li>FBC-194 - deprecated the class called "market" and made market a synonym of exchange; added exchanges to the example exchanges and markets in the US</li>
                    <li>FBC-117 - broadened the definition of underwriter in financial services entities to cover insurance, mortgage, securities, and other kinds of underwriters and did the same with underwriting arrangement; revised the definition of security underwriter in securities issuance to correspond to the regulations better and added security underwriting arrangement such that there is a parallel structure for securities with the structure in FBC, as a guide to addressing mortgage underwriting in loans</li>
                </ul>
                <h4>Foundations</h4>
                <p class="text"><em>Highlights</em></p>
                <p>The primary modification to FND this quarter are related to automation of generation of the ISO 4217 currency codes and integration of the latest version. Other modifications include:</p>
                <ul>
                    <li>Revised annotations on agreement and contract</li>
                    <li>Deprecation of the nameOrigin annotation</li>
                    <li>Miscellaneous bug fixing</li>
                </ul>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>FND-227 - eliminated the domain of hasCurrency to correct reasoning issues and revised the definition accordingly</li>
                    <li>FND-223 changes to Agreement and FND-224 changes to Contract. Includes changes to Agreement in response to comments in FND-335 on Contract. All changes are to annotations only.</li>
                    <li>FND-211 - Automated generation of currency codes from ISO XML file</li>
                    <li>FND-211 - changed restrictions on currency, unit of account, precious metal to allow for multiple names, particularly multilingual names</li>
                    <li>FND-221 - revised definitions for Currency, CurrencyIdentifier, Funds, FundsIdentifier to use generic hasName and hasTag, deprecated the more specific properties</li>
                    <li>FND-211 - modified currency amount to update definitions for currency and funds, add unit of account, and add a unit of account identifier per the latest ISO 4217 definitions and as needed to generate the latest ISO 4217 codes; added precious metal and precious metal identifier to products and services also to support generation of the latest ISO 4217 codes</li>
                    <li>FND-210 updated with deprecation approach - nameOrigin retained, added deprecated indictor.</li>
                    <li>FND-210 remove the annotation property nameOrigin</li>
                    <li>FND-41 changes to cardinality of the two restrictions on MonetaryAmount in CurrencyAmount.</li>
                </ul>
                <h4>Loans</h4>
                <p class="text"><em>Highlights</em></p>
                <p>Primary changes this quarter in LOAN involved staging with respect to some of the older LOAN provisional content in preparation for further integration work in 2019.</p>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>LOAN-138 Move Informative LOAN ontologies to a new module LoanExt</li>
                    <li>Generally replace unofficial use of fibo-ln- abbreviation for the domain by official fibo-loan-</li>
                    <li>Use consistent official abbreviation fibo-loan rather than previous fibo-ln- for the domain</li>
                    <li>Update all references to LoansGeneral</li>
                    <li>Move LoansGeneral to LoanExt and update metadata</li>
                    <li>Update all references to LoanGeneric to use LoanExt</li>
                    <li>Update metadata to represent movement of LoanGeneric and create new Metadata file for LoanExt</li>
                    <li>Move LoanGeneric to new module LoanExt</li>
                    <li>LOAN-142 change 2 ontologies to maturity level Informative</li>
                </ul>
                <h4>Securities</h4>
                <p class="text"><em>Highlights</em></p>
                <p>The revisions to SEC content this quarter include minor changes to released ontologies as well as significant development of some of the content in provisional debt instruments planned for release in 2019:</p>
                <ul>
                    <li>Integrated 6 SEC/Debt/Bonds ontologies into a single coherent ontology, eliminating circular references between them</li>
                    <li>Eliminated redundant content in SEC/Debt/DebtFoundations and SEC/Debt/MoneyMarkets and moved the resulting ontologies, including 'traded short-term debt' and 'exercise conventions' to the SEC/Debt level and moved remaining concepts that were not redundant into the SEC/Debt/DebtInstruments ontology or to other provisional ontologies under LOAN, DER, or SEC/Debt/AssetBackedSecurities</li>
                </ul>
                <p class="text"></p><p class="text"><em>Detailed Changes</em></p>
                <ul>
                    <li>SEC-75 - clean up some of the labels and definitions, add missing definitions (not all, just some per the concepts relevant to FINRA), bridge a few properties to the proper concepts in the debt instruments ontology, etc.</li>
                    <li>SEC-75 - correct label and definition on has scheduled maturity date</li>
                    <li>SEC-71 - completed integration of CallEvent as a RedemptionEvent in DebtInstruments and eliminated the related axiom in Bonds</li>
                    <li>SEC-67 - eliminate circular reference to traded short term debt in the TimeExt/Time ontology as well as unused notions related to up to one year and more than one year durations</li>
                    <li>SEC-67 - eliminate references to the TimeExt/Time ontology from exchange traded options to facliltate minimal clean up of the TimeExt/Time ontology</li>
                    <li>SEC-67 - renamed MoneyMarketDebtInstrument to MoneyMarketInstrument, which is the name it is commonly known by; eliminated the equivalence in that class and made various other instruments children of money market instrument given that the set included in the union was incomplete (so the logic would disallow other kinds of money market instruments), revised the definition to use one from the OECD Glossary (Organisation for Economic Co-operation and Development)</li>
                    <li>SEC-67 - eliminated asset repurchase agreement and liability repurchase agreement as they are not used in the relevant literature (though there are kinds of REPOs missing from this ontology)</li>
                    <li>SEC-67 - eliminate references to the TimeExt/Time ontology in Debt/DebtFoundations, Debt/MoneyMarkets, and Debt/AssetBackedSecurities, and merge the small REPOs ontology into TradedShortTermDebt</li>
                    <li>SEC-67 - eliminated additional redundancy in the TimeExt/Time ontology related to business day conventions and business calendars made moot by recent changes to import all FpML business day conventions and business centers in FBC (and due to their lack of usage by anything else)</li>
                    <li>SEC-65 - revised metadata for the SEC/Debt/AssetBackedSecurities module to reflect the name change</li>
                    <li>SEC-65 - renamed the module called "AssetBacked" to "AssetBackedSecurities" to align with FIBO naming conventions and per SEC-65; modified URIs in all ontologies that reference anything in this module accordingly</li>
                    <li>SEC-63 - corrected namespace prefix on TreasuryBill</li>
                    <li>SEC-63 - eliminated the domain of hasTypicalDurationToMaturity which seemed too narrow</li>
                    <li>SEC-63 - revised the range of hasTypicalDurationToMaturity to be the same as it's parent property and added a definition for it</li>
                    <li>SEC-63 - eliminated circularity in TradedShortTermDebt, refined content, and moved it to SEC/Debt; updated references to it, and eliminated the MoneyMarkets subdomain</li>
                    <li>SEC-62 - moved the contents of the term deposits ontology to clients and accounts in FBC; revised the definitions related to 'term deposit' according to regulatory definitions provided by the FDIC, which regulates deposit accounts in the US, and whose definitions other countries rely on as the source for the same or similar concepts</li>
                    <li>SEC-61 - moved LoanParticipationNotes to AssetBackedSecurities, noting that it is (1) lacking concepts about loan participation (which small and medium sized banks do to spread risk for a given loan that is larger than what they can or want to commit funds to), which should be in loans, and (2) a basic syndicated loan, typically issued to a large company and which is a very large loan, again used to spread risk across institutions, which should also be in loans, where this ontology includes the concept of a security based on a syndicated loan</li>
                    <li>SEC-61 - eliminated the redundant hasUnderlying property (given that it is in derivatives and has access to that property) from participation notes and moved it to DER/DerivativesContracts</li>
                    <li>SEC-60 - corrected prefix for FloatingInterestRate and added a definition to hasNotificationProvision</li>
                    <li>SEC-60 - eliminate the remaining DebtCashflowTerms ontology and related DebtFoundatations metadata file</li>
                    <li>SEC-60 - move remaining properties in DebtCashflowTerms to their proper homes</li>
                    <li>SEC-60 - corrected restriction with respect to repayment date</li>
                    <li>SEC-60 - eliminated spurious restrictions in bonds cashflow variants and unused imports (references) to debt cashflow terms where they occurred</li>
                    <li>SEC-60 - eliminate remaining references to the DebtCashflowTerms ontology</li>
                    <li>SEC-60 - revised payment schedule to use occurrence rather than occurrence kind (i.e., payment), added property has payment schedule to support integration of debt, debt cashflow terms, and loans</li>
                    <li>SEC-59 - normalize spelling of issuance programme using 'mme' spelling specifically due to its appropriateness and usage in this case from the domain perspective</li>
                    <li>SEC-59 - clean up remaining content from DebtFoundations/DebtIssuanceTerms and move it all to BP/SecuritiesIssuance/DebtIssuance where it is used</li>
                    <li>SEC-59 - eliminate references to debt issuance terms in mortgage-backed and pool-backed securities</li>
                    <li>SEC-59 - additional redundancy elimination in Debt Issuance Terms</li>
                    <li>SEC-59 - moved terms from Debt Issuance to Asset backed SPVs where they were used and started eliminating duplication in Debt Issuance Terms related to bonds</li>
                    <li>SEC-59 - eliminated references to securities issuance SPV in participation notes (extends issuer which is already inherited via a restriction, and the need for that level of specificity overly complicates the model), eliminated unused references to other ontologies</li>
                    <li>SEC-56 - eliminate the now redundant DebtInstrumentGuaranties ontology and revise module metadata accordingly</li>
                    <li>SEC-56 - moved the bond insurance class from debt instrument guaranties to bonds common, since bond insurance can impact pricing</li>
                    <li>SEC-56 - clean up and move most of the non-redundant contents of the DebtInstrumentGuarantees ontology to the Guaranty ontology in FBC/Debt</li>
                    <li>SEC-55 - moved relevant restrictions from DebtFinance to the various loan and asset-backed securities ontologies where they belong, and then eliminated references remaining to the DebtFinance ontology and finally eliminated the ontology itself</li>
                    <li>SEC-42 - eliminated now redundant DER/DerivativesContracts ExerciseConventions (replaced with SEC/Debt/ExerciseConventions or concepts moved to Options)</li>
                    <li>SEC-42 - eliminate now redundant STRIPs and Bonds metadata ontologies</li>
                    <li>SEC-42 - integrated basic concepts related to strips and revised the metadata to account for the migration of bonds to the higher level Debt ontology</li>
                    <li>SEC-42 - eliminate restriction error in DebtPricingYields (this was there previously, perhaps highlighted by corrections in the bonds ontology)</li>
                    <li>SEC-42 - eliminate references to the DER/DerivativesContracts/ExerciseConventions ontology and replace them with the revised SEC/Debt/ExerciseConventions ontology</li>
                    <li>SEC-42 - integrated a new exercise conventions that can be used both in SEC/Debt and DER/Options; but have not integrated/replaced those concepts that are duplicate in DER yet</li>
                    <li>SEC-42 - eliminate redundancies in DebtInterestAmounts due to migration of concepts to Bonds</li>
                    <li>SEC-42 - eliminate all of the SEC/Debts/Bonds/ ontologies that have been merged into the higher level Bonds ontology</li>
                    <li>SEC-42 - replace all uses of any SEC/Debt/Bonds/xxx ontology with the merged SEC/Debt/Bonds/ ontology if it occurs outside of SEC/Debt/Bonds</li>
                    <li>SEC-42 - eliminated additional references to informative ontologies, integrated certain concepts from those ontologies, eliminated additional redundancy and circular internal references</li>
                    <li>SEC-42 - streamlined certain names based on approach taken elsewhere in the released ontologies, e.g., TermsSet --&gt; Terms; merged content from MD/DebtTemporal/DebtInterestAmounts into bonds which is where they belong, e.g., BondCoupon and it's children</li>
                    <li>SEC-42 - eliminated tax-related concepts per the SEC FCT on-line review, additional duplication and some references to informative ontologies</li>
                    <li>SEC-42 - eliminate references to informative Math ontology</li>
                    <li>SEC-42 - eliminate unnecessary references to BP - IssuanceProcessTerms (provisional / informative)</li>
                    <li>SEC-42 - Bring all of the bonds ontologies, which involve many circular references, together into a single ontology with a common prefix, etc. (aside from STRIPs)</li>
                    <li>SEC-34 - revised property hasJurisdiction to use the new hasCoverageArea property instead</li>
                    <li>SEC-18 - declare the three individuals of relative price all different from one another</li>
                </ul>
                <h4>Infrastructure</h4>
                <p class="text"><em>Highlights</em></p>
                <p>Infrastructure modifications this quarter were related to (1) revising and normalizing metadata, and (2) integrating additional hygiene testing.</p>
                <p>The functionality of the product formerly called "VOWL" has been integrated into FIBOpedia. Links to the widoco/VOWL documentation are available from FIBOPedia.</p>
                <ul>
                    <li>INFRA-268 Remove rdfs:range from isAbout. Also, fix a namespace deprecation in the hygiene queries.</li>
                    <li>INFRA-268 Create test for explicit use of owl:Thing</li>
                    <li>INFRA-266 - updated about FIBO Prod to include missing business centers and market identifiers ontologies</li>
                    <li>INFRA-214 Change rdfs:comment to skos:definition for maturity levels. Also add logicalDefinition annotation property to support publication of natural language explanations of logic.</li>
                    <li>INFRA-153 INFRA-153 Renamed all top-module directories in fibo git repo to uppercase Further additions and corrections from testing. Update Metadata files for Modules and Domains to reference all parts regardless of their maturity.</li>
                    <li>INFRA-114 Add hygeine test for bad characters</li>
                    <li>INFRA-114 Change smart quotes and dashes to dumb ones.</li>
                </ul>
                

                <h3 id="2018Q3"><strong>2018 Q3</strong></h3>
                <p>Quarterly release. Because of the interim release (omg-finance-18-08-04) in August, this release is releatively brief.</p>
                <p class="text"><em>Highlights</em></p>
                <ul>
                    <li>Modified the existing model for market identifiers to comply with ISO 10303</li>
                    <li>Integrated reference data for: All FpML Business Centers and Business Day Adjustments, based on http://www.fpml.org/coding-scheme/business-center as of 2018-06-29,</li>
                    <li>All Municipalities in addition to the Business Centers referenced in the ISO 10383 Codes for exchanges and market identification (MIC) as of 2018-09-11T15:57:43 and</li>
                    <li>All markets and exchanges and related MIC codes as defined in ISO 10383 Codes for exchanges and market identification (MIC) as of 2018-09-11T15:57:43</li>
                    <li>Added model-level support for representation of industry classification codes including the North American Industry Classification System (NAICS) and Standard Industrial Classification (SIC) codes (not including the reference individuals)</li>
                </ul>
                <h4>FBC</h4>
                <p>Integrated reference data for FpML business centers and ISO 10383 MIC Codes, including:</p>
                <ul>
                    <li>corrected long dashes in some Nordic auction on demand markets and related codes</li>
                    <li>corrected prefix on US states in business centers individuals</li>
                    <li>corrected the following references for municipalities: Ebene_City --&gt; Ebene, Frankfurt_Am_Main --&gt; Frankfurt, Klagenfurt_Am_Woerthersee --&gt; Klagenfurt_am_Woerthersee, New_Jersey --&gt; Summit, Nicosia_lefkosia --&gt; Nicosia, S-hertogenbosch --&gt; s-Hertogenbosch, Saint-petersburg--&gt; Saint-Petersburg, St__Peter_Port --&gt; Saint_Peter_Port, and Washington_new_York --&gt; Washington_New_York</li>
                    <li>eliminated references to non-existent markets for codes for XXXX, BILT, and XOFF</li>
                    <li>integrated the markets individuals with the FBC European all file</li>
                    <li>corrected another issue with the market codes related to SWISS CANTO</li>
                    <li>added the example US markets individuals to the metadata for FBC Functional Entities</li>
                    <li>revised US examples to reuse the codes and references in the primary market individuals ontology</li>
                    <li>fixed additional issues in the generated codes, e.g. characters that were not proper in URIs, ampersands that were not escaped, etc.</li>
                    <li>relaxed restriction on exchange name so that we can map detailed individuals that reflect the nature and other facts about an exchange to the generated content</li>
                    <li>revised market identifiers to correct various issues</li>
                    <li>corrected business centers that were modeled to be in Taiwan that are actually in India</li>
                    <li>eliminated parent of 'has' on 'has municipality'</li>
                    <li>replaced use of hasCity for those municipalities that are available in the new business centers individuals in US regulatory agencies</li>
                    <li>replaced hasCity with hasMunicipality for addresses of US financial entities that are encoded in the new business centers individuals ontology</li>
                    <li>replaced hasCity with hasMunicipality with the proper reference for the address of the Bank of Canada</li>
                    <li>added a property for hasMunicipality to allow registration addresses to incorporate a business center or municipality as a first class object rather than strictly as a text string (as in hasCity); both are needed for cases where some city has not been represented as a municipality individual in FIBO (although geonames could be referenced as an alternative source, as desired)</li>
                    <li>revised business centers, municipalities, and markets based on issues uncovered by Pellet (unknown references, cities that were missing "_City" when referenced by markets or with other slight changes in their names, a couple of duplicates, etc.)</li>
                    <li>added new ontologies for business centers and markets to the Functional Entities metadata for FBC</li>
                    <li>Added new reference markets all file and imported it into the North American individuals all file rather than importing the individual ontologies</li>
                    <li>changed status to release and added US states to municipalities and cities in the United States</li>
                    <li>revised the status of the business centers ontology to released</li>
                    <li>corrected Ukranian INNEX exchange name and MIC code to address smart quotes in the source</li>
                    <li>preliminary version of the market individuals, plus loading it into an all file for testing</li>
                    <li>manual updates to municipalities to eliminate duplicates (e.g., St. Peter Port and Saint Peter Port) and add synonyms as appropriate, encoding issues present in the source file (e.g., Washington_new_York --&gt; Washington_New_York), change New_Jersey to Summit, etc.</li>
                    <li>corrected misspellings, added systematic internaliser</li>
                    <li>revised to add more market segment level codes</li>
                    <li>revised the type on several business center codes to business day adjustment codes</li>
                    <li>corrected references to the two modified business days</li>
                    <li>revised 2 business centers to normalize the names of two of them; added business day adjustments for a few that were missing</li>
                    <li>revised business centers, including all of those processed automatically from FpML (a couple still need tweaking and 3 business day adjustments to be added)</li>
                    <li>revised individuals to add business days for certain entities and business centers; eliminated unneeded references in the markets and exchanges individuals</li>
                    <li>added business day adjustment code</li>
                    <li>added business center to exchange definitions to test reasoning</li>
                    <li>modified approach to representing cities as parts of subdivisions rather than as subdivisions of subdivisions to get desired reasoning results</li>
                    <li>initial pass at encoding FpML business centers, starting with those in the U.S.</li>
                    <li>revised the definition of holding company to be a child of functional business entity rather than business, which is more appropriate given the function of a holding company</li>
                    <li>revised business dates to allow the property, has business center, to be used by more than the class called business day adjustment; revised the definition of business day adjustment to allow for the same adjustment to apply to multiple business centers (also agrees with the FpML specification); added a new ontology called business centers in FBC to support the set of FpML business centers, required for specifying the business center in which a given exchange operates</li>
                    <li>added general holding company to certain organization definitions</li>
                    <li>created the notion of a generic holding company, needed to represent the structures present in the various exchange corporate hierarchies</li>
                    <li>modified the relationship between market segment and the operating level market it is a part of; changed the reference from operatesInCity to operatesInMunicipality (strings to things) to allow us to reference FpML business centers</li>
                    <li>see prior comment re: definitions, the addition of New York Stock Exchange LLC, etc.</li>
                    <li>added market segment-level and operating level markets under exchange; eliminated "individual representing" from various definitions, added New York Stock Exchange LLC and revised other definitions accordingly</li>
                    <li>deprecated the class called "market" and made market a synonym of exchange; added exchanges to the example exchanges and markets in the US</li>
                    <li>corrected prefix for hasWebsite</li>
                    <li>minor revisions to the markets ontology to better reflect the standard; introduction of individuals defining the NYSE as an example</li>
                    <li>add support for ISO 10383 Codes for exchanges and market identification (MIC) - model only, not including individuals</li>
                    <li>0 - made having a notional step schedule optional on an interest rate swap leg to cover the simpler cases where that level of complexity is not required; the notional is already available at the leg level to support calculation of a basic payment</li>
                    <li>02 - added support for NAICS and SIC codes (model only, not individuals) for use in several PoCs (CFTC, Wells Fargo, etc.)</li>
                    <li>FBC-202 - added support for NAICS and SIC codes (model only, not individuals) for use in several PoCs (CFTC, Wells Fargo, etc.)</li>
                </ul>
                <h4>DER</h4>
                <p>DER-20 - made having a notional step schedule optional on an interest rate swap leg to cover the simpler cases where that level of complexity is not required; the notional is already available at the leg level to support calculation of a basic payment</p>
                <h4>INFRA</h4>
                <ul>
                    <li>INFRA-214 Change rdfs:comment to skos:definition for maturity levels</li>
                    <li>Add logicalDefinition annotation property to support publication of natural language explanations of logic.</li>
                </ul>
                <h3><strong>2018 Q2.5 (omg-finance-18-08-04)</strong></h3>
                <p class="text"><em>Highlights</em></p>
                <ul>
                    <li>Normalized metadata across domains, modules and ontologies - the impact of this is primarily on the FIBOpedia product, which now provides comprehensive coverage describing the contents of the FIBO ontologies and improves Widoco documentation</li>
                    <li>Normalize content with respect to reasoning results across all released ontologies, correcting a number of long-standing challenges and improving the quality of the released ontologies.</li>
                    <li>Complete satisfaction of basic hygiene - labels, references, basic logic consistency</li>
                    <li>better representation of contractual rights and obligations</li>
                    <li>better representation of payment parties: obligor, obligee, beneficiary</li>
                    <li>new support for BIC codes per ISO 9362:2014, IBAN and BBAN account identifiers (ISO 13616)</li>
                    <li>new coverage of equities and equity positions</li>
                    <li>revised FpML reference rates (updated to reflect the latest release)</li>
                    <li>improved representation of volatility and related statistical measures</li>
                </ul>
                <h4>BE</h4>
                <ul>
                    <li>BE-189 eliminated redundant BERelations informative ontology Eliminate the ext informative OTCDerivativeMasterAgreements ontology in favor of the provisional one in DerivativesContracts</li>
                    <li>BE-189 eliminated some extraneous content from the Loans catalog file reflecting recent changes (not all about files, which will take more manual effort, though)</li>
                    <li>BE-190 eliminated obsolete about files</li>
                    <li>BE-190 normalized publication dates and URIs for the BE all files; eliminated the abridged all file as differences in reasoning time with the inclusion of currency codes is now negligible, and the ontology is no longer used by other domains</li>
                    <li>BE-190 revised metadata and addressed BE-185 to complete integration with the new definition of Beneficiary from FND</li>
                    <li>BE-190 revised metadata to conform to the latest FLT recommendations</li>
                    <li>BE-190 revised metadata, addressed BE-139 to eliminate (deprecate LegallyIncorporatedPartnership, which does not exist and was confusing to BE users), addressed BE-140 to eliminate subclassing Corporation for certain partnerships, which was incorrect, and eliminated reasoning issues with respect to hasMember restrictions as well as min 1 QCRs, thus dramatically improving reasoning speed and results</li>
                    <li>BE-190 revised module-level metadata ontologies to conform to the latest top-down approach and content</li>
                    <li>BE-190 revised top-level BE metadata ontology to reflect top-down approach to describing the BE domain</li>
                    <li>BE-191 added new module metadata for the BE Functional Entities Extensions module and titles to the other module metadata ontologies</li>
                    <li>BE-191 revised URI for the extensions metadata ontology</li>
                </ul>
                <h4>DER</h4>
                <p>DER-47 added missing labels and comments, normalized property names, eliminated unused datatypes and a few properties that were not defined or referenced anywhere</p>
                <ul>
                    <li>DER-47 corrected spelling error in definition (DER-51)</li>
                    <li>DER-53 moved the rights and warrants ontology from its own module to derivatives contracts and revised all references to it; also integrated it better with the released ontologies</li>
                    <li>DER-53 moved contracts for difference from OTCMiscContracts to DerivativesContracts and integrated it a bit better with the released ontologies</li>
                    <li>DER-54 move the informative OTCDerivativesMasterAgreements ontology from Ext to DerivativesContracts, rename it DerivativesMasterAgreements and perform an initial pass through to better integrate it with the released ontologies, making it provisional rather than informative</li>
                    <li>DER-54 eliminate circular dependency between TransactionsExtended and DerivativesMasterAgreements</li>
                    <li>DER-56 added better module references for the two DER modules integrated to date</li>
                    <li>DER-56 eliminated obsolete about files now that they are no longer referenced or needed</li>
                    <li>DER-56 revised metadata files for derivatives to conform to the latest guidance and top-down approach, removing references from all DER released ontologies and updating metadata generally to support the new publication process</li>
                    <li>DER-56 tweaked to revise module definition for derivatives contracts</li>
                    <li>DER-57 added 5 additional metadata ontologies describing provisional modules in derivatives and titles to the metadata for released ontologies</li>
                </ul>
                <h4>FBC</h4>
                <p>FBC-101 added new explanatory notes to the definition of security, referencing U.S. Supreme Court rulings regarding the breadth of what can be considered a security from a legal perspective.</p>
                <ul>
                    <li>FBC-147 deprecated UniqueTradeIdentifier in favor of UniqueTransactionIdentifier; added new properties and a property chain to integrate the UTI with the generating entity LEI; deprecated properties that were used for the UniqueTradeIdentifier; addressed issue FBC-187 by changing the range of hasSettlementDate to CalculatedDate</li>
                    <li>FBC-147 moved properties 'generates' and 'isGeneratedBy' to FND/Relations, but retained those that are pertinent to the generating</li>
                    <li>FBC-179 added concepts defining BIC codes per ISO 9362:2014 to financial services entities</li>
                    <li>FBC-179 addressed merge conflict with respect to IND-65 to integrate CreditUnion</li>
                    <li>FBC-179 integrated BIC code data record and registry information</li>
                    <li>FBC-179 loosens constraint on the prefix, revises text of suffix notes to reflect time passing, revises definition of the ISO 9362 RA, revises name of the property indicating how the content / information is maintained</li>
                    <li>FBC-179 revised existing definitions for account identifiers to use those from ISO 13616; integrated definitions for bank account identifier, basic bank account identifier (BBAN), international account identifier (IBAN) and bank identifier per the ISO standard</li>
                    <li>FBC-199 eliminated older about files that are now obsolete</li>
                    <li>FBC-199 revised metadata and ontologies in FBC/FinancialInstruments according to the latest guidelines</li>
                    <li>FBC-199 revised metadata for the products and services module and ontologies per the latest recommendations</li>
                    <li>FBC-199 revised metadata in the metadata and released ontologies for FBC/DebtAndEquities</li>
                    <li>FBC-199 revised the functional entities ontologies and remaining metadata and all files to conform to the lastest approach to metadata for FIBO</li>
                    <li>FBC-41 revised metadata for Arrangements and Classification Schemes per the latest FIBO policy; updated the example for industry sector classification schemes to include an EU example per this issue.</li>
                    <li>FBC-45 complete integration with Obligor / Obligee (FBC-44) and address the need for the definition of borrower and lender to include credit agreements in addition to debt instruments (FBC-110); eliminated AllFBC-Abridged since we need the country codes for the latest version of the business registries ontology which defines SWIFT for BIC codes, and the abridged version is missing those, and nothing referenced it.</li>
                    <li>FBC-45 revised definitions of payer and payee per the recommendation in the issue</li>
                    <li>FBC-45 revised definitions per feedback</li>
                    <li>FBC-61 simplified the definition of regulatory agency to eliminate the requirement for a regulator to regulate some aspect of human activity</li>
                </ul>
                <h4>FND</h4>
                <p>FND-208 Additional metadata files for Extension and Informative modules in FND, plus communication module until that is deprecated. Include abstracts and editorial notes identifying whether extension or original content. Deleted the FND ontologies selected and references to them from MetadataX files for their module, except when the module became empty it was deleted too.</p>
                <ul>
                    <li>FND-212 eliminate duplicate property and overreaching inheritance relationships in the party role context informative ontology</li>
                    <li>FND-213 corrected various hygiene issues uncovered during testing</li>
                    <li>FND-214 Change rdfs:comment to skos:definition for class Maturity Level</li>
                    <li>FND-216 adjusted metadata in a couple of provisional ontologies and one additional set of changes in Relations</li>
                    <li>FND-216 completed revisions of the next 5 modules (content ontologies) to reflect the latest top-down metadata approach</li>
                    <li>FND-216 corrected missing module ontologies in extensions Make CIVClassification have maturityLevel of Informative as per its URI and abstract</li>
                    <li>FND-216 eliminate obsolete about files</li>
                    <li>FND-216 next 8 metadata ontologies normalized with respect to the latest top-down policy Update Metadata files to adopt top-down approach using dct:hasPart. Other editorial updates.</li>
                    <li>FND-216 next 8 normalized metadata ontologies using the top-down approach</li>
                    <li>FND-216 normalized metadata in remaining metadata ontologies as well as in the FND "all" file; eliminated the no longer necessary abridged version of the "all" file since nothing references it</li>
                    <li>FND-216 revised first six FND released modules (ontologies only) to normalize metadata</li>
                    <li>FND-216 revised initial set of 8 metadata ontologies for FND to normalize the contents with respect to the other domains and latest top-down policies</li>
                    <li>FND-216 revised metadata for the remaining group of FND released content ontologies to conform to the latest policy</li>
                    <li>FND-216 slight revisions to "all" FND and to the Ownership and Control module definition; revised metadata ontology for all of FND using the top-down strategy from the latest policy</li>
                    <li>FND-217 additional adjustments to restrictions to correct reasoning results</li>
                    <li>FND-217 eliminated unnecessary restrictions and revised others to correct reasoning results</li>
                    <li>FND-217 modified remaining min 1 qualified cardinality restrictions in FND to be someValuesFrom</li>
                    <li>FND-218 moved the communication ontology from its own module in FND to arrangements (and renamed to communications), adjusted references to it accordingly</li>
                    <li>FND-220 eliminated the deprecated BusinessFacingTypes ontology altogether</li>
                </ul>
                <h4>IND</h4>
                <p>IND-30 revised the definitions for price and term structure to leverage the new dated structured collection definition in FND; added a new definition for PriceVolatility largely based on what we had for Volatility originally, revised the definition of Volatility to be more general</p>
                <ul>
                    <li>IND-30 added the concept of a dated, structured collection to arrangements to support definition of volatility, but it could also be used to define the set of transactions associated with an account</li>
                    <li>IND-30 added the notion of collection size to arrangements, cleaned up the definition of variance, etc. per FCT recommendations</li>
                    <li>IND-30 loosened constraints on the new hasCollectionSize property (to avoid wrong inferences), added dispersion, average absolute deviation, additional restriction and annotations on mean, median, median absolute deviation, revised standard deviation and variance to leverage dispersion plus added annotations, introduced additional constraints on volatility</li>
                    <li>IND-30 modifications to address feedback, including changing certain restrictions to equivalences, adding a new property to specifically relate a measure to the observations over which that measure is being made, etc.</li>
                    <li>IND-47 revised FpML reference interest rates based on latest publication, including additional treasury rates</li>
                    <li>IND-65 further generalized the definition of credit union by loosening the constraint that a credit union must be a corporation, which may only be true in the US, and added a parent of cooperative society; also removed unnecessary sources for the definition, which came from the NCUA originally, loosened slightly to cover Canadian credit unions - the other sources were to back up the notion that credit unions are not limited to the US</li>
                    <li>IND-65 generalized the definition of credit union to the financial services entities level, deprecated the unique US and Canadian concepts, added a US-specific credit union that is also a thrift institution and updated references to the orignal US concept, as credit unions exist in other parts of the world not limited to North America</li>
                    <li>IND-68 Modified property actualExpression to be a datatype property and added an explanatory note</li>
                    <li>IND-68 revised all IND metadata and the ontologies that reference it, including elimination of older about files, per the current FLT metadata strategy Added dct:abstract to all Metadata files that did not have them, in FND, for FIBO metadata file, and in non-Release domain modules, in response to Hygiene test issues in FND-208.</li>
                    <li>IND-71 changed annotation usage of actualExpression to a hasValue restriction to eliminate punning issues</li>
                </ul>
                <h4>SEC</h4>
                <p>SEC-30 normalized restrictions on business license to reflect changes to legal capacity and cleaned up some remaining min 1 QCRs</p>
                <ul>
                    <li>SEC-32 corrected the module abbreviation for the Metadata SEC Equities ontology</li>
                    <li>SEC-32 further updated the definition of hasCoupon, eliminated the concept of a subordinated voting right given its limited applicability and other restrictions that cover voting rights</li>
                    <li>SEC-32 incorporated the concept of a qualified dividend, added missing definitions, and other minor changes per the SEC FCT telecon of 7/30/2018</li>
                    <li>SEC-32 initial pass at cleaning up the concepts, definitions, and dependencies in ShareTerms - eliminated dependencies on ontologies that were either informative or provisional in MD, Bonds, etc.; colapsed distinction between dividends and dividend terms, shares and share terms, renamed concepts from preference share to preferred share, added missing definitions as needed, and eliminated circular dependencies on Equity Pricing in MD; eliminated limited partnership equities (concepts were moved to equity instruments in earlier commit)</li>
                    <li>SEC-32 merged contents of ShareholderRights into ShareTerms to eliminate a circular dependency and eliminated the ShareholderRights ontology as a result</li>
                    <li>SEC-32 merged the contents of LimitedPartnershipEquities into EquityInstruments and eliminated the LimitedPartnershipEquities ontology; eliminated the EquityIssuanceTerms ontology (redundant with securities issuance)</li>
                    <li>SEC-32 minor tweaks and revised the status of both Equity Instruments and Share Terms to 'Release' from 'Provisional'</li>
                    <li>SEC-32 renamed PreferenceShare to PreferredShare; eliminated references to ShareholderEquity (including terms related to senior and junior equity, which SMEs have said is incorrect), and eliminated the ontology as a part of the clean-up work outlined in SEC-32</li>
                    <li>SEC-33 corrected spelling errors in the definition of the classification scheme for a SEDOL code</li>
                    <li>SEC-36 eliminated / deprecated remaining references to IssuedEquity, which is now deprecated</li>
                    <li>SEC-36 first pass at sorting out terminology related to equity instruments, including clean-up of higher-level concepts in accounting equity, several BE ontologies, and a number of Equities ontologies</li>
                    <li>SEC-36 minor revisions as discussed in the FND FCT including correction of a definition and creating a concept for issued capital in the balance sheet balances ext ontology</li>
                    <li>SEC-39 Moved contractual right, contractual obligation, and contractual option to LegalCapacity from ContractualConstructs once all of the dependencies these concepts had on other things had been moved; eliminated references to contractual constructs and replaced them with references to legal capacity (including equity instruments and share terms in SEC/Equities, which were the primary impetus for this issue), and then deleted AgreementsExt/ContractualConstructs</li>
                    <li>SEC-39 Moved the following from construct aspects to LegalCapacity: claim, contingent right, contingent obligation, legal right, legal obligation and eliminated the SocialConstructsExt/ConstructAspects ontology as a consequence once the references to it were replaced with references to LegalCapacity</li>
                    <li>SEC-39 added a restriction to link an obligor to a commitment; eliminated a redundant restriction on contractual commitment</li>
                    <li>SEC-39 eliminated a parent of claim on contractual right and added a restriction on contractual obligation that it is conferred by contract</li>
                    <li>SEC-39 eliminated additional min 1 QCRs from legal capacity</li>
                    <li>SEC-39 eliminated redundant classes in preparation for integrating some of the concepts in construct aspects with contracts</li>
                    <li>SEC-39 eliminated the distinction between contractually conferred commitment and contractual commitment, between contractual agreement and contract and circularity between contract extensions and contractual constructs, again as a part of the unwinding process needed to integrate contractual constructs with contracts such that equity instruments can depend on the combined result</li>
                    <li>SEC-39 integrated contractual commitment-related restrictions into contracts to limit remaining concepts defined in contracts extensions (which only transactions extensions depends on now), again to clean things up in preparation for merging contractual constructs with contracts; also eliminated duplicate class declarations from contract elements</li>
                    <li>SEC-39 moved contractual relationship from contracts extended to where it was used in transactions extended and eliminated contracts extended (now void of content)</li>
                    <li>SEC-39 moved hasObligation and isObligationOf from payments and schedules to agreements (using deprecation) and integrated Obligor and Obligee into payments and schedules</li>
                    <li>SEC-39 moved obligor, obligee and beneficiary to agreements; moved various other properties from legal construct parties to the ontologies in which they were used in order to clean up references and eliminated the Legal Constructs Parties ontology</li>
                    <li>SEC-39 revised equity instruments to refine equity position</li>
                    <li>SEC-39 revised number of votes per share and number of shares held to xsd:decimal to account for fractional shares, and revised a couple of definitions/labels</li>
                    <li>SEC-39 revised restrictions on license and eliminated ContractsIllustrative, which duplicated contents of the legal capacity ontologies with respect to license, licensee, and licensor, and was not referenced by anything</li>
                    <li>SEC-51 added missing definition and deprecated hasSettlementDate (no longer referenced anywhere) in favor of the property of the same name in FBC</li>
                    <li>SEC-51 added missing inverse property for 'lists' / 'isListedVia' as requested by SEC-37</li>
                    <li>SEC-51 eliminated additional missing definitions in released securities ontologies</li>
                    <li>SEC-51 revised the definition of hasFirstTradeSettlementDate such that it is no longer a child of hasSettlementDate, which is a calculated date; added definitions and notes and revised the range of hasActualClosingDate and hasFirstTradeDate to be more specific given their definitions</li>
                    <li>SEC-52 revised all securities metadata for released ontologies and all metadata ontologies per the latest FLT policies and in preparation for the FIBO 2.0 OMG release</li>
                    <li>SEC-53 eliminates a duplicate property and provides definitions for other properties for which definitions were lacking</li>
                    <li>SEC-54 changed annotation usage of actualExpression to a hasValue restriction to eliminate punning issues</li>
                    <li>SEC-57 eliminated conflicting restriction in debt issuance that caused an error in Protege, and some additional duplication</li>
                </ul>
                <h4>INFRASTRUCTURE</h4>
                <p>INFRA-311 Add maturity to the Metadata files, so that this will trigger them to appear in the PROD release zip.</p>
                <ul>
                    <li>INFRA-342 Correct namespace for OrdinaryDividend</li>
                    <li>INFRA-344 eliminated references to modules in all file for FND; added relevant metadata from the metadata ontology to the all file to make it available for Protege users; eliminated reference to module in payments and schedules ontology in FND</li>
                    <li>INFRA-344 revised all files for the DER,SEC,FBC,BE and IND domains, eliminating references to the metadata ontologies but adding metadata to support Protege users Include SecuritiesIdentificationIndividuals in the hasPart list for SecuritiesModule</li>
                    <li>Merged the 2 classes from CIVFundsExt/CIVClassification into the main CIV ontology and deleted the CIVFundsExt module.</li>
                    <li>Remove Metadata imports from files in BE,FND and FBC. Tidy up extraneous MetadataArrangements import in ClassificationSchemes.</li>
                </ul>
                

                <h3 id="2018Q2"><strong>2018 Q2</strong></h3>
                <p class="text"><em>Highlights</em></p>
                <p>Primary changes this quarter include new regulatory reporting material, clean-up of open issues, elimination of informative/provisional content that was redundant or has been incorporated into released ontologies, and a revised metadata strategy to support several FIBO products such as FIBOpedia. The work performed this quarter will help with integration of Level 2 GLEIF Legal Entity Identifier (LEI) support in Q3, as well as integration of equities and additional debt-related concepts in the Securities domain.</p>
                <h4>BE</h4>
                <ul>
                    <li>BE-175 - eliminate the unused and redundant OwnershipPartiesExtras ontology</li>
                    <li>BE-175 - eliminated unused ControlPartiesExtras ontology, which contained redundant content that was not referenced anywhere</li>
                    <li>BE-175 - eliminated unused and duplicative UltimateBeneficialOwners ontology</li>
                    <li>BE-175 - eliminated unused and duplicative corporate ownership extras ontology</li>
                    <li>BE-175 - eliminated unused and duplicative process entities ontology from BE/FunctionalEntitiesExt</li>
                    <li>BE-175 - eliminated unused and duplicative reporting entities ontology from BE/FunctionalEntitiesExt</li>
                    <li>BE-177 - added missing definitions to CorporateControl</li>
                    <li>BE-177 - added missing label and definition to the deprecated SoleProprietorship class in the FunctionalEntities ontology, copying those from the equivalent class in the sole proprietorships ontology</li>
                    <li>BE-177 - addressed missing definition and other details with respect to company incorporated by guarantee, eliminated min 1 QCRs in favor of someValuesFrom</li>
                    <li>BE-177 - adjusted metadata and added a definition for controlling equity, which was missing</li>
                    <li>BE-177 - revised the definition of majority controlling party to correct wrong subclass relationship and add missing definition</li>
                    <li>BE-179 revised restriction on LEIRegisteredEntity to be someValuesFrom, which corrected the reasoning error as well as the logic, and added an explanatory note; updated ontology metadata in preparation for FIBO 2.0 publication with respect to the change note.</li>
                    <li>BE-179 revised restriction on LEIRegisteredEntity to be some</li>
                    <li>BE-187 - modified the domain/range of a number of properties to be the union of a legal entity and formal organization rather than being limited to a formal organization given that both hierachies are required to define the set of business entities of interest - the concepts overlap but are not identical, and loosening the domain (or range) is needed to support the complete set of cases; also fixed the definition of isSubUnitOf, which had two domains and no range rather than a domain and range according to its definition</li>
                    <li>BE-187 - modified the domain/range of a number of properties</li>
                    <li>BE-188 - revised BE metadata and all files to incorporate the latest revisions to the FIBO FND all files and new top-level specification individual</li>
                    <li>BE-188 - revised DER metadata to include the FIBO specification individual</li>
                    <li>BE-188 - revised IND metadata to include the top-level specification individual</li>
                    <li>BE-188 - revised SEC metadata to include the new top-level FIBO specification individual</li>
                    <li>BE-188 - tweaked one BE all file and revised FBC metadata to incorporate the new FIBO specification individual</li>
                </ul>
                <h4>DER</h4>
                <p>DER-45 - introduced a new all file that imports all of the production ontologies, including reference individuals</p>
                <ul>
                    <li>DER-45 - introduced revised metadata ontology for rate derivatives</li>
                    <li>DER-45 - new "all" file for DER that loads the t-box primarily, not reference individuals</li>
                    <li>DER-45 - new initial metadata ontology for the DER domain</li>
                    <li>DER-45 - new metadata ontology for the Derivatives Contracts module</li>
                    <li>DER-45 - removed older style metadata ontologies</li>
                    <li>DER-46 Delete classification facets ontology in DER.</li>
                    <li>DER-46 Delete classification facets ontology in DER.</li>
                    <li>DER-48 - corrected URI in imports statement</li>
                    <li>DER-48 - eliminate references to DerivativesBasicsExt, and migrate data and time concepts from TimeExt to FinancialDates in EquityForwards</li>
                    <li>DER-48 - eliminate references to unused SwapsExt ontology, including the ontology itself</li>
                    <li>DER-48 - eliminate references to unused ontologies in CommodityForwards, including but not limited to DerivativesBasicsExt</li>
                    <li>DER-48 - eliminate unused references to Ext ontologies in imports in Swaptions</li>
                    <li>DER-48 - eliminate unused references to imported ontologies including DerivativesBasicsExt, but also others that create circular imports</li>
                    <li>DER-48 - eliminated reference to DerivativesBasicsExt and replaced a duplicate property with the property from Relations in ExchangeTradedOptions</li>
                    <li>DER-48 - eliminated the DerivativesBasicsExt ontology altogether</li>
                    <li>DER-48 - replace references to DerivativesBasicsExt and TimeExt with the appropriate references from production ontologies (DerivativesBasics and FinancialDates); moved ObservableUnderlier to Options from DerivativesBasicsExt</li>
                    <li>DER-48 - replaces references to DerivativesBasicsExt and TimeExt with production ontologies (DerivativesBasics and FinancialDates)</li>
                    <li>DER-48 - revised the loans catalog to recognize where (1) the new Settlement ontology is in FBC, (2) incorporate Lifecycles from FND, which was not in the catalog, and eliminate references to the DER/DerivativesContractsExt files that have been eliminated</li>
                    <li>DER-50 - also, revised the restriction on unique swap identifier, as it applies to a swap but may not necessarily identify it, despite the name of the identifier</li>
                    <li>DER-50 - corrected label on swap terms and also revised parent of unique swap identifier to be a securities transaction identifier rather than a unique trade identifier, since the former is more general and appropriate in this case</li>
                    <li>DER-50 - corrected label on swap terms and also revised pare...</li>
                </ul>
                <h4>FBC</h4>
                <p>FBC-186 - modified definitions per the revisions provided by Mike Atkin / Quarule</p>
                <ul>
                    <li>FBC-186 - modified definitions per the revisions provided by...</li>
                    <li>FBC-188 - eliminated unused properties, redundant concept fo...</li>
                    <li>FBC-189 - eliminated redundant restriction on the relatesTo property, which can still be used to relate trades to one another as needed</li>
                    <li>FBC-189 - eliminated redundant restriction on the relatesTo ...</li>
                    <li>FBC-191 - eliminate duplication related to issuer, registration authority, listing, etc. to the degree possible</li>
                    <li>FBC-191 - eliminated a number of duplicate concepts in favor ot those in released ontologies, such as OfferIssue --&gt; SecuritiesOffering, issuer, identity, to clean up content related to the CFTC demonstration this week in DC</li>
                    <li>FBC-191 - eliminated additional issues in the equities ipo issuance ontology, including removing the duplicate concepts related to listing details, creating a new class as the parent of various IPO-related process steps, adding intervening party-in-role parent classes as needed, replacing the process start and end with a date period, etc., all in an attempt to rationalize what remains in this ontology (not nearly complete, but better)</li>
                    <li>FBC-191 - eliminated duplicate hasIdentity property from securities issuance process in pool-backed securities</li>
                    <li>FBC-191 - eliminated duplicate issuer property in CDOs, replaced with isIssuedBy</li>
                    <li>FBC-191 - eliminated duplicate issuer property in depositary receipts</li>
                    <li>FBC-191 - eliminated duplicate issuer property in participation notes</li>
                    <li>FBC-191 - eliminated duplicate issuer property in rights and warrants</li>
                    <li>FBC-191 - eliminated duplicate references in loan participation notes, including issuer, hasTerms, etc.</li>
                    <li>FBC-191 - eliminated duplicate usage (with incorrect semantics) of isIssuedBy (issuer) and corrected inheritance in MortgageBackedSecurities</li>
                    <li>FBC-191 - eliminated duplication with respect to issuer, offering, debt offering in Muni issuance</li>
                    <li>FBC-191 - incorporated financial services entities to correct the reference to bank (which may be overly narrow, but the relevant FCT can make that determination)</li>
                    <li>FBC-191 - replace duplicate offer issue in credit ratings with securities offering</li>
                    <li>FBC-192 - added min 0 financial instrument identifier to financial instrument; deprecated standardized terms set in favor of standardized terms per the approach we've taken with contract terms more generally (only cited in this ontology to date, although this class will be needed for ISDA master agreements)</li>
                    <li>FBC-192 - added min 0 financial instrument identifier to fin...</li>
                    <li>FBC-193 - revised an LOU identifier to be an organization identifier; updated address properties to be on physical address rather than registration address so that they can be used for people as well as for organizations</li>
                    <li>FBC-193 - revised an LOU identifier to be an organization id...</li>
                    <li>FBC-195 - replaced "about" files for Business Entities with new metadata and "all" files per the latest metadata policy, as well as revising the FBC all files to reflect these changes</li>
                    <li>FBC-195 - revise the set of FBC metadata and "about" files to reflect the new metadata strategy and incorporate new "all" files for FBC, with requisite updates to the IND "all" files</li>
                </ul>
                <h4>FND</h4>
                <p>FND-193 - (1) added a generic definition for consumer to the products and services ontology in FND, (2) changed the definition of consumer in economic indicators to be a child of the new generic definition, (3) revised the US and Canadian definitions of CPI to use the new definition of CPI consumer in economic indicators</p>
                <ul>
                    <li>FND-193 - deprecated original definition of consumer and made it equivalent to the new one in FND</li>
                    <li>FND-194 - Editorial fixes to North American and European about files for FBC; corrected URIs in the North American examples about file</li>
                    <li>FND-194 - added about FBC 2.0 with European entities, including all current relevant individuals</li>
                    <li>FND-194 - augmented BE North America with the region codes for remaining Northern American regions according to the UN</li>
                    <li>FND-194 - eliminated unused FBC 1.1 about files and completed the set of 2.0 about files with the combined EU and NA ontology</li>
                    <li>FND-194 - initial FBC 2.0 about files for the primary ontologies, excluding individuals for governments, jurisdictions, financial services entities, regulatory agencies, registries, etc.</li>
                    <li>FND-194 - initial pass at revising the about files for FND towards FIBO 2.0, including updating dates, adding an abstract, eliminating some (not all) OMG specifics in advance of revised metadata to augment what we currently have; updates AboutFND, AboutFND-2.0 (including the new lifecycles ontology) - renamed from AboutFND-1.3, and a new AboutFND-2.0-Abridged that eliminates currency codes and related language and country codes as requested by some users for faster reasoning; Note that the version about files have been moved from a subdirectory up to the fnd level to make them easier to find as well.</li>
                    <li>FND-194 - initial pass at revising the about files for FND t...</li>
                    <li>FND-194 - minor adjustments to the BE about files (editorial)</li>
                    <li>FND-194 - revised URIs in the examples about file for north america</li>
                    <li>FND-194 - revised the AboutBE-2.0-Europe file to load all of the European subregions, in anticipation of generation of the relevant entity form codes from the GLIEF.</li>
                    <li>FND-194 - revised the BE about files to be as minimal as possible, leveraging other about files to reduce maintenance, including an abridged version that does not include individuals</li>
                    <li>FND-194 - this makes a minor change to the AboutFND ontology and adds the About BE ontologies corresponding to those added in FND. AboutBE-2.0 excludes individuals from both FND and BE, and the other BE about files incorporate the appropriate regional information as well as currency codes.</li>
                    <li>FND-196 - Revised LoanHMDA ontology to use new reporting references over deprecated documents and provisional communications references</li>
                    <li>FND-196 - revised LoanContracts to use new reporting concept for report over the deprecated concept in Documents</li>
                    <li>FND-196 - revised documents ontology per change made by the FND FCT / MB, but with corrected annotations and deprecating elements that were moved to the new reporting ontology; new reporting ontology to cover the report-specific definitions that had been in documents to eliminate circularity</li>
                    <li>FND-196 - revised regulatory agencies ontologies to reference the report class from the new reporting ontology in FND</li>
                    <li>FND-196 removal of Reporting terms from Documents into a new Reporting ontology to remove circular dependencies between Documents and Parties. This will impact one reference in FBC and two in Loans.</li>
                    <li>FND-196 removal of Reporting terms from Documents into a new Reportin...</li>
                    <li>FND-197 - added reporting to the abridged FND import file, but not the two mapping ontologies yet, which may not be required</li>
                    <li>FND-197 - eliminated all references to the BusinessFacingTypes ontology, which is still in the released set but no longer used.</li>
                    <li>FND-197 - initial mapping ontologies from FND to LCC</li>
                    <li>FND-197 - integrated mappings from LCC to FIBO (top level) in-line within FND ontologies</li>
                    <li>FND-197 - made federal state a subclass of country subdivision rather than equivalent to it (and deprecating it)</li>
                    <li>FND-197 - replace occurrences of Location, GeopoliticalEntity, and Country that have been deprecated with their counterparts in LCC</li>
                    <li>FND-197 - revised about file for all of FND, which includes parts of LCC, to also include the mapping between FIBO and LCC</li>
                    <li>FND-205 fixed an error in MetadataFND (had not included OWL Import for fibo-spec).</li>
                    <li>FND-205 replace About files with Metadata files; About version files with All and All Abridged files; update metadata.</li>
                </ul>
                <h4>IND</h4>
                <p>IND-18 added a property on statistical measure that allows for a high-level description of the calculation used to arrive at a result and incorporated that as a restriction on the class statistical measure (optional)</p>
                <ul>
                    <li>IND-18 added a property on statistical measure that allows f...</li>
                    <li>IND-19 - deprecated the two has &lt;x&gt; context properties in favor of is characterized by, with the proper semantics to define a statistical population</li>
                    <li>IND-38 - updated the about file for the entire IND domain area to reflect current policies and participants</li>
                    <li>IND-48 - added a restriction to FloatingInterestRate inside of the interest rates ontology to connect it to a reference rate</li>
                    <li>IND-48 - added about files for FIBO 2.0 indicators and indices, similar to what we have done for FND, BE, and FBC, which are helpful in testing and in loading subsets of the released FIBO ontologies</li>
                    <li>IND-51 - revised the definition of consumer for CPI to (1) eliminate the acronym from the class name and be more explicit about what it is we are defining, and (2) limit it to people generally rather than only 'natural persons'</li>
                    <li>IND-51 - revised the definition of consumer for CPI to (1) e...</li>
                    <li>IND-61 - added definitions where they were missing, changed altLabels and prefLabels to rdfs:label and fibo abbreviation as appropriate</li>
                    <li>IND-61 - added definitions where they were missing, changed ...</li>
                    <li>IND-61 - added new top level metadata ontology for IND</li>
                    <li>IND-62 - replaced benchmark with market rate, eliminated duplicate concepts and properties (some, not all)</li>
                    <li>IND-62 - revised market rate to include the synonym of benchmark, simplified the definition, and updated metadata</li>
                    <li>IND-62 - revised market rate to include the synonym of bench...</li>
                    <li>IND-64 - replace remaining references to CPIConsumer with UltimateConsumer</li>
                    <li>IND-66 - corrected label on urban CPI (CPI-U)</li>
                    <li>IND-67 - added all file for loading reference rates for IND, editorial change to the North American all file, modified SEC all files to reference the new IND all files rather than older about files, and eliminated all of the older IND about files</li>
                    <li>IND-67 - added all files for IND (vanilla, without reference rates) and IND North America (without reference rates)</li>
                    <li>IND-67 - added new module level metadata ontologies (and revised one) for all of the released IND modules</li>
                    <li>IND-67 - revised metadata ontology for the economic indicators module of IND</li>
                </ul>
                <h4>SEC</h4>
                <p>SEC-30 Add Metadata files for Debt sub modules</p>
                <ul>
                    <li>SEC-30 - added 2 new about files for Securities that cover (1) basic securities content without individuals, and (2) all of FND, BE, FBC, IND, and SEC in release, including reference individuals</li>
                    <li>SEC-30 - added new AllSEC file and eliminated the corresponding AboutSEC-2.0 file for loading the t-box component of securities and all of its inputs</li>
                    <li>SEC-30 - added the reference individuals version of the all file; revised copyrights per the FLT discussion</li>
                    <li>SEC-30 - another minor adjustment to header for this new ontology</li>
                    <li>SEC-30 - corrected URIs in all reference individuals ontology</li>
                    <li>SEC-30 - minor additional adjustments to module level metadata, added new equities module metadata</li>
                    <li>SEC-30 - replaced AboutSEC with the new strategy for module level metadata as MetadataSEC</li>
                    <li>SEC-30 - replaced module level Securities metadata ontology with one in the new style</li>
                    <li>SEC-30 - revised Securities domain module descriptions, including the primary SEC domain as well as the Debt and Securities modules</li>
                    <li>SEC-30 - revised further to reflect Pete's additional comment</li>
                    <li>SEC-30 - revised metadata based on feedback from FPT members</li>
                    <li>SEC-30 - revised metadata file for the SEC module and added the new metadata module for SEC Debt</li>
                    <li>SEC-31 - eliminate stray imports of securities tax treatment</li>
                    <li>SEC-31 - eliminate the unused securities risk ontology (not referenced) as the restrictions / properties should be derived from an entity's domicile and thus are redundant; also, an overall approach to understanding risk is needed rather than these three properties/restrictions, which are out of context for any risk program</li>
                    <li>SEC-40 - eliminate remaining references to SecuritiesExt; revise Settlement to eliminate punning</li>
                    <li>SEC-40 - eliminated the subclass on security in securities ext -- not al securities are transferable contracts</li>
                    <li>SEC-40 - eliminated unnecessary references to SecuritiesExt and in one case added a class to SecuritiesIssuance for contract terms specific to securities that was present in SecuritiesExt but not in the released ontology</li>
                    <li>SEC-40 - moved SecurityNote from SecuritiesExt to MortgageBackedSecurities, where it is used.</li>
                    <li>SEC-40 - moved content related to settlement to a new provisional ontology in FBC</li>
                    <li>SEC-40 - replace references in the Spots ontology to SecuritiesExt with references to the new settlement ontology</li>
                    <li>SEC-40 - replace the term 'stake' in CIV with 'position' from FBC, which has the same definition (thus eliminating the duplicate class from SecuritiesExt)</li>
                    <li>SEC-41 - revised SEC definitions based on those provided in the spreadsheet attached to this issue</li>
                    <li>SEC-41 - revised SEC definitions based on those provided in ...</li>
                    <li>SEC-43 - added properties for hasBorrower and hasLender to the basic debt ontology for reuse in a number of places where they are duplicated</li>
                    <li>SEC-43 - eliminate additional duplication between LoanCore and other provisional loan-related ontologies per requirements for the Wells Fargo project; LoanCore should be the driver here, given that it is more recent and more complete</li>
                    <li>SEC-43 - imported the basic debt ontology into LoanBasicTerms, replaced properties hasBorrower and hasLender with the new equivalent properties in Debt</li>
                    <li>SEC-43 - merged changes for LoansBasicTerms with respect to FBC-188</li>
                    <li>SEC-43 - replaced duplicate payments concept from LoansEvents with the one in the released FND ontology for payments</li>
                    <li>SEC-43 - replaced numerous duplicate concepts with those from released ontologies</li>
                    <li>SEC-43 - replaced property hasBorrower with the new one in the Debt ontology</li>
                    <li>SEC-43 liminated duplicate / unnecessary properties in LoansCollateral with their equivalents in Debt</li>
                    <li>SEC-44 - eliminated registration requirement, which would not be useful operationally aside from during the process of issuing a security (where there is still such a concept), and did not have sufficient semantics to warrant the cycle it introduced into the ontology</li>
                    <li>SEC-44 - eliminated registration requirement, which would no...</li>
                    <li>SEC-45 - added support for the ISO 18774 FISN (financial instrument short name)</li>
                    <li>SEC-45 - eliminates the remaining content of the SecuritiesExt ontology given the addition of the structured name to the SecuritiesIssuance ontology</li>
                    <li>SEC-50 - corrected syntax issues in property declarations resulting from SEC-45</li>
                    <li>SEC-50 - corrected syntax issues in property declarations re...</li>
                    <li>SEC-51 - eliminated reference to securities tax treatment (which was overly simplified and largely unused) in bonds tax treatment (which may also be overly simplified and not useful, but for the Bonds FCT to address)</li>
                    <li>SEC-51 - eliminated restriction with respect to securities tax treatment in SecuritiesExt, which is largely about settlement, but where the tax details available in the tax treatment ontology were overly simplified and insufficient to provide utility; an independent effort with respect to taxation generally is needed eventually, once the FIBO community determines that it is a priority.</li>
                    <li>SEC-51 - eliminated securities tax treatment, which was tiny, overly simplified, and not very useful in general once references to it were eliminated</li>
                    <li>SEC-43 - eliminated numerous duplicate concepts and properties from LoansEvents and replaced them with their equivalents from released ontologies</li>
                </ul>
                

                <h3 id="2018Q1"><strong>2018 Q1</strong></h3>
                <p class="text"><em>Highlights</em></p>
                <ul>
                    <li>Complete support for GLEIF LEI-CDF v2.1 Level 1, with Level 2 support in progress, including example individuals</li>
                    <li>Complete support for representation of the GLEIF Registration Authorities List (RAL), including example individuals</li>
                    <li>High-level mapping from financial products to financial instruments</li>
                    <li>Updates to Economic Indicators, Reference Interest Rates (including complete coverage for FpML Floating Interest Rates)</li>
                    <li>Continued integration of provisional content for Securities, Equities, and Debt instruments and remediation of duplication</li>
                    <li>Continued integration of provisional content for Derivatives, sufficient for prototyping Swap Data Repository reporting of Interest Rate Swaps, with testing of Options-specific content underway</li>
                </ul>
                <h4>BE</h4>
                <ul>
                    <li>BE-170 - changed rdfs:subclass for LEI Registered Entity to owl:equivalentClass</li>
                    <li>BE-170 - incorporated LEI eligible entity and LEI registered entity (note that for LEI registered entity we may want to consider adding more restrictions in FBC, e.g. the LOU / registry in which it is registered)</li>
                    <li>FBC-145 - revised the super property of several has&lt;x&gt;Address properties in formal business organizations to be hasAddress rather than 'has'</li>
                    <li>BE-169 - moved the CorporationEquity ontology, which still needs review, to SEC/Equities, since it depends heavily on other ontologies in that subdomain and thus cannot be in BE due to circular dependencies</li>
                    <li>BE-168 - eliminated unused ontology, corporations extras, which contained only one class not referenced anywhere</li>
                    <li>Delete malformed SKOS import statement and declarations as per the JIRA ticket.</li>
                    <li>FBC-160 - loosened the constraint on LEI to apply to a legal person, to account for cases where a polity or natural person may apply for and be assigned an LEI</li>
                    <li>FBC-160 - eliminate use of business facing types text property in favor of xsd:string</li>
                    <li>FBC-160 - loosen the definition of registration identifier to cover cases where an identifier is for a legal person, and to allow for cases where jurisdictions overlap or are not clear</li>
                    <li>FBC-160 - eliminated the restriction with respect to jurisdiction on business registry, as it does not apply to LOUs and should, more appropriately, be included only on certain registries or registration authorities.</li>
                    <li>FBC-160 - modify usage of hasRegistrationDate in SEC/SecuritiesListings to reflect changes made to simplify representation of these kinds of dates in FBC</li>
                    <li>FBC-160 - revised example individuals corresponding to streamlining changes made to how the business identifiers are represented (eliminating the registry entries)</li>
                    <li>FBC-160 - eliminated unnecessary classes specific to California and Delaware; modified property restriction on FRS member from isPartOf to isMemberOf (which caused incorrect inferences with respect to individuals such as Citibank</li>
                    <li>FBC-160 - revised status individuals to include source for definitions and updated the definition of active status to be a bit broader than the GLEIF definition; eliminated redundant restrictions, revised registration date properties and restrictions to be easier to use and to incorporate a higher level property called hasRegistrationDate from the basic registration ontology</li>
                    <li>FBC-160 - revisions to better support the GLEIF LEI-CDF v2.1 specification for registration of LEIs, and to simplify representation of certain concepts; (1) specifically: clarified the definition of 'registers', (2) modified the definition of a registry identifier to say that it -may- be an index to a registry rather than must be, but to add that it is registered in a registry, (3) say that a registration authority registers something, (4) modify the definition of hasRegistrationDate to make it a data property rather than object property and allow for multiple representation of date literals, similarly to what was done for business registries.</li>
                    <li>FBC-160 - revised example individuals for Citibank, Citigroup and Pinnacle Bank to reflect latest changes to the various ontologies and to include LEIs for Citibank and Citigroup</li>
                    <li>FBC-160 - revised the type of the GMEI registry from a basic registry to an LEI registry</li>
                    <li>FBC-160 - added business registry details for the State of Delaware - registry entry, file number, and registration authority code</li>
                    <li>FBC-160 - modified business registries to expand the possible values for certain registry dates to include dates, dates and times, or date time stamps; included restrictions on registries to include registry entries</li>
                    <li>FBC-160 - revisions to example California State-chartered bank to reflect changes made to the business registries and US regulatory agencies ontologies</li>
                    <li>FBC-160 - revised state registration authority content to mirror changes made to business registries in light of updates for GLIEF, etc.</li>
                    <li>FBC-160 - latest changes to the business registries ontology to reflect FCT discussions and latest mapping spreadsheet</li>
                    <li>FBC-160 - fix prefix for hasName with respect to hasRegistryName</li>
                    <li>FBC-160 - integrate changes responding to comments from Pete and Jeff Braswell on requirements for and implementation of the LEI-CDF v2.1 (incomplete but closer - address changes and testing are todo for Level 1 data, also to investigate relationships)</li>
                    <li>Fbc 160 Remove imports of skos. Use general (not version-specific) URI for import of SpecificationMetadata in Values.rdf</li>
                    <li>FBC-160 - loosened the constraint on LEI to apply to a legal person, to account for cases where a polity or natural person may apply for and be assigned an LEI</li>
                    <li>FBC-160 - eliminate use of business facing types text property in favor of xsd:string</li>
                    <li>FBC-160 - loosen the definition of registration identifier to cover cases where an identifier is for a legal person, and to allow for cases where jurisdictions overlap or are not clear Global replace of dct:description by skos:definition. Replace use of "terms" namespace by "dct"</li>
                    <li>BE-164 - eliminates duplicate definition for hasEntityLegalForm which was introduced through the re-merge process (not deleted, in other words)</li>
                    <li>BE-162 - loosened the domain on several properties to be FormalOrganization rather than FormallyConstitutedOrganization, given that certain legal entities may not have "principals" per se</li>
                    <li>FND-164 - correction to reference to URI for FND Products an</li>
                    <li>BE-160 - restored change to restriction on registration identifier such that there could be more than one, per the original change for BE-160 that was lost when pull request #420 was inadvertently lost</li>
                    <li>BE-159 - re-merging changes made originally in BE-159 / pull request #420 to revise RegisteredAddress as a child of PhysicalAddress with an updated definition (which was not properly merged / re-merged in GitHub)</li>
                    <li>BE-161 - changes required to support the revised GLEIF LEI-CDF v2.1 update, including support for transliterated names and the new entity legal form (incomplete, but with the class definition); also includes a change to add a synonym to hasAddressOfLegalFormation (BE-163) and provides provenance in general for certain definitions.</li>
                    <li>FND-164 - correction to reference to URI for FND Products and Services ontology Commit dependencies to values ontologies and business facing types As per https://wiki.edmcouncil.org/display/FND/Values+Substitutions+Page, make substitutions and updates to make ontologies referencing values consistnet with policy.</li>
                    <li>INFRA-214 INFRA-214 use opensource url for MIT license</li>
                </ul>
                <h4>BP</h4>
                <p>FLT-78 FND-78 Redid the IRI rename after resetting to latest master</p>
                <ul>
                    <li>SEC-25 - eliminated 3 Ext ontologies, including (1) SEC/Debt/DebtFoundations/ParityVariants/ - prefix was fibo-sec-dbt-dbt-par; concepts have been merged into SEC/Debt/DebtInstruments/ (fibo-sec-dbt-dbti), (2) SEC/Debt/DebtFoundationsExt/DebtInstrumentsExt/ - prefix was fibo-sec-dbt-dbtx-dbtx; concepts have been merged into SEC/Debt/DebtInstruments/ (fibo-sec-dbt-dbti), and (3) SEC/Debt/DebtFoundationsExt/GuarantyExt/ - prefix was fibo-sec-dbt-dbtx-gtyx ; concepts have been merged into FBC/DebtAndEquities/Guaranty/ (fibo-fbc-dae-gty)</li>
                    <li>FND-181 - integrates Relations and replaces duplicate properties with the one in relations (mandates / isMandatedBy) Remove imports of skos. Use general (not version-specific) URI for import of SpecificationMetadata in Values.rdf Global replace of dct:description by skos:definition. Replace use of "terms" namespace by "dct" Commit dependencies to values ontologies and business facing types As per https://wiki.edmcouncil.org/display/FND/Values+Substitutions+Page, make substitutions and updates to make ontologies referencing values consistnet with policy.</li>
                </ul>
                <h4>CAE</h4>
                <p>FLT-78 FND-78 Redid the IRI rename after resetting to latest master</p>
                <ul>
                    <li>SEC-25 - eliminated 3 Ext ontologies, including (1) SEC/Debt/DebtFoundations/ParityVariants/ - prefix was fibo-sec-dbt-dbt-par; concepts have been merged into SEC/Debt/DebtInstruments/ (fibo-sec-dbt-dbti), (2) SEC/Debt/DebtFoundationsExt/DebtInstrumentsExt/ - prefix was fibo-sec-dbt-dbtx-dbtx; concepts have been merged into SEC/Debt/DebtInstruments/ (fibo-sec-dbt-dbti), and (3) SEC/Debt/DebtFoundationsExt/GuarantyExt/ - prefix was fibo-sec-dbt-dbtx-gtyx ; concepts have been merged into FBC/DebtAndEquities/Guaranty/ (fibo-fbc-dae-gty) Remove imports of skos. Use general (not version-specific) URI for import of SpecificationMetadata in Values.rdf Global replace of dct:description by skos:definition. Commit dependencies to values ontologies and business facing types As per https://wiki.edmcouncil.org/display/FND/Values+Substitutions+Page, make substitutions and updates to make ontologies referencing values consistnet with policy.</li>
                </ul>
                <h4>CIV</h4>
                <ul>
                    <li>FLT-78 FND-78 Redid the IRI rename after resetting to latest master</li>
                    <li>FID-188 addition of new classes in TimeExt/Time and change to references to DayMonthValue in 4 ontologies. Remove imports of skos. Use general (not version-specific) URI for import of SpecificationMetadata in Values.rdf Commit dependencies to values ontologies and business facing types As per https://wiki.edmcouncil.org/display/FND/Values+Substitutions+Page, make substitutions and updates to make ontologies referencing values consistnet with policy.</li>
                </ul>
                <h4>DER</h4>
                <ul>
                    <li>IND-57 - eliminated reference to missing class (which was re</li>
                    <li>IND-57 - eliminated reference to missing class (which was redundant) and eliminated a couple of duplicate properties</li>
                    <li>SEC-25 - corrected IRI for tradable debt instrument</li>
                    <li>FLT-78 FND-78 Redid the IRI rename after resetting to latest master</li>
                    <li>SEC-25 - eliminated 3 Ext ontologies, including (1) SEC/Debt/DebtFoundations/ParityVariants/ - prefix was fibo-sec-dbt-dbt-par; concepts have been merged into SEC/Debt/DebtInstruments/ (fibo-sec-dbt-dbti), (2) SEC/Debt/DebtFoundationsExt/DebtInstrumentsExt/ - prefix was fibo-sec-dbt-dbtx-dbtx; concepts have been merged into SEC/Debt/DebtInstruments/ (fibo-sec-dbt-dbti), and (3) SEC/Debt/DebtFoundationsExt/GuarantyExt/ - prefix was fibo-sec-dbt-dbtx-gtyx ; concepts have been merged into FBC/DebtAndEquities/Guaranty/ (fibo-fbc-dae-gty)</li>
                    <li>SEC-25 - replaced reference in RightsAndWarrants to the SecurityAssetsExt ontology, and then deleted the unused ontology</li>
                    <li>IND-54 - replace references in other ontologies to MarketIndicesExt with MarketIndices (BasketIndices) Merge pull request #451 from ElisaKendall/FND-181</li>
                    <li>FND-181 - replaced duplicate property confers, which was eliminated from the informative contracts ontology, with the confers property in Relations</li>
                    <li>DER-40 - eliminated entirely un-used, unreferenced IRSwapTransactions Ext ontology</li>
                    <li>DER-40 - eliminated entirely unused, unreferenced and duplicative RateDerivativesExt ontology</li>
                    <li>DER-40 - corrected prefixes, eliminated unused imports, elimimated duplicate property, replaced reference to hasTransactionLeg with hasLeg</li>
                    <li>DER-40 - corrected missing prefixes, added a couple of missing intervening subclass relationships, eliminated duplicate property and eliminated reference to non-existant hasTransactionLeg property in favor of hasLeg</li>
                    <li>DER-40 - reconciled missing prefix definitions, eliminated bogus datatype declaration and a couple of duplicate properties, corrected odd abbreviations in labels and eliminated reference to non-existent hasTransactionLeg property</li>
                    <li>DER-40 - eliminated a few duplicate properties, eliminated reference to non-existant hasTransactionLeg property in favor of hasLeg</li>
                    <li>DER-40 - cleaned up references to unused or ext ontologies; eliminated duplicate or unused properties, eliminated references to hasTransactionLeg</li>
                    <li>FND-180 Delete malformed SKOS import statement and declarations</li>
                    <li>DER-39 - added missing definitions, renamed index derivative (which was misleading) to economic rate based derivative, removed redundant class definitions inserted by Protege</li>
                    <li>DER-39 - eliminate duplicate definitions added by Protege</li>
                    <li>DER-35 - changed superproperty for hasLeg from comprises to hasContractualElement</li>
                    <li>DER-39 - eliminated unused properties, added labels and definitions where missing Delete malformed SKOS import statement and declarations as per the JIRA ticket. Remove imports of skos. Use general (not version-specific) URI for import of SpecificationMetadata in Values.rdf Commit dependencies to values ontologies and business facing types As per https://wiki.edmcouncil.org/display/FND/Values+Substitutions+Page, make substitutions and updates to make ontologies referencing values consistnet with policy.</li>
                    <li>INFRA-214 INFRA-214 use opensource url for MIT license</li>
                </ul>
                <h4>FBC</h4>
                <p>FBC-176 - replaced wrong prefix with the one for the parties ontology</p>
                <ul>
                    <li>FLT-78 FND-78 Redid the IRI rename after resetting to latest master</li>
                    <li>FBC-144 - eliminated the restriction on Edgar Repository say</li>
                    <li>FBC-144 - eliminated the restriction on Edgar Repository saying that it is governed by US jurisdiction; retained the restriction that it is managed by the SEC</li>
                    <li>FBC-175 - removed the disjoint relationship from Guarantor (with Contract Party) and added an explanatory note</li>
                    <li>FBC-148 - added the concept of a packaged financial product, which is both a contractual product and financal product, as well as the concept of a financial product catalog, leveraging definitions provided by Nordea</li>
                    <li>FND-181 - changed source for property 'mandates' from the informative ContractualConstructs ontology to Relations</li>
                    <li>FBC-173 - replaced occurrences of isPartOf with isIncludedIn with respect to registry entries, added definitions and labels where missing</li>
                    <li>FBC-173 - addressed missing definition, change relationship between registry entries and the registries from isPartOf to isIncludedIn</li>
                    <li>FBC-173 - added definition for hasRegistryEntry and changed its superproperty from hasPart to comprises, which is more appropriate</li>
                    <li>FBC-173 - eliminated incorrect "isDefinedBy" references on classes extended from imported ontologies</li>
                    <li>FBC-173 - added missing label and definition for the Global LEI Index</li>
                    <li>FBC-173 - added missing definitions for a number of properties in Debt; eliminated isDefinedBy the local ontology on DebtInstrument, which is actually defined in FinancialInstruments</li>
                    <li>FBC-163 - corrected prefix for AgencyAgreement</li>
                    <li>FBC-167 - made LOU a child of Business Registration Authority</li>
                    <li>FBC-167 - changed the EuropeanCentralBank from a GovernmentAgency to an Instrumentality</li>
                    <li>FBC-167 - corrected serialization issues</li>
                    <li>FBC-167 - fixed URIs</li>
                    <li>FBC-167 - cleaned up individuals for EU financial services entities and regulatory agencies, added LEIs and more information as appropriate</li>
                    <li>FBC-167 - minor clean-up of various individuals, and changed certain identifiers from registry identifier -&gt; registration identifier as appropriate</li>
                    <li>FBC-167 - revised Canadian regulatory agencies (Bank of Canada) to reflect changes to the entity structure, add LEI information, etc.</li>
                    <li>FBC-167 - incorporate hasWebsite into description of agencies and entities as appropriate, ensure complete coverage of registry content from the GLEIF registration authorities list</li>
                    <li>FBC-167 - revised the definition of hasWebsite so that it might be more broadly useful</li>
                    <li>FBC-163 - revised adaptedFrom to be seeAlso, and added more references</li>
                    <li>FBC-163 - correct DTC headquarters address (duplicate entry)</li>
                    <li>FBC-163 - revised financial services entities to reflect changes in agent for service of process representation and augment a number of organizations with LEI information</li>
                    <li>FBC-163 - move agent for service of process to financial business and commerce, and add registration authority information for South Dakota</li>
                    <li>FBC-163 - move AgentForServiceOfProcess from USRegulatoryAgencies up to a higher, more general level in financial products and services where other agency concepts are located</li>
                    <li>FBC-168 - eliminate relationships from regulates and is regu</li>
                    <li>FBC-167 - revised LEI representation strategy for EU financial services entities corresponding similar changes for US entities under FBC-163</li>
                    <li>FBC-163 - revised URIs and added imports to cover the definition of Agent for Service of Process</li>
                    <li>FBC-163 - integrates LEI information for Corporation Service Company (added as an Agent for Service of Process to USRegulatoryAgencies) and for the Federal Reserve Bank of New York (as revised in USRegulatoryAgencies); revises LEI representation for Bloomberg to correspond to the changes made in representation in the USRegulatoryAgencies</li>
                    <li>FBC-165 - corrects modeling of InstitutionType; FBC-141 - eliminates extraneous restrictions on various individuals including isIdentifiedBy and represents on Federal Reserve Districts; FBC-169 - corrects modeling of Federal Reserve District Banks to be part of the Federal Reserve; FBC-163 - adds AgentForServiceOfProcess to FBC and introduces two of them as needed to model certain US financial institutions</li>
                    <li>FBC-168 - eliminate relationships from regulates and is regulated by with governs; eliminate unnecessary / redundant restrictions - per review with OFR</li>
                    <li>FBC-115 - renamed property isTransferable to isNegotiable (via deprecation), added two subclasses of Security including NegotiableSecurity and NonNegotiableSecurity, which are disjoint and revised the definition of Security appropriately; deprecated redundant property hasIssuer in favor of isIssuedBy, which was recently moved to FND; addressed FBC-161 by eliminating a restriction on FinancialInstrument with respect to being identified by exactly 1 identifier; addressed FBC-170 by eliminating the subProperty relationship with 'has'</li>
                    <li>FBC-167 - added London Stock Exchange's UnaVista registry for LEIs</li>
                    <li>FBC-176 - correct URis in the header of the ontology</li>
                    <li>FBC-167 - flesh out some of the EU entities (still need to complete the London Stock Exchange, including their own LEI registry, LSE Group, etc. and Nasdaq OMX at some point)</li>
                    <li>FBC-167 - augmented existing US entities substantially, to include the Bloomberg LEI service, LEI details for those organization that have them, etc. Merge pull request #437 from ElisaKendall/FBC-90</li>
                    <li>FBC-90 - made securities transaction a child of trade per OF Merge pull request #436 from ElisaKendall/FBC-66</li>
                    <li>FBC-66 - eliminate remaining uses of "altLabel" in FBC</li>
                    <li>FBC-160 - revised dateTimeStamp to dateTime to eliminate issue with Pellet</li>
                    <li>FBC-160 - revised date time stamp format, again, to correct where the "Z" goes</li>
                    <li>FBC-160 - revised time stamps on LEI individuals to include "+00:00" so that they would be processed correctly</li>
                    <li>FBC-160 - correct property misspelling</li>
                    <li>FBC-160 - loosened the constraint on LEI to apply to a legal person, to account for cases where a polity or natural person may apply for and be assigned an LEI</li>
                    <li>FBC-160 - eliminate use of business facing types text property in favor of xsd:string</li>
                    <li>FBC-160 - loosen the definition of registration identifier to cover cases where an identifier is for a legal person, and to allow for cases where jurisdictions overlap or are not clear</li>
                    <li>FBC-160 - eliminated the restriction with respect to jurisdiction on business registry, as it does not apply to LOUs and should, more appropriately, be included only on certain registries or registration authorities.</li>
                    <li>FBC-160 - modify usage of hasRegistrationDate in SEC/SecuritiesListings to reflect changes made to simplify representation of these kinds of dates in FBC</li>
                    <li>FBC-160 - revised example individuals corresponding to streamlining changes made to how the business identifiers are represented (eliminating the registry entries)</li>
                    <li>FBC-160 - eliminated unnecessary classes specific to California and Delaware; modified property restriction on FRS member from isPartOf to isMemberOf (which caused incorrect inferences with respect to individuals such as Citibank</li>
                    <li>FBC-160 - revised status individuals to include source for definitions and updated the definition of active status to be a bit broader than the GLEIF definition; eliminated redundant restrictions, revised registration date properties and restrictions to be easier to use and to incorporate a higher level property called hasRegistrationDate from the basic registration ontology</li>
                    <li>FBC-160 - revisions to better support the GLEIF LEI-CDF v2.1 specification for registration of LEIs, and to simplify representation of certain concepts; (1) specifically: clarified the definition of 'registers', (2) modified the definition of a registry identifier to say that it -may- be an index to a registry rather than must be, but to add that it is registered in a registry, (3) say that a registration authority registers something, (4) modify the definition of hasRegistrationDate to make it a data property rather than object property and allow for multiple representation of date literals, similarly to what was done for business registries.</li>
                    <li>FBC-160 - revised example individuals for Citibank, Citigroup and Pinnacle Bank to reflect latest changes to the various ontologies and to include LEIs for Citibank and Citigroup</li>
                    <li>FBC-160 - revised the type of the GMEI registry from a basic registry to an LEI registry</li>
                    <li>FBC-160 - added business registry details for the State of Delaware - registry entry, file number, and registration authority code</li>
                    <li>FBC-160 - modified business registries to expand the possible values for certain registry dates to include dates, dates and times, or date time stamps; included restrictions on registries to include registry entries</li>
                    <li>FBC-160 - revisions to example California State-chartered bank to reflect changes made to the business registries and US regulatory agencies ontologies</li>
                    <li>FBC-160 - revised state registration authority content to mirror changes made to business registries in light of updates for GLIEF, etc.</li>
                    <li>FBC-160 - latest changes to the business registries ontology to reflect FCT discussions and latest mapping spreadsheet</li>
                    <li>FBC-160 - fix prefix for hasName with respect to hasRegistryName</li>
                    <li>FBC-160 - integrate changes responding to comments from Pete and Jeff Braswell on requirements for and implementation of the LEI-CDF v2.1 (incomplete but closer - address changes and testing are todo for Level 1 data, also to investigate relationships) ...</li>
                    <li>FBC-160 - revised dateTimeStamp to dateTime to eliminate issue with Pellet</li>
                    <li>FBC-90 - corrected IRI for Financial Products and Services</li>
                    <li>FBC-90 - made securities transaction a child of trade per OFR suggestion</li>
                    <li>FBC-66 - eliminate remaining uses of "altLabel" in FBC</li>
                    <li>FBC-160 - revised date time stamp format, again, to correct where the "Z" goes</li>
                    <li>FBC-160 - revised time stamps on LEI individuals to include "+00:00" so that they would be processed correctly Fbc 160 Remove imports of skos. Use general (not version-specific) URI for import of SpecificationMetadata in Values.rdf</li>
                    <li>FBC-160 - correct property misspelling</li>
                    <li>FBC-160 - eliminated the restriction with respect to jurisdiction on business registry, as it does not apply to LOUs and should, more appropriately, be included only on certain registries or registration authorities.</li>
                    <li>FBC-160 - revised example individuals corresponding to streamlining changes made to how the business identifiers are represented (eliminating the registry entries)</li>
                    <li>FBC-160 - eliminated unnecessary classes specific to California and Delaware; modified property restriction on FRS member from isPartOf to isMemberOf (which caused incorrect inferences with respect to individuals such as Citibank</li>
                    <li>FBC-160 - revised status individuals to include source for definitions and updated the definition of active status to be a bit broader than the GLEIF definition; eliminated redundant restrictions, revised registration date properties and restrictions to be easier to use and to incorporate a higher level property called hasRegistrationDate from the basic registration ontology</li>
                    <li>FBC-160 - revisions to better support the GLEIF LEI-CDF v2.1 specification for registration of LEIs, and to simplify representation of certain concepts; (1) specifically: clarified the definition of 'registers', (2) modified the definition of a registry identifier to say that it -may- be an index to a registry rather than must be, but to add that it is registered in a registry, (3) say that a registration authority registers something, (4) modify the definition of hasRegistrationDate to make it a data property rather than object property and allow for multiple representation of date literals, similarly to what was done for business registries.</li>
                    <li>FBC-160 - revised example individuals for Citibank, Citigroup and Pinnacle Bank to reflect latest changes to the various ontologies and to include LEIs for Citibank and Citigroup</li>
                    <li>FBC-160 - revised the type of the GMEI registry from a basic registry to an LEI registry</li>
                    <li>FBC-160 - added business registry details for the State of Delaware - registry entry, file number, and registration authority code</li>
                    <li>FBC-160 - modified business registries to expand the possible values for certain registry dates to include dates, dates and times, or date time stamps; included restrictions on registries to include registry entries</li>
                    <li>FBC-160 - revisions to example California State-chartered bank to reflect changes made to the business registries and US regulatory agencies ontologies</li>
                    <li>FBC-160 - revised state registration authority content to mirror changes made to business registries in light of updates for GLIEF, etc.</li>
                    <li>FBC-160 - latest changes to the business registries ontology to reflect FCT discussions and latest mapping spreadsheet</li>
                    <li>FBC-160 - fix prefix for hasName with respect to hasRegistryName</li>
                    <li>FBC-160 - integrate changes responding to comments from Pete and Jeff Braswell on requirements for and implementation of the LEI-CDF v2.1 (incomplete but closer - address changes and testing are todo for Level 1 data, also to investigate relationships)</li>
                    <li>FBC-155 - remove erroneous duplicate import from the OMG site</li>
                    <li>FBC-160 - rebaseline the business registries ontology prior to addressing additional feedback</li>
                    <li>FBC-160 - addressed several comments raised in GitHub with respect to this issue resolution, such as revising the definition of registration address, referencing the union of registered address and registration address where only one of the two occured before, loosened definitions for registration authority and registry that referred to jurisdictions, fixed typo in label for has validation authority, fixed spelling of website, etc.</li>
                    <li>FBC-160 - revise and extend the business registries ontology in FBC to faclitate representation of LEI-CDF v 2.1 Level 1 information regarding legal entities and LEIs</li>
                    <li>FBC-160 - generalize the definitions of succeeds and precedes to include organizations and products</li>
                    <li>FBC-160 - revise registration authorities to eliminate unneeded / confusing restrictions with respect to classification orientation</li>
                    <li>INFRA-214 INFRA-214 use opensource url for MIT license</li>
                </ul>
                <h4>FND</h4>
                <p>FND-190 - deleted property clockTime that included the bogus reference, given that there were no references whatsoever to this property</p>
                <ul>
                    <li>FLT-78 FND-78 Redid the IRI rename after resetting to latest master</li>
                    <li>FLT-77 These three files shouldn't be here</li>
                    <li>FLT-77 These three files shouldn't be here</li>
                    <li>SEC-25 - eliminated 3 Ext ontologies, including (1) SEC/Debt/DebtFoundations/ParityVariants/ - prefix was fibo-sec-dbt-dbt-par; concepts have been merged into SEC/Debt/DebtInstruments/ (fibo-sec-dbt-dbti), (2) SEC/Debt/DebtFoundationsExt/DebtInstrumentsExt/ - prefix was fibo-sec-dbt-dbtx-dbtx; concepts have been merged into SEC/Debt/DebtInstruments/ (fibo-sec-dbt-dbti), and (3) SEC/Debt/DebtFoundationsExt/GuarantyExt/ - prefix was fibo-sec-dbt-dbtx-gtyx ; concepts have been merged into FBC/DebtAndEquities/Guaranty/ (fibo-fbc-dae-gty)</li>
                    <li>FND-188 addition of new classes in TimeExt/Time and change to referen</li>
                    <li>FID-188 addition of new classes in TimeExt/Time and change to references to DayMonthValue in 4 ontologies.</li>
                    <li>FND-189 - changed the domain / range of holds and isHeldBy from an autonomous agent to a party in role, which is how it is used (definitions changed accordingly; eliminated references to the business facing types ontology in relations</li>
                    <li>FND-182 - Add class BasisPointsValue</li>
                    <li>FND-183 - Replace the 2 object properties with range of non-existent URIValue c Add class BasisPointsValue Replace the 2 object properties with range of non-existent URIValue class with datatype properties of range xsd:anyURI Remove the class called Ontology which does not belong here and is never referenced.</li>
                    <li>FND-181 - eliminated duplicate mandatedBy property in favor of the one in Relations</li>
                    <li>FND-181 - eliminated duplicate / removed properties through integration with Relations, including properties eliminated from contractual ontologies in extensions</li>
                    <li>FND-181 - integrated the Relations ontology and eliminated duplicate properties, including those eliminated from contractual commitments and contractual extensions</li>
                    <li>FND-181 - integrated Relations ontology and eliminated duplicate properties, including those eliminated from the ContractualCommitments ontology</li>
                    <li>FND-181 - integrates the released relations ontology into ContractualConstructs and replaces local definitions of confers, mandates and embodies with those in Relations; eliminates odd equivalence, changes min 1 QCR to someValuesFrom</li>
                    <li>FND-181 - eliminates a comment on isMandatedBy, which refers to an informative ontology (since this is in release); adds its inverse property of mandates Delete malformed SKOS import statement and declarations as per the JIRA ticket. Remove imports of skos. Use general (not version-specific) URI for import of SpecificationMetadata in Values.rdf In Values.rdf replace terms:abstract by dct:abstract and declaration of "terms" entity/namespace And terms:license</li>
                    <li>JIRA FND-176 Added the termOrigin element as well as the definition Re-submit consolidated updates to values and dependencies. Per https://github.com/edmcouncil/fibo/pull/423 Commit dependencies to values ontologies and business facing types As per https://wiki.edmcouncil.org/display/FND/Values+Substitutions+Page, make substitutions and updates to make ontologies referencing values consistnet with policy.</li>
                    <li>INFRA-214 INFRA-214 use opensource url for MIT license</li>
                </ul>
                <h4>IND</h4>
                <p>FLT-78 FND-78 Redid the IRI rename after resetting to latest master</p>
                <ul>
                    <li>IND-21 - added parent of rate to inflation rate and unemployment rate; IND-20 - combined restrictions into a single restriction describing the population</li>
                    <li>IND-54 - delete Ext market indices ontologies in favor of the new combined provisional ontology in IND/MarketIndices</li>
                    <li>IND-54 - introduce new combined MarketIndices/BasketIndices ontology as provisional (still needs lots of work)</li>
                    <li>IND-53 - eliminate all references to the classes in the indicators values and basket index publishers ontologies; revise definitions in basket indices and modify patterns to correspond to those that are similar in FBC and SEC Remove imports of skos. Use general (not version-specific) URI for import of SpecificationMetadata in Values.rdf Commit dependencies to values ontologies and business facing types As per https://wiki.edmcouncil.org/display/FND/Values+Substitutions+Page, make substitutions and updates to make ontologies referencing values consistnet with policy.</li>
                    <li>INFRA-214 INFRA-214 use opensource url for MIT license</li>
                </ul>
                <h4>MD</h4>
                <p>FLT-78 FND-78 Redid the IRI rename after resetting to latest master</p>
                <ul>
                    <li>SEC-25 - eliminated 3 Ext ontologies, including (1) SEC/Debt/DebtFoundations/ParityVariants/ - prefix was fibo-sec-dbt-dbt-par; concepts have been merged into SEC/Debt/DebtInstruments/ (fibo-sec-dbt-dbti), (2) SEC/Debt/DebtFoundationsExt/DebtInstrumentsExt/ - prefix was fibo-sec-dbt-dbtx-dbtx; concepts have been merged into SEC/Debt/DebtInstruments/ (fibo-sec-dbt-dbti), and (3) SEC/Debt/DebtFoundationsExt/GuarantyExt/ - prefix was fibo-sec-dbt-dbtx-gtyx ; concepts have been merged into FBC/DebtAndEquities/Guaranty/ (fibo-fbc-dae-gty)</li>
                    <li>SEC-25 - revised the debt pricing yields ontology to use concepts from FBC Debt and SEC/Debt DebtInstruments rather than from the provisional DebtCashFlowTerms ontology, many of which are duplicates of what is in the combination of the FBC and DebtInstruments ontology Replace the 2 object properties with range of non-existent URIValue class with datatype properties of range xsd:anyURI Remove imports of skos. Use general (not version-specific) URI for import of SpecificationMetadata in Values.rdf Global replace of dct:description by skos:definition. Commit dependencies to values ontologies and business facing types As per https://wiki.edmcouncil.org/display/FND/Values+Substitutions+Page, make substitutions and updates to make ontologies referencing values consistnet with policy.</li>
                </ul>
                <h4>SEC</h4>
                <ul>
                    <li>SEC-25 - corrected references to TradableDebtInstrumentRedemptionProvision</li>
                    <li>FLT-78 FND-78 Redid the IRI rename after resetting to latest master</li>
                    <li>SEC-25 - revised restrictions to use the appropriate individual rather than class based on specific definitions in the ontology, eliminated duplicate properties</li>
                    <li>SEC-25 - eliminated 3 Ext ontologies, including (1) SEC/Debt/DebtFoundations/ParityVariants/ - prefix was fibo-sec-dbt-dbt-par; concepts have been merged into SEC/Debt/DebtInstruments/ (fibo-sec-dbt-dbti), (2) SEC/Debt/DebtFoundationsExt/DebtInstrumentsExt/ - prefix was fibo-sec-dbt-dbtx-dbtx; concepts have been merged into SEC/Debt/DebtInstruments/ (fibo-sec-dbt-dbti), and (3) SEC/Debt/DebtFoundationsExt/GuarantyExt/ - prefix was fibo-sec-dbt-dbtx-gtyx ; concepts have been merged into FBC/DebtAndEquities/Guaranty/ (fibo-fbc-dae-gty)</li>
                    <li>FID-188 addition of new classes in TimeExt/Time and change to references to DayMonthValue in 4 ontologies.</li>
                    <li>SEC-25 - replaced reference in RightsAndWarrants to the SecurityAssetsExt ontology, and then deleted the unused ontology Ind 54</li>
                    <li>IND-54 - further correction of IRIs due to consolidation of market indices ontologies</li>
                    <li>IND-54 - replace references in other ontologies to MarketIndicesExt with MarketIndices (BasketIndices)</li>
                    <li>SEC-23 and SEC-24 - revised definitions of securities pool and securities pool constituents per the issue suggestions</li>
                    <li>FBC-148 - added the concepts of an investment pool, pooled fund, and managed investment to pools</li>
                    <li>BE-169 - moved the CorporationEquity ontology, which still needs review, to SEC/Equities, since it depends heavily on other ontologies in that subdomain and thus cannot be in BE due to circular dependencies</li>
                    <li>FND-181 - integrates Relations and replaces duplicate properties with the one in relations (mandates / isMandatedBy)</li>
                    <li>FND-181 - replaced the source for confers, from the eliminated property in contractual constructs with the proper one in relations</li>
                    <li>FND-181 - eliminated reference to confers from Contractual Constructs in favor of the confers property in relations; eliminated two duplicate properties (there are still some remaining local 'confers ownership' properties</li>
                    <li>FBC-163 - moved AgentForServiceOfProcess to FBC, USRegulatoryAgencies, as needed for registration of legal entities in the US</li>
                    <li>FBC-160 - correct property misspelling</li>
                    <li>FBC-160 - loosened the constraint on LEI to apply to a legal person, to account for cases where a polity or natural person may apply for and be assigned an LEI</li>
                    <li>FBC-160 - eliminate use of business facing types text property in favor of xsd:string</li>
                    <li>FBC-160 - loosen the definition of registration identifier to cover cases where an identifier is for a legal person, and to allow for cases where jurisdictions overlap or are not clear</li>
                    <li>FBC-160 - eliminated the restriction with respect to jurisdiction on business registry, as it does not apply to LOUs and should, more appropriately, be included only on certain registries or registration authorities.</li>
                    <li>FBC-160 - modify usage of hasRegistrationDate in SEC/SecuritiesListings to reflect changes made to simplify representation of these kinds of dates in FBC</li>
                    <li>FBC-160 - revised example individuals corresponding to streamlining changes made to how the business identifiers are represented (eliminating the registry entries)</li>
                    <li>FBC-160 - eliminated unnecessary classes specific to California and Delaware; modified property restriction on FRS member from isPartOf to isMemberOf (which caused incorrect inferences with respect to individuals such as Citibank</li>
                    <li>FBC-160 - revised status individuals to include source for definitions and updated the definition of active status to be a bit broader than the GLEIF definition; eliminated redundant restrictions, revised registration date properties and restrictions to be easier to use and to incorporate a higher level property called hasRegistrationDate from the basic registration ontology</li>
                    <li>FBC-160 - revisions to better support the GLEIF LEI-CDF v2.1 specification for registration of LEIs, and to simplify representation of certain concepts; (1) specifically: clarified the definition of 'registers', (2) modified the definition of a registry identifier to say that it -may- be an index to a registry rather than must be, but to add that it is registered in a registry, (3) say that a registration authority registers something, (4) modify the definition of hasRegistrationDate to make it a data property rather than object property and allow for multiple representation of date literals, similarly to what was done for business registries.</li>
                    <li>FBC-160 - revised example individuals for Citibank, Citigroup and Pinnacle Bank to reflect latest changes to the various ontologies and to include LEIs for Citibank and Citigroup</li>
                    <li>FBC-160 - revised the type of the GMEI registry from a basic registry to an LEI registry</li>
                    <li>FBC-160 - added business registry details for the State of Delaware - registry entry, file number, and registration authority code</li>
                    <li>FBC-160 - modified business registries to expand the possible values for certain registry dates to include dates, dates and times, or date time stamps; included restrictions on registries to include registry entries</li>
                    <li>FBC-160 - revisions to example California State-chartered bank to reflect changes made to the business registries and US regulatory agencies ontologies</li>
                    <li>FBC-160 - revised state registration authority content to mirror changes made to business registries in light of updates for GLIEF, etc.</li>
                    <li>FBC-160 - latest changes to the business registries ontology to reflect FCT discussions and latest mapping spreadsheet</li>
                    <li>FBC-160 - fix prefix for hasName with respect to hasRegistryName</li>
                    <li>FBC-160 - integrate changes responding to comments from Pete and Jeff Braswell on requirements for and implementation of the LEI-CDF v2.1 (incomplete but closer - address changes and testing are todo for Level 1 data, also to investigate relationships)</li>
                </ul>
                

                <h3 id="2017Q4"><strong>2017 Q4</strong></h3>
                <h4>Business Entities (BE)</h4>
                <ul>
                    <li>Integrate ISO 6523 for organizations</li>
                </ul>
                <h4>Foundations (FND)</h4>
                <p>Update the defintion of isIssuedBy to clarify the role of governments in issuing identity documents</p>
                <ul>
                    <li>Rectify ambiguous notion of "Principal" (loan amount vs. principal member of a contract)</li>
                    <li>Fill in product concepts needed for Loans</li>
                    <li>Include uniqueness in Identifiers</li>
                    <li>Integrate ISO 6523 into organizations structure</li>
                    <li>Generalize the notion of an Arrangement</li>
                    <li>Unify identifiers with LCC practice</li>
                    <li>Update dates to include times without specified date</li>
                    <li>Include lifecycle as a general concept</li>
                </ul>
                <h4>Financial Business and Commerce (FBC)</h4>
                <ul>
                    <li>Add regulatory reporting concepts</li>
                    <li>Unify lifecycle concepts</li>
                    <li>Fill in the Bloomberg reference</li>
                    <li>Separate contracts from products based on contracts</li>
                </ul>
                <h4>Indices and Indicators (IND)</h4>
                <p>Include FpML schemes in Reference Floating Interest Rate</p>
                <h4>Securities (SEC)</h4>
                <p>Remove "puns" about CUSIP and Euroclear</p>
                <h4>All</h4>
                <ul>
                    <li>Fill in missing definitions and inconsistent labels</li>
                    <li>Rectify business facing types with a more coherent type ontology</li>
                    <li>Clean up deprecated class definitions</li>
                    <li>Moving some things from one domain to another to improve modularity</li>
                </ul>

                <h3 id="2017Q3"><strong>2017 Q3</strong></h3>
                <p>Initial release</p>

            </article>
        </main>
        <button class="top-button" title="Go to top" @click="topBtnClick" ref="topButton">Top </button>
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
        name: 'FIBOCommunities',
        components: {},
        mounted(){
            var self = this;
            window.onscroll = function() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    self.$refs.topButton.style.display = "block";
                } else {
                    self.$refs.topButton.style.display = "none";
                }
            };
        },
        methods: {
            outboundClick,
            outboundLinkClick,
            topBtnClick(event){
                window.scrollTo(0,0);
            }
        },
    };
</script>

<style lang="scss" scoped>
    .top-button {
        &:after {
            content: "\f077";
            font-family: "Font Awesome 5 Solid";
        }
        display: none;
        position: fixed;
        bottom: 20px;
        right: 30px;
        z-index: 99;
        border: none;
        outline: none;
        background-color: #e78747;
        color: white;
        cursor: pointer;
        padding: 15px;
        border-radius: 10px;
        font-size: 18px;
    }

    .top-button:hover {
        background-color: #707070;
    }
</style>