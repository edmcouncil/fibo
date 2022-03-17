<img src="https://spec.edmcouncil.org/fibo/htmlpages/master/latest/img/FIBO_logo.11aeaf9b.jpg" width="200" align="right"/>

# Financial Industry Business Ontology
<img src="https://avatars0.githubusercontent.com/u/6618425?s=400&u=3ed327f38a1d043252af3177e5d6f48eef609e6a&v=4" width="150" align="right"/>

FIBO is hosted and sponsored by the [Enterprise Data Management Council (EDM Council)](https://edmcouncil.org). 

FIBO is a trademark of EDM Council, Inc. It is also standardized by the [Object Management Group](https://www.omg.org/index.htm).

# Introduction

The Financial Industry Business Ontology (FIBO) is a formal ontology that provides a common vocabulary for financial contracts and related concepts.  FIBO evolved out of concerns that arose during the 2008 financial crisis among individuals who worked together in data governance and management to address requirements for standardized terminology for regulatory reporting and other analyses.  The resulting ontology has continued to grow and evolve since its initial publication in 2014, with increasing support for use cases related to securities master data management, reporting, and risk analysis and management. 

FIBO is hosted and sponsored by the Enterprise Data Management Council (EDMC) and is standardized by the Object Management Group (OMG) under a shared marketing and trademark agreement.  It is published in a number of human and machine-readable formats for use in business and operational settings, ranging from online glossaries to rich knowledge graph applications. Revisions are made on a continuous basis by several teams addressing specific domain areas (e.g., securities, derivatives, indices, and so forth), available in GitHub, with formal updates published quarterly.

FIBO is developed as an ontology in the Web Ontology Language (OWL). The language is codified by the World Wide Web Consortium (W3C), and it is based on Description Logic. The use of logic ensures that each FIBO concept is framed in a way that is unambiguous and that is readable both by humans and machines.

FIBO concepts have been reviewed by [EDMC member firms](https://edmcouncil.org/page/listofmembersreview) over the years and represent a consensus of the common concepts as understood in the industry and as reflected in industry data models and message standards. 


# Mission
Since January 2020, FIBO has been developed by an **open community process** with a mission to develop, maintain, and promote global platform-independent, machine-readable and unambiguous data standard that enables understanding of the financial terminology, cross-system federation and aggregation of data to improve effectiveness of decisions, to improve efficiency in regulatory reporting and to fast-track the adoption of advanced analytical capabilities for financial services.


# FIBO code license
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)


# FIBO Viewer

[FIBO Viewer](https://spec.edmcouncil.org/fibo/ontology) is a web application specifically designed to access both the FIBO structure and its content stored in this repository in the easiest possible way. So, you do not need to install any software to enjoy FIBO!

# Maintenance service

<img src="https://upload.wikimedia.org/wikipedia/commons/3/31/Makolab_logo.png" width="200" align="right"/>

In case of experiencing any problem with our development infrastructure (Jenkins, EDMC Jira, or WIKI), please contact the single service point:

- Email: pawel.garbacz@makolab.com
- Service working hours:
  - working days, from 8:00 to 17:00 CET (from 2:00 to 11:00 EST)
    - response time: 1 h
  - working days, from 17:00 to 22:00 CET (from 11:00 to 16:00 EST)
    - response time: 2.5 h

# How to contribute

## Contributing to FIBO
The FIBO development process follows rigorous and well-defined rules and principles. Please read [CONTRIBUTING.md](CONTRIBUTING.md) and [ONTOLOGY\_GUIDE.md](ONTOLOGY_GUIDE.md) for more details. 

## Developer Certificate of Origin (DCO) 

We use [Probot / DCO framework](https://github.com/probot/dco) to enforce the Developer Certificate of Origin ([DCO](DCO)) on Pull Requests. It requires all commit messages to contain the Signed-off-by line with an email address that matches the commit author. Contributors sign-off that they adhere to [these requirements](DCO) by adding a "Signed-off-by" line to commit messages.

## Community Discussions

- Our preferred method for discussing topics unrelated to specific issues, pull requests, wiki pages, or artifacts is [EDMConnect FIBO Interest Group](https://edmconnect.edmcouncil.org/fibointerestgroup/home). 

- Please take advantage of 
[GitHub Discussions](https://github.com/edmcouncil/fibo/discussions) to discuss concrete changes to the FIBO code.

## Code of conduct
This project adheres to the Contributor Covenant [code of conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [fibo@edmcouncil.org](mailto:fibo@edmcouncil.org). 

# Directories and FIBO domains

Directory                | Description | Browse in FIBO Viewer |
:----------------------- |:------- |:-----------|
[BE](./BE/)    | This directory contains ontologies belonging to the FIBO Business Entities (BE) Domain. This domain defines business concepts that are used for data governance, interoperability, and in regulatory reporting about business entities. | click [here](https://spec.edmcouncil.org/fibo/ontology/BE/MetadataBE/BEDomain) to browse BE in FIBO Viewer |
[BP](./BP/)    | This directory contains ontologies belonging to the Business Process (BP) domain. This domain includes ontologies that define financial process flows, such as securities issuance and transaction workflows. In the case of securities issuance process models, these are provided in order to be able to represent reference data concepts that are dependent on the process by which a security was issued. Transaction process semantics provide the basis for the temporal dimension of securities and derivatives transactions. | click [here](https://spec.edmcouncil.org/fibo/ontology/BP/MetadataBP/BPDomain) to browse BP in FIBO Viewer |
[CAE](./CAE/)  | This directory contains ontologies belonging to the Corporate Actions and Events (CAE) domain. This domain contains ontologies that define events and actions that may occur during the life of a security, and are typically those events which may cause some change in some part of the underlying reference information for that security. Corporate actions include actions that require some action on the part of the holder, and in these and some other cases, there are process descriptions for the flow of activities involved. | click [here](https://spec.edmcouncil.org/fibo/ontology/CAE/MetadataCAE/CAEDomain) to browse CAE in FIBO Viewer |
[DER](./DER/)  | This directory contains ontologies belonging to the Derivatives (DER) Domain. This domain covers many of the concepts that are common to derivative instruments, including but not limited to options, futures, forwards, swaps, and a wide range of other derivatives. | click [here](https://spec.edmcouncil.org/fibo/ontology/DER/MetadataDER/DERDomain) to browse DER in FIBO Viewer |
[FBC](./FBC/)  | This directory contains ontologies belonging to the Financial Business and Commerce domain. This domain covers business concepts that are common to a number of finance areas, such as loans, securities, and corporate actions, including products and services, financial intermediaries, registrars and regulators, and financial instruments and products.  | click [here](https://spec.edmcouncil.org/fibo/ontology/FBC/MetadataFBC/FBCDomain) to browse FBC in FIBO Viewer |
[FND](./FND/)  | This directory contains ontologies belonging to the Foundations (FND) domain. This domain includes ontologies that define general-purpose concepts required to support other FIBO domains. These include concepts and relationships about people, organizations, places, and most importantly, contracts that are essential to domains such as Business Entities (BE), Financial Business and Commerce (FBC), Indices and Indicators (IND), and Securities (SEC). | click [here](https://spec.edmcouncil.org/fibo/ontology/FND/MetadataFND/FNDDomain) to browse FBC in FIBO Viewer |
[IND](./IND/)  | This directory contains ontologies belonging to the FIBO Indices and Indicators (IND) Domain. This domain covers market indices and reference rates, including economic indicators, foreign exchange, interest rates, and other benchmarks. The ontologies cover quoted interest rates, economic measures such as employment rates, and quoted indices required to support baskets of securities, including specific kinds of securities in share indices or bond indices, as well as credit indices. | click [here](https://spec.edmcouncil.org/fibo/ontology/IND/MetadataIND/INDDomain) to browse FBC in FIBO Viewer |
[LOAN](./LOAN/)| This directory contains ontologies belonging to the FIBO Loan (LOAN) domain. This domain provides a model of concepts that are common to loan contracts in various market categories including but not limited to commercial, small business, automobile, education, and mortgage. High-level concepts relevant to loan contracts include the obligations of parties playing different roles, credit and risk, security agreements as well as additional detail for HMDA-specific loans. Details defining debt instruments, in general, are covered in a separate debt module in the Securities domain. | click [here](https://spec.edmcouncil.org/fibo/ontology/LOAN/MetadataLOAN/LOANDomain) to browse LOAN in FIBO Viewer |
[MD](./MD/)    | This directory contains ontologies belonging to the Market Data (MD) domain. This domain contains ontologies that represent temporally variant concepts for the whole range of financial instruments, loans, and funds. While all concepts can be regarded as having some relationship to time, the ones in this domain are those concepts that explicitly have a set of past values a present value and projected future values. As such, this domain covers the concepts represented in market data, such as prices, yields, and analytics for debt and for pools of assets. | click [here](https://spec.edmcouncil.org/fibo/ontology/MD/MetadataMD/MDDomain) to browse MD in FIBO Viewer |
[SEC](./SEC/)  | This directory contains ontologies belonging to the FIBO Securities (SEC) domain. This domain provides a model of concepts that are common to financial instruments that are also securities, including but not limited to exchange-traded securities. High-level concepts relevant to securities classification, identification, issuance, and registration of securities generally are covered, as well as additional detail for equities and debt instruments. More details defining derivatives, in particular, are covered in a separate derivatives domain area. | click [here](https://spec.edmcouncil.org/fibo/ontology/SEC/MetadataSEC/SECDomain) to browse SEC in FIBO Viewer |
[/etc](./etc/)  | Everything that is not a published OWL ontology in a financial domain. |  |


# Releases
[https://github.com/edmcouncil/fibo/releases](https://github.com/edmcouncil/fibo/releases)

# Contributors
https://github.com/edmcouncil/fibo/graphs/contributors

# External links

- [FIBO official website](https://spec.edmcouncil.org/fibo/)
- [OMG Specification of FIBO](https://www.omg.org/spec/EDMC-FIBO/)
- [EDMConnect platform](https://edmconnect.edmcouncil.org/fibointerestgroup/home) - an official discussion forum for the FIBO Community.

Before January 2020, [EDMC Wiki](https://wiki.edmcouncil.org/) and [EDMC Jira](https://jira.edmcouncil.org) were the main platforms for organizing the FIBO development process by the FIBO Community. They remain available for the FIBO Community.
