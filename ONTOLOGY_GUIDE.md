<img src="https://spec.edmcouncil.org/fibo/htmlpages/master/latest/img/FIBO_logo.11aeaf9b.jpg" width="300" align="right"/>

# Principles of best practices for FIBO

# Table of contents

* [Use case development](#use-case-development)
* [Terminology Work](#terminology-work)
	* [Ontology Header Information](#ontology-header-information)
	* [FIBO standard IRI format](#fibo-standard-iri-format)
	* [Capturing Terminology for the Body of an Ontology](#capturing-terminology-for-the-body-of-an-ontology)
	* [Naming and Labeling Conventions](#naming-and-labeling-conventions)
		* [Classes](#classes)
		* [Properties](#properties)
		* [Individuals](#individuals)
		* [General naming conventions](#general-naming-conventions)
	* [Definitions](#definitions)
	* [Additional Annotations](#additional-annotations)
* [Conceptual Modeling Approach](#conceptual-modeling-approach)
	* [Overarching Principles](#overarching-principles)
	* [Minimal Compliance Hygiene Tests](#minimal-compliance-hygiene-tests)
	* [Candidate Tests for Quality Compliance](#candidate-tests-for-quality-compliance)
 



# Use case development

* In general, and especially at more specific levels in the hierarchy, **every ontology element (i.e., class, property, and definitional individual) should be used in at least one competency question in at least one use case**.  

*  **Modifications of any ontology element should also be related to at least one competency question in at least one use case.** 

*  Ontology work, including issue resolution aside from egregious bug fixing or periodic reference data revision, should be supported by at least one use case.  This means, for example, that **new ontologies, including any community submissions, should not be integrated unless they are grounded in (or support, in the case of higher-level concepts) at least one use case.**



Our use case template is available [here](https://www.morganclaypool.com/doi/suppl/10.2200/S00834ED1V01Y201802WBE018/suppl_file/OEUseCaseTemplate.docx). <img src="https://www.morganclaypoolpublishers.com/catalog_Orig/images/9781681733081.png" width="130" align="right"/>
The template is described completely in the book, **[Ontology Engineering](https://www.morganclaypool.com/doi/abs/10.2200/S00834ED1V01Y201802WBE018)**, by Elisa F. Kendall, Thematix Partners LLC, and Deborah L. McGuinness, Rensselaer Polytechnic Institute, in Chapter 3.  

At a minimum, the following elements must be completed in every use case for FIBO:

1. Use Case Description

2. Summary - (if you are not using the ontology in a specific application you can skip pre-conditions, post-conditions, triggers, and performance requirements)

3. Usage Scenarios

4. Use case and activity diagrams - Optional, unless you are building a specific application, though we sometimes provide contextual diagrams here that correspond to the usage scenarios

5. Competency Questions

A use case for FIBO may also contain:

1. Basic and Alternate Flow of Events

2. Resources, References, and Notes - it is optional, but most of the use cases we have a reference to some sort of source of example data, or references that are useful for ontology development.

There are a number of example use cases under development and/or complete.  These include:

* Securities Exchange Instrument Data Offering
* Index Analysis for ETF Development
* Unified Standard for Regulatory Reporting of Derivatives

which may provide useful insight for those developing new use cases, and follow the guidelines listed above.

# Terminology Work

FIBO generally follows the guidance provided in

* **[ ISO 704: Terminology work — Principles and methods for terminology development](https://www.iso.org/standard/38109.html)**, 
* **[ISO 1087: Terminology work and terminology science — Vocabulary](https://www.iso.org/standard/62330.html)**.  

This means that minimal **metadata is required about every ontology element**:

* a label, 
* a definition, 
* the explanatory and other notes when required.

**Definitions must follow ISO 704 recommendations** for establishing good definitions.  

Many institutions and government organizations are using FIBO as a reference for enterprise glossary development, interoperability, natural language processing, machine learning, and other applications that need both the mathematics and logic incorporated in the ontology as well as the terminology, which is essential for enterprise glossary work and natural language processing applications.

We recommend and are using ISO 704 for FIBO primarily because the principles it defines help ensure the consistency and quality of our definitions. Note that there is [a version of ISO 704 available online](http://semanticweb.kaist.ac.kr/org/tc37/pdocument/standards/ISO%20704.pdf).  Although it is a revision of the standard that has since been superseded, the principles for definition formation remain largely unchanged in newer editions.

## Ontology Header Information
FIBO ontologies are used for many different applications and are expressed in terms of the W3C Resource Description Framework (RDF), RDF Schema, and Web Ontology Language (OWL 2) standards.  There is a modular structure to facilitate reuse, and we use a standard RDF/XML serialization in Github that is implemented by [the serializer](#fibo-serialization-tools) to ensure consistency.  

The header (\<owl:Ontology rdf:about="...">...\</owl:Ontology>) of every ontology must include certain information that supports standardization and documentation for FIBO.  

We reuse a number of ontologies in the development of terminology included in the header as well as the body of every ontology we publish, including:

* A subset of the properties defined in the [Dublin Core Metadata Terms](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/)
* The annotation properties, but not classes, defined in the W3C [Simple Knowledge Organization System (SKOS)](https://www.w3.org/2004/02/skos/)
* The metadata annotations defined in the [OMG's Specification Metadata ontology](https://www.omg.org/techprocess/ab/SpecificationMetadata.rdf)

as well as certain annotations we've defined in [FIBO's Annotation Vocabulary](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/).

Every published **FIBO ontology**, regardless of its maturity level, must include the following details:

1. **DOCTYPE Entity declarations** for every namespace used – these are for use in abbreviated IRIs in the XML serialization to improve readability, including namespace prefixes that follow the FIBO standard prefix format
1. **Namespace declarations** in RDF for every namespace used directly in the ontology (and no extra declarations for ontologies that are not directly imported)
1. An **ontology IRI**, following the [FIBO standard IRI format](#fibo-standard-iri-format)
1. A **label** (in English, which is a spelled out name for the ontology)
1. An **abstract** - short description of the ontology
1. A **license** - we use the [MIT open source license](LICENSE) for all FIBO ontologies
1. An indication of the **content language, which is OWL**, linking to the W3C site
1. A **copyright statement** - which always includes the EDM Council copyright and, for released ontologies that are being incorporated into the joint EDM Council / OMG standard, the OMG copyright
1. An indication of the **dependencies that the ontology has on other ontologies** - a link to the other domains/modules referenced, and within the relevant domain, links to the domain-level ontologies referenced
1. The **abbreviation and file name** for the individual RDF/XML ontology file
1. All relevant **imports statements**
1. A **version IRI**, following the [FIBO standard version IRI structure](#fibo-standard-iri-format)
1. **Change notes** corresponding to any changes that have been incorporated, which include the link to the version in which the change was made
1. The **maturity level** of the ontology itself

Examples of the above can be found in every published FIBO ontology whose maturity level is 'release'. 

Note that there are cases where tooling such as Protege 

1. removes the DOCTYPE entity declarations, 
2. eliminates abbreviated IRIs, and 
3. sometimes adds a default IRI to the ontology.   

These issues are considered to show stoppers from a FIBO publication perspective and must be rectified prior to checking in any ontology revisions.  In other words, DOCTYPE ENTITY declarations are required, the use of abbreviated IRIs and QNames is required for readability purposes, and there must not be a default IRI in any FIBO ontology.


## FIBO standard IRI format

For FIBO the basic pattern for non-versioned resource IRIs is:

```
https://spec.edmcouncil.org/fibo/ontology/<domain abbreviation>/<module>/.../<module>/<ontology name>/<resource name>
```
E.g.:

```
https://spec.edmcouncil.org/fibo/ontology/BE/LegalEntities/LegalPersons/LegalEntity
```

Note that the strategy defined herein reflects what we do in the "gold source" GitHub versions of our ontologies, rather than the IRIs generated via the publication process.

Embedded versionIRIs, which we revise with every agreed change to any ontology, use the following pattern:

```
https://spec.edmcouncil.org/fibo/ontology/<domain abbreviation>/YYYYMMDD/<module>/.../<module>/<ontology name>/
```

and should be accompanied by a short change note indicating what changed from the prior version of that ontology.

Namespace prefixes for FIBO follow the pattern: 

```
fibo-<domain abbreviation>-<module abbreviation>-...-<module abbreviation>-<ontology abbreviation>
```
where all elements between the dashes are lower-case alpha. 

## Capturing Terminology for the Body of an Ontology
While there are ontologists that argue that naming in an ontology is not only irrelevant but can be challenging due to the number and nature of overlapping terms, overloaded terms, and other issues that many industries face, **FIBO's primary objective is to assist in the standardization and disambiguation of terminology used in the financial domain**, and specifically for use in contracts.  

This means that the **terminology is just as important as the underlying logic and mathematics** as a product that the industry can use, and **words do matter**.  Having said this, it can be very difficult to ensure that the terminology used is acceptable to all of our FIBO stakeholders, and so we encourage and need participation by subject matter experts to ensure that we have complete and appropriate coverage for the terms used in a given sub-domain of finance.  Many institutions have found that their team members are sometimes 'sloppy' with the language that they use.  Culturally, especially within small sub-groups, the language used can evolve based on internal jargon, the jargon used in the applications that the team needs to do their work, and due to other factors.  The intent here is to do our best to use the language that the business analysts in the relevant sub-domains agree on, and we attempt to get multiple SMEs across institutions to agree to limit the influence of any particular organization or group of people using a specific tool or application alone to accomplish their job.  

We cross-reference the terminology with government glossaries, standards glossaries, and other sources to the degree possible in order to ensure that our resulting terminology is representative.  When those sources are from government references or standards, such as ISO standards, we include a reference to the source wherever possible.

A generic template for capturing terminology and related annotations can be found [here](https://www.morganclaypool.com/doi/suppl/10.2200/S00834ED1V01Y201802WBE018/suppl_file/OETerminologyTemplate.xlsx), which is described in depth in Chapter 4 of the Ontology Engineering book referenced above.

## Naming and Labeling Conventions

**Naming conventions** refer to the FIBO policies that concern the names of FIBO resources that are parts of their identifiers (URIs):

FIBO\_ONTOLOGY\_NAMESPACE/**RESOURCE\_NAME**

E.g.: **LegalEntity** is **RESOURCE\_NAME** in

https://spec.edmcouncil.org/fibo/ontology/BE/LegalEntities/LegalPersons/LegalEntity

**Labeling conventions** are the FIBO policies that characterize what annotations should and can be used to describe FIBO resources.


#### General naming and labeling conventions
* **FIBO enforces both unique labels and unique names conventions**, even across namespaces.  There is content in the provisional and informative ontologies that does not adhere to these policies, but for any released ontology, we require unique naming and unique labeling.
* **There should be no special characters and no abbreviations in names.** There are rare examples where we deviate from this policy, such as for code lists that are automatically generated, but otherwise, abbreviations should not be used despite resulting in lengthy names in some cases. 
* **Every class, property, and individual must have a label**, at a minimum, with **additional annotations** as described below. **It should be the natural language (American English) representation of that entity, space-separated, including the language tag for English**.  
* **Labels should be expressed in lower case, with proper spacing as if they were written as text**.  The only exception to the lower case rule in labels is for **proper names, which may be capitalized**, as appropriate. 
* Where alternate language equivalents are available, **additional language-tagged labels may be used**, however.  Some of our Canadian entities include French labels, for example, in which case proper diacritical marks expressed in UTF-8 format should be included in the label (but not in the camel case name). 
* **FIBO resources should not be duplicated.** That is
	* having a class named "Lifecycle" in two different ontologies, regardless of the FIBO domain or module, is strictly prohibited.  There have been cases where a class introduced at some domain level has been needed in another domain, and thus the class has been promoted to a higher, common level in the ontology architecture - in these cases, the lower level class should be deprecated.
	* having a property named "hasJurisdiction" in two different ontologies, regardless of the domain or module, is strictly prohibited.  There have been cases where, due to legacy naming or moving properties from a lower-level domain to an upper-level domain, have resulted in temporary duplication - in these cases, the lower level property should be deprecated.  Properties in OWL can be specified so that they are reusable in property restrictions and other axioms on many classes, which limits, if not eliminates, the need to duplicate names.  If a property is needed at a higher level in the ontology network, or with a different or less constrained domain that that which was used in its initial definition, one should raise an issue.


#### Classes
* Class names (URI parts) should be expressed in **upper camel case**.   
* Class names must be **singular**. 

#### Properties
* Property names (URI parts), both object and data properties, should be expressed in **lower camel case**.  
* **Verbs must be used for property naming** for all object and data properties, without the inclusion of the name of the domain or range class names, with few exceptions for properties of the form "has x", for readability purposes.  

#### Individuals

* Individual names (URI parts) should be expressed in **upper camel case**.  
* ISO 704 promotes the use of the lower case for individuals unless they incorporate proper names, which we have largely followed in FIBO for labels, but not at the URI level. 

#### Abbreviations and additional labels
* FIBO's [Annotation Vocabulary](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/) defines a number of subproperties of [skos:altLabel](https://spec.edmcouncil.org/fibo/ontology?query=http%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23altLabel):

	- [fibo-fnd-utl-av:abbreviation](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/abbreviation) - a short form designation for an entity that can be substituted for its primary representation
	- [fibo-fnd-utl-av:commonDesignation](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/commonDesignation) - a frequently used designation for an entity
	- [fibo-fnd-utl-av:preferredDesignation](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/preferredDesignation) - a recommended designation for an entity in some context
	- [fibo-fnd-utl-av:synonym](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/synonym) - a designation that can be substituted for the primary representation of something
* **Abbreviations should be included as annotations** using an [fibo-fnd-utl-av:abbreviation](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/abbreviation) on the class where appropriate. Abbreviations should be captured in upper case, no spacing, with special characters only in cases where the abbreviation is commonly used with an embedded hyphen, for example. 
* Do not use [skos:altLabel](https://spec.edmcouncil.org/fibo/ontology?query=http%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23altLabel), use [fibo-fnd-utl-av:synonym](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/synonym) or [fibo-fnd-utl-av:abbreviation](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/abbreviation).


## Definitions
* Every class, property, and individual must have a [skos:definition](https://spec.edmcouncil.org/fibo/ontology?query=http%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23definition).
* Definitions must be ISO 704 conformant, meaning; they must be **expressed as partial sentences that can be used to replace the term in a sentence**.  
* Any additional clarification, scope notes, explanatory notes, or other comments on the use of a given concept should be incorporated in other annotations.  
* **Definitions must not be circular**, i.e., the class, property, or individual name must not be used in the definition itself.  

While there are cases in FIBO that do not currently follow ISO 704 conventions, we are working to rectify this over time.

Additional requirements with respect to definition development and supporting annotations include:

* **Every first-class element (class, property, and defining individual) must have a definition, expressed using the skos:definition annotation property rather than rdfs:comment.**
* ISO 704 suggests a **"genus / differentia" structure for definitions, meaning, it recommends identifying one or more ancestral concepts as well as relationships and characteristics that differentiate the concept in question from sibling concepts**.
	* E.g. A [legal entity](https://spec.edmcouncil.org/fibo/ontology/BE/LegalEntities/LegalPersons/LegalEntity) is a
		* (GENUS) [legal person](https://spec.edmcouncil.org/fibo/ontology/BE/LegalEntities/LegalPersons/LegalPerson) 
		* (DIFFERENTIA SPECIFICA) that is a partnership, corporation, or other organization having the capacity to negotiate contracts, assume financial obligations, and pay off debts, organized under the laws of some jurisdiction   
	* E.g. A [debt instrument](https://spec.edmcouncil.org/fibo/ontology/FBC/FinancialInstruments/FinancialInstruments/DebtInstrument) is a
		* (GENUS) [financial instrument](https://spec.edmcouncil.org/fibo/ontology/FBC/FinancialInstruments/FinancialInstruments/FinancialInstrument)
		* (DIFFERENTIA SPECIFICA) that enables the issuing party to raise funds by accepting the obligation to repay a lender by a particular time in accordance with the terms of a contract
	* For classes (nouns), most **definitions should be phrased "<parent class> that …"**, naming the parent(s) and including text that relates that class to others through relationships (object properties) and characteristics (attributes / data properties).
	* For properties, most definitions should be phrased **"<parent relationship> that …"** – in a similar form as the definitions for classes and all property definitions must begin with a verb.
* Definitions should not include content that is or can be modeled via restrictions unless they are inherently required to define the concept. Because we are generating a definition for the glossary from the ontology model, this information is redundant.
* Definitions ideally should be sourced from sanctioned references, such as government glossaries, ISO standards, etc. and such sources should be noted in **annotations that describe the source (fibo-fnd-utl-av:adaptedFrom, fibo-fnd-utl-av:definitionOrigin)**.
* Like labels, **definitions should be expressed clearly in English.  There should be only one skos:definition for any entity, and it should be the natural language (American English) representation of that entity, including the language tag for English**.  
* Where alternate language equivalents are available, additional language-tagged skos:definition elements may be included, however.  **Additional information, such as examples, scope details, explanations, and so forth, should be captured using the appropriate annotation from SKOS, Dublin Core, the Specification Metadata, or the FIBO Annotation Vocabulary**.
* **Reference data individuals may use rdfs:comment, but any defining individual should use skos:definition as the annotation property linking that individual to its definition**.


## Additional Annotations
A number of other annotations are useful for explaining the classes and properties in our ontology.  We use a combination of [Dublin Core Metadata Terms](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/), [Simple Knowledge Organization System (SKOS) annotations](https://www.w3.org/TR/2009/REC-skos-reference-20090818/), [Object Management Group (OMG) Architecture Board's Specification Metadata annotations](https://www.omg.org/techprocess/ab/SpecificationMetadata/) and additional annotations we have defined in the [FIBO Annotation Vocabulary](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/). 

Some of the more common annotations we use, in addition to the annotations we use in the header of an ontology, include:

* [fibo-fnd-utl-av:adaptedFrom](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/adaptedFrom) - to link to or describe a source that was used as input to the development of a definition, relationships, logical axioms, or other information about an element (class, property, individual), from the FIBO annotation vocabulary
* [fibo-fnd-utl-av:explanatoryNote](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/explanatoryNote) - to extend a definition with information relevant to the nature of an element, from the FIBO annotation vocabulary
* usageNote - to provide additional details about how an element should be applied or used, from the FIBO annotation vocabulary
* [skos:example](https://spec.edmcouncil.org/fibo/ontology?query=http%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23example) - to enumerate relevant examples, from SKOS
* [fibo-fnd-utl-alx:actualExpression](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/Analytics/actualExpression) - to provide an equation that would be applied in a rule using the relevant elements defined in the ontology, from the FIBO Analytics ontology in FND Utilities

There are others as well, but these are the ones that we use the most and that FIBO developers should find helpful.


# Conceptual Modeling Approach
## Overarching Principles
FIBO is designed as a W3C OWL 2 DL compliant family of ontologies.  

1. First and foremost, **our ontologies, including all reference data and examples that have 'Release' level maturity, must be provably logically consistent using multiple OWL 2 compliant reasoners**.  We made this choice early on in the development process, once we transitioned from the original spreadsheet and UML-based content developed by the EDM Council to more formal and standardizable OWL ontologies, and maintain this commitment to our user community as a minimum quality level.  Any user contribution to FIBO must continue to be provably logically consistent prior to incorporation. 

2. We are also **committed to reusability and understandability, and, to the degree possible, we maintain unique naming (labeling) of ontology elements**, even though the OWL language does not require it.  This means that we attempt to define properties at the highest level in the property hierarchy where they may be applicable and limit the use of the domain and range restrictions.  This approach differs from common data modeling techniques, and may be more difficult for developers from the data modeling community to grasp at first, but is essential to limiting the proliferation of properties that have limited utility and horribly long names that often include their domain and/or range in order to maintain the unique names approach.  **Benefits of this approach include enabling the reasoners, rule engines, and query engines to make more inferences and facilitating the use of our ontologies in enterprise glossary and natural language processing (NLP) applications**. In addition to the basic label and definition, in many cases, **additional annotation properties are needed to improve understanding and usability** from a user point of view.   Wherever possible, we should, for example, identify the sources used for our definitions (e.g., adaptedFrom, definitionOrigin, or dct:source).  We have a relatively recent policy to minimize the number of definitions we source from copyrighted materials to strictly adhere to fair use policies, but we should cite definitions from ISO sources, from other standards, from government glossaries, from publicly available, reputable, and reliable sources to the degree possible.  Explanatory notes and examples are very helpful to FIBO users, and we need to add more of these whenever possible to aid in usability.

3. **FIBO is polyhierarchical and designed to support both multiple inheritance and multiple classification**.  Our original use case involved the classification of complex financial instruments, which by their nature, can be described in many different ways.  An early example we used in a number of demonstrations was that of an [Interest Rate Swap](https://spec.edmcouncil.org/fibo/ontology/DER/RateDerivatives/IRSwaps/InterestRateSwap) instrument.  FIBO enables classification of each leg of the swap based on the kind of interest rate - fixed or floating, by currency, and by a number of other contractual features.  While the original FIBO content was flatter due to its early roots in spreadsheets and a data modeling style approach to using UML, we have migrated increasingly towards this polyhierarchical modeling style, with fewer but more reusable classes and properties over time.  Users will find that our released ontologies are far more terse and more compact than the provisional and informative content, which we continue to revamp based on our emerging family of use cases. 

4. **FIBO is intended to be mapped and reused with other linked data and ontologies.  Having said this, because it is also an international standard, we will not import or reuse any externally developed ontology that is not itself a standard and/or that is not logically consistent**.  
	* Many people have asked why we don't reuse the **OWL Time ontology from the W3C**, and why we don't use the PROV-O ontology for provenance.  OWL Time is not logically consistent due to the use of non-OWL sanctioned datatypes.  The PROV-O ontology uses punning, and many of its properties are not reusable. Although we have raised issues with the W3C about this, their developers have elected not to address these concerns over other needs of their communities.  
	* We are also often asked about using the Friend of a Friend (FOAF) vocabulary, at least for documentation if nothing else.  FOAF itself has been maintained somewhat over the years, but it references ontologies that are not maintained, and whose links result in 404 errors.  As a consequence, we have determined that it doesn't meet the quality standards that we've set for ourselves and that we believe are imperative for an international standard that the financial industry, including regulators and large institutions, can trust.
	* We have not integrated FIBO with any existing 'upper' ontology, and are increasingly limiting the number of philosophically-grounded concepts at our highest levels.  There are a number of upper ontologies that various communities favor, including the BFO/OBO community, the DOLCE community, and others.  Up until recently, only the PSL (Process Specification Language) ontology was actually an ISO standard, although BFO has just recently achieved this status.  Our thought process on this has been that we don't want to overly complicate the terminology, especially at the top levels, and there are many ways that users new to the community can 'shoot themselves in the proverbial foot' when attempting to reuse such ontologies.  Members of the FIBO leadership team have, on the other hand, successfully mapped parts of FIBO with BFO and others, including but not limited to the OWL implementation of PSL for specific clients that requested this integration and continue to use upper ontologies in testing for logical consistency issues in FIBO from time to time.
	* FIBO users may notice that we frequently use "min 0" cardinality restrictions.  The intent here is to identify properties that typically have a value for a given concept, although there are situations in which they would be undefined.  This minimizes the overhead and number of reasoning errors that might occur in mapping to back-end or reference data but identifies for users things that they might expect to see as a restriction on that concept.


## Minimal Compliance Hygiene Tests
Because we believe that it is important to ensure at least some minimal level of quality in the ontologies we publish for FIBO, we have implemented a number of tests that are automatically run when updates are made via Github.  These include:

1. **No Untyped references** - Any reference to a URI in any context other than as the object of an annotation property must have a type triple for that URI. See [testHygiene0001.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene0001.sparql)
1. **Crossing domains / ranges**  - If one property is a sub of another, then the domains (respectively ranges) should not be subClasses in the opposite direction. See [testHygiene0002.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene0002.sparql), [testHygiene0003.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene0003.sparql)
1. **Labels and Definitions** - Every Class and Property defined in FIBO must have an rdfs:label and a skos:definition. See [testHygiene0004.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene0004.sparql)
1. **Ontology Metadata** - Every Ontology defined in FIBO must have a rdfs:label, sm:copyright, dct:license, dct:abstract. See [testHygiene0005.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene0005.sparql)
1. **Ontology imports** - No ontology may import itself. See [testHygiene1177.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1177.sparql)
1. **Special Characters** - The set of characters allowed in literals is limited to the alphanumeric characters, punctuation marks, and diacritic characters used in the languages FIBO uses. See [testHygiene0114.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene0114.sparql)
1. **Unique Labels** - No label can name more than one owl:Class or rdf:Property. See [testHygiene1067.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1067.sparql)
1. **Circular Definitions** - No FIBO definition should be circular, i.e., a definition cannot contain a label (including synonyms) of the resource being defined. See [testHygiene1068.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1068.sparql)
1. **Object Property Inverses** - No property may have more than one inverse as this may, among other things, make the inverse properties equivalent. See [testHygiene1078.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1078.sparql)
1. **Use of rdfs:comment** - rdfs:comment shouldn't be used for FIBO annotations. See [testHygiene1079.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1079.sparql)
1. **Reference to owl:Thing** - We should not make explicit references to owl:Thing as these are redundant except for someValuesFrom restrictions . See [testHygiene0268.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene0268.sparql)
1. **Synonyms as classes** - Use of OWL equivalences may indicate that different synonyms are modeled as separate classes, which should be avoided. See [testHygiene1103.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1103.sparql)
1. **Avoiding cycles** - Class and property hierarchies should not contain cycles. See [testHygiene1190.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1190.sparql) and [testHygiene1190_properties.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1190_properties.sparql)
1. **Implicit use of “is” relationships** - Various kinds of “is” relationship should be represented by means of the appropriate logical constructs and not by means of ad-hoc properties. See [testHygiene1289.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1289.sparql)
1. **Disconnected resources** - All classes should be rooted in FND, LCC or FBC domain. See [testHygiene1290.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1290.sparql)
1. **Merging different concepts in the same class** - Classes should not refer to multiple concepts. See [testHygiene1292.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1292.sparql)
1. **Use of "min 1" cardinality restrictions** - "min 1" cardinality restrictions should be avoided because of performance considerations. See [testHygiene1293.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1293.sparql)
1. **Deprecated resources should not be used** - If a resource is owl:deprecated, then it should not be reused See [testHygiene1610.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1610.sparql)
1. **Avoid punning** - Because of OWL specification we should avoid punning of both object and data properties See [testHygiene1624_chain.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1624_chain.sparql), [testHygiene1624_disjoint.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1624_disjoint.sparql), [testHygiene1624_equivalent.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1624_equivalent.sparql), [testHygiene1624_inverse.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1624_inverse.sparql), [testHygiene1624_subProperty.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1624_subProperty.sparql), [testHygiene1624.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1624.sparql)
1. **Detect unintended blanks** - We should detect possibly unintended blanks in string values of annotation properties: leading spaces [testHygiene_leading_blanks.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene_leading_blanks.sparql), multiple embedded spaces [testHygiene_multiple_blanks.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene_multiple_blanks.sparql), trailing spaces [testHygiene_trailing_blanks.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene_trailing_blanks.sparql)

We also have a few "instrumentation" queries that count classes ([testHygiene1675_classes.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1675_classes.sparql)), individuals ([testHygiene1675_individuals.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1675_individuals.sparql)), and properties ([testHygiene1675_objectproperties.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1675_objectproperties.sparql), [testHygiene1675_datatypeproperties.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene_parameterized/testHygiene1675_datatypeproperties.sparql)).
          
## Candidate Tests for Quality Compliance

We anticipate identifying more and more quality assurance compliance criteria as time goes on and maintain here a backlog of other things we are considering.