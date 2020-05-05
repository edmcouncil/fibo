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

1. Use Case Description - Required

2. Summary - Required (but if you are not using the ontology in a specific application you can skip pre-conditions, post-conditions, triggers, and performance requirements)

3. Usage Scenarios - Required

4. Basic and Alternate Flow of Events - Optional, unless you are building a specific application

5. Use case and activity diagrams - Optional, unless you are building a specific application, though we sometimes provide contextual diagrams here that correspond to the usage scenarios

6. Competency Questions - Required

7. Resources, References, and Notes - Optional, but most of the use cases we have a reference to some sort of source of example data, or references that are useful for ontology development.

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
FIBO ontologies are used for many different applications and are expressed in terms of the W3C Resource Description Framework (RDF), RDF Schema, and Web Ontology Language (OWL 2) standards.  There is a modular structure to facilitate reuse, and we use a standard RDF/XML serialization in Github that is supported by [the serializer tool](#fibo-serialization-tools) to ensure consistency.  

The header of every ontology must include certain information that supports standardization and documentation for FIBO.  We reuse a number of ontologies in the development of terminology included in the header as well as the body of every ontology we publish, including:

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
While there are ontologists that argue that naming in an ontology is not only irrelevant but can be challenging due to the number and nature of overlapping terms, overloaded terms, and other issues that many industries face, ** FIBO's primary use case is to assist in the standardization and disambiguation of terminology used in the financial domain**, and specifically for use in contracts.  

This means that the terminology is just as important as the underlying logic and mathematics as a product that the industry can use, and **words do matter**.  Having said this, it can be very difficult to ensure that the terminology used is acceptable to all of our FIBO stakeholders, and so we encourage and need participation by subject matter experts to ensure that we have complete and appropriate coverage for the terms used in a given sub-domain of finance.  Many institutions have found that their team members are sometimes 'sloppy' with the language that they use.  Culturally, especially within small sub-groups, the language used can evolve based on internal jargon, the jargon used in the applications that the team needs to do their work, and due to other factors.  The intent here is to do our best to use the language that the business analysts in the relevant sub-domains agree on, and we attempt to get multiple SMEs across institutions to agree to limit the influence of any particular organization or group of people using a specific tool or application alone to accomplish their job.  

We cross-reference the terminology with government glossaries, standards glossaries, and other sources to the degree possible in order to ensure that our resulting terminology is representative.  When those sources are from government references or standards, such as ISO standards, we include a reference to the source wherever possible.

A generic template for capturing terminology and related annotations can be found [here](https://www.morganclaypool.com/doi/suppl/10.2200/S00834ED1V01Y201802WBE018/suppl_file/OETerminologyTemplate.xlsx), which is described in depth in Chapter 4 of the Ontology Engineering book referenced above.

## Naming and Labeling Conventions
In general, **FIBO enforces a unique names assumption**, even across namespaces, even though the OWL language does not.  There is content in the provisional and informative ontologies that does not adhere to this policy, but for any released ontology, we require unique naming. 

* **Class names must be singular**,
* **property names must be verbs**, and
* **naming conventions follow W3C Semantic Web de facto standard conventions**.  

From that policy, the following requirements must be followed:

#### Classes
* **Class names should be expressed in upper camel case, no special characters, no abbreviations in names**.  There are rare examples where we deviate from this policy, such as for code lists that are automatically generated, but otherwise, abbreviations should not be used despite resulting in lengthy names in some cases. 
* **Abbreviations should be included as annotations (using an abbreviation annotation) on the class** where appropriate. 
* **Class names must be singular and should not be duplicated** - i.e., having a class named "Lifecycle" in two different ontologies, regardless of the domain or module, is strictly prohibited.  There have been cases where a class introduced at some domain level has been needed in another domain, and thus the class has been promoted to a higher, common level in the ontology architecture - in these cases, the lower level class should be deprecated.

#### Properties
* **Property names, both object and data properties, should be expressed in lower camel case, no special characters, no abbreviations in names**.  
* **Verbs must be used for property naming for all object and data properties, without the inclusion of the name of the domain or range class names, with few exceptions for properties of the form "has x", for readability purposes**.  
* **Property names should not be duplicated** - i.e., having a property named "hasJurisdiction" in two different ontologies, regardless of the domain or module, is strictly prohibited.  There have been cases where, due to legacy naming or moving properties from a lower-level domain to an upper-level domain, have resulted in temporary duplication - in these cases, the lower level property should be deprecated.  Properties in OWL can be specified so that they are reusable in property restrictions and other axioms on many classes, which limits, if not eliminates, the need to duplicate names.  If a property is needed at a higher level in the ontology network, or with a different or less constrained domain that that which was used in its initial definition, one should raise an issue.

#### Individuals
Naming conventions for OWL individuals are less consistent across practitioners.  

* ISO 704 promotes the **use of the lower case for individuals unless they incorporate proper names, which we have largely followed in FIBO for labels, but not at the URI level**. 
* **Individual names should be expressed in upper camel case, no special characters, no abbreviations in names**.  There are rare examples where we deviate from this policy, such as for code lists that are automatically generated, but otherwise, abbreviations should not be used despite resulting in lengthy names in some cases.  **Abbreviations should be included as annotations on the individual** where appropriate.  
* **Individual names should not be duplicated** if at all possible, but there are times when this is difficult to avoid, such as with respect to stages or states related to something.  In these cases, the FIBO Community Group should determine the right approach, given that the namespace will distinguish the individuals from one another.

#### General naming conventions

* **Every (Classes, Properties, and Individuals) curated entity must have a label and a definition**, at a minimum, with **additional annotations, such as the source for the term or definition, strongly encouraged**.
* **Labels should be expressed in lower case, English, with proper spacing as if they were written as text**.  The only exception to the lower case rule in labels is for **proper names, which may be capitalized**, as appropriate.  **Abbreviations should be captured in upper case, no spacing, with special characters only in cases where the abbreviation is commonly used with an embedded hyphen, for example**.  
* Given that FIBO is expressed primarily in American English and that we have a unique names assumption policy as described above, **there should be only one rdfs:label for any entity**, and **it should be the natural language (American English) representation of that entity, space-separated, including the language tag for English, with all other names represented using synonym or abbreviation annotations**.  Where alternate language equivalents are available, **additional language-tagged labels may be used**, however.  Some of our Canadian entities include French labels, for example, in which case proper diacritical marks expressed in UTF-8 format should be included in the label (but not in the camel case name).
* FIBO's [Annotation Vocabulary](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/) defines a number of subproperties of [skos:altLabel](https://spec.edmcouncil.org/fibo/ontology?query=http%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23altLabel):

	- [fibo-fnd-utl-av:abbreviation](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/abbreviation) - a short form designation for an entity that can be substituted for its primary representation
	- [fibo-fnd-utl-av:commonDesignation](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/commonDesignation) - a frequently used designation for an entity
	- [fibo-fnd-utl-av:preferredDesignation](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/preferredDesignation) - a recommended designation for an entity in some context
	- [fibo-fnd-utl-av:synonym](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/synonym) - a designation that can be substituted for the primary representation of something

* It is up to the community of practice to determine the **criteria for additional labels** as well as how to manage them.  **We recommend that they are managed within the community's environment as an extension to FIBO in a separate namespace, however, so that revisions to FIBO can be incorporated without clobbering any local annotations**.  New annotations that provide context for the annotations, potentially that subclass [skos:prefLabel](https://spec.edmcouncil.org/fibo/ontology?query=http%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23prefLabel) or [fibo-fnd-utl-av:synonym](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/synonym), may be appropriate in order to highlight those annotations for use by locally-managed applications.  Do not use [skos:altLabel](https://spec.edmcouncil.org/fibo/ontology?query=http%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23altLabel), use [fibo-fnd-utl-av:synonym](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/synonym) or [fibo-fnd-utl-av:abbreviation](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/abbreviation).
* With respect to additional labels for any first-class ontology element, annotations representing synonyms and abbreviations may be used within FIBO itself. 

## Definitions
* **Definitions must be ISO 704 conformant, meaning, they must be expressed as partial sentences that can be used to replace the term in a sentence**.  
* **Any additional clarification, scope notes, explanatory notes, or other comments on the use of a given concept should be incorporated in other annotations**.  
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
* Definitions should not include content that is or can be modeled via restrictions or other axioms unless they are inherently required to define the concept. Because we are generating the model-based component of a definition, this information is redundant.
* Definitions ideally should be sourced from sanctioned references, such as government glossaries, ISO standards, etc. and such sources should be noted in **annotations that describe the source (fibo-fnd-utl-av:adaptedFrom, fibo-fnd-utl-av:definitionOrigin)**.
* Like labels, **definitions should be expressed clearly in English.  There should be only one skos:definition for any entity, and it should be the natural language (American English) representation of that entity, including the language tag for English**.  
* Where alternate language equivalents are available, additional language-tagged skos:definition elements may be included, however.  **Additional information, such as examples, scope details, explanations, and so forth should be captured using the appropriate annotation from SKOS, Dublin Core, the Specification Metadata, or the FIBO Annotation Vocabulary**.
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

2. We are also **committed to reusability and understandability, and, to the degree possible, we maintain unique naming (labeling) of ontology elements**, even though the OWL language does not require it.  This means that we attempt to define properties at the highest level in the property hierarchy where they may be applicable, and limit the use of domain and range restrictions.  This approach differs from common data modeling techniques, and may be more difficult for developers from the data modeling community to grasp at first, but is essential to limiting the proliferation of properties that have limited utility and horribly long names that often include their domain and/or range in order to maintain the unique names approach.  **Benefits of this approach include enabling the reasoners, rule engines, and query engines to make more inferences, and facilitating use of our ontologies in enterprise glossary and natural language processing (NLP) applications**.

3. **FIBO is polyhierarchical and designed to support both multiple inheritance and multiple classification**.  Our original use case involved the classification of complex financial instruments, which by their nature can be described in many different ways.  An early example we used in a number of demonstrations was that of an [Interest Rate Swap](https://spec.edmcouncil.org/fibo/ontology/DER/RateDerivatives/IRSwaps/InterestRateSwap) instrument.  FIBO enables classification of each leg of the swap based on the kind of interest rate - fixed or floating, by currency, and by a number of other contractual features.  While the original FIBO content was flatter due to its early roots in spreadsheets and a data modeling style approach to using UML, we have migrated increasingly towards this polyhierarchical modeling style, with fewer but more reusable classes and properties over time.  Users will find that our released ontologies are far more terse and more compact than the provisional and informative content, which we continue to revamp based on our emerging family of use cases. 

4. **FIBO is intended to be mapped and reused with other linked data and ontologies.  Having said this, because it is also an international standard, we will not import or reuse any externally developed ontology that is not itself a standard and/or that is not logically consistent**.  
	* Many people have asked why we don't reuse the **OWL Time ontology from the W3C**, and why we don't use the PROV-O ontology for provenance.  Neither of these ontologies is logically consistent, and although we have raised issues with the W3C about this, their developers have elected not to address these concerns over other needs of their communities.  
	* We are also often asked about using the Friend of a Friend (FOAF) vocabulary, at least for documentation if nothing else.  FOAF itself has been maintained somewhat over the years, but it references ontologies that are not maintained, and whose links result in 404 errors.  As a consequence, we have determined that it doesn't meet the quality standards that we've set for ourselves and that we believe are imperative for an international standard that the financial industry, including regulators and large institutions, can trust.
	* We have not integrated FIBO with any existing 'upper' ontology, and are increasingly limiting the number of philosophically-grounded concepts at our highest levels.  There are a number of upper ontologies that various communities favor, including the BFO/OBO community, the DOLCE community, and others.  Up until recently, only the PSL (Process Specification Language) ontology was actually an ISO standard, although BFO has just recently achieved this status.  Our thought process on this has been that we don't want to overly complicate the terminology, especially at the top levels, and there are many ways that users new to the community can 'shoot themselves in the proverbial foot' when attempting to reuse such ontologies.  Members of the FIBO leadership team have, on the other hand, successfully mapped parts of FIBO with BFO and others, including but not limited to the OWL implementation of PSL for specific clients that requested this integration, and continue to use upper ontologies in testing for logical consistency issues in FIBO from time to time.

## Minimal Compliance Hygiene Tests
Because we believe that it is important to ensure at least some minimal level of quality in the ontologies we publish for FIBO, we have implemented a number of tests that are automatically run when updates are made via Github.  These include:

1. **No Untyped references** - Any reference to a URI in any context other than as the object of an annotation property must have a type triple for that URI. See [testHygiene0001.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene/testHygiene0001.sparql)
1. **Crossing domains / ranges**  - If one property is a sub of another, then the domains (respectively ranges) should not be subClasses in the opposite direction. See [testHygiene0002.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene/testHygiene0002.sparql), [testHygiene0003.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene/testHygiene0003.sparql)
1. **Labels and Definitions** - Every Class and Property defined in FIBO must have an rdfs:label and a skos:definition. See [testHygiene0004.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene/testHygiene0004.sparql)
1. **Ontology Metadata** - Every Ontology defined in FIBO must have a rdfs:label, sm:copyright, dct:license, dct:abstract. See [testHygiene0005.sparql](https://github.com/edmcouncil/fibo/blob/master/etc/testing/hygiene/testHygiene0005.sparql)

These tests are run every time a change is introduced via a pull request in GitHub, and represent the absolute minimum bar that our developers must meet.  There are, however, a number of additional tests that we plan to implement in early 2020 that developers should be aware of and conform with.  These include:

* **No property may have more than one inverse** - this is something we can check for using the following SPARQL query:

```
	SELECT ?p1 ?p2 ?p 
	WHERE { ?p1 owl:inverseOf ?p. 
	        ?p2 owl:inverseOf ?p. 
	        FILTER (?p1 != ?p2) }
```        
        
* **Annotations Conventions** - Do not use rdfs:comment for anything, which can also be determined using the following SPARQL query:

```
	SELECT ?Resource ?Type ?Comment 
	WHERE { ?Resource rdf:type ?Type .
	?Resource rdfs:comment ?Comment. 
	FILTER(?Type in (owl:Class, owl:DatatypeProperty, owl:ObjectProperty ))
	FILTER(!(STRSTARTS(STR(?Resource), # ignore things in owl namespace
	"http://www.w3.org/2002/07/owl#") ))
	FILTER(!(STRSTARTS(STR(?Resource), # ignore things in skos namespace
	"http://www.w3.org/2004/02/skos/core#") ))
	}
	ORDER BY ?Type ?Resource
```

* **No Unused Imports** - Do not import an ontology unless something in it is explicitly referenced.  Here is some pseudo-SPARQL which assumes we've used the nQuads syntax:

```
	SELECT ?Importer ?UnusedImported
	WHERE (?Importer a owl:Ontology.
	?Importer owl:imports ?UnusedImported.
	?ImportedElement rdfs:isDefinedBy ?UnusedImported.
	FILTER NOT EXISTS {
	    GRAPH ?g {?Importer a owl:Ontology  # select the named graph containing the triple defining the ontology 
	                      ?x ?p ?ImportedElement. # check to see if an imported element is the object of a triple in this graph 
	              }
	    }}
```

* **No Unsatisfied References** - Any resource referenced should be explicitly declared. The SPARQL query for this should be run without inferencing:

```
    SELECT ?source ?property ?ref
    WHERE {?property a owl:ObjectProperty.
           ?source ?property ?ref.
           FILTER NOT EXISTS{?ref rdf:type ?t}
          }
```
          
## Candidate Tests for Quality Compliance
In addition to the tests listed above, the FIBO Community is contemplating implementing the following tests (through automation where possible, but in review processes at a minimum), to further ensure the quality of the ontologies we publish.  These include:

### T1. Polysemous elements

An ontology element whose name has different meanings is included in the ontology to represent more than one conceptual idea. For example, the class “Theatre” is used to represent both the artistic discipline and the place in which a play is performed.

The FIBO policy for treating polysemes is to create separate concepts for each polyseme and differentiate them via 

1. different names (avoiding numeric extensions on the same name in favor of longer or more accurate names), and 
2. different definitions, including distinguishing restrictions, to the degree possible.

The only case where names are allowed to be duplicated (i.e, where the name used for a concept in one namespace is used for a different concept in another namespace) is for extension purposes, i.e., a concept in a primary FIBO ontology may be extended in a namespace that imports it, either in the original namespace or in a subordinate namespace as appropriate.  Otherwise, FIBO users should assume that even though OWL does not impose a unique names assumption, FIBO policy does.  

Enforcement of a unique name requirement will be implemented as a hygiene test in the near future, and FIBO users should be aware that this is coming soon!

### T2. Synonyms as classes

The FIBO policy for treating synonyms is to create a single concept (class) in the relevant FIBO ontology for that concept, and when required, add an annotation [fibo-fnd-utl-av:synonym](https://spec.edmcouncil.org/fibo/ontology/FND/Utilities/AnnotationVocabulary/synonym) to augment the definition for that concept with an additional synonymous term.  

Often, modelers who are not familiar with the FIBO policy will create several classes whose identifiers are synonyms and define those as as equivalent. As an example we could define “Car”, “Motorcar” and “Automobile” as equivalent classes. Another example is to define the classes “Waterfall” and “Cascade” as equivalents.  This is considered to be a bad practice from a FIBO perspective, given the goal of developing a definitive ontology that can be used for Risk Data Aggregation and Risk Reporting (RDARR) compliance, among other use cases.  

The serializer and/or hygiene tests should identify any case where equivalences relate two named classes for review by the leadership team, and only those that are identified that do not violate this policy should be allowable.

### T3. Creating the relationships such as "is", "isA", "isAKindOf",  or similar rather than using ''rdfs:subClassOf'', ''rdf:type'' or ''owl:sameAs''

The “is” relationship is created in the ontology instead of using OWL primitives for representing the subclass relationship (“subclassOf”), the membership to a class (“instanceOf”), or the equality between instances (“sameAs”). An example of this type of pitfall is to define the class “Actor” in the following way ‘Actor ≡ Person ∩ ∃interprets.Actuation ∩ ∃is.Man’.

### T4. Creating disconnected ontology elements

Ontology elements (classes, relationships or attributes) must not be disconnected from the rest of FIBO. An example of this type of pitfall is to create the relationship “memberOfTeam” and to miss the class representing teams; thus, the relationship created is isolated in the ontology.  There are very few cases in FIBO where a top-level class does not have some sort of grounding in an FND ontology.  These are limited to BE and FBC ontologies and if something is missing at a higher level, they should be brought to the attention of the FIBO FND content team or the leadership team to be addressed.  We can likely suggest places in the hierarchy for new concepts, or take an action to add something at the top level, as appropriate.

### T5. Including cycles in the hierarchy

This issue involves including a cycle between classes in the hierarchy, although it is not intended to have such classes as equivalent.  That is, some class A has a subclass B and at the same time B is a superclass of A. An example of this type of pitfall is represented by the class “Professor” as subclass of “Person”, and the class “Person” as subclass of “Professor”.

FIBO policy strictly forbids cycles among classes.  Cycles are not only considered poor modeling practice, but can make mapping an ontology to a data model or other artifact impossible.  The FIBO ontologies are designed at a conceptual level, but are intended to support meeting Basel III RDARR and other data governance regulations, and therefore must be designed to support mapping to various application and repository standards.  Cycles would prohibit such mappings.

### T6. Merging different concepts in the same class

This issue involves classes that refer to multiple distinct concepts. An example of this type of pitfall is to create the class “StyleAndPeriod”, or “ProductOrService”.  We have very few of these in FIBO, and attempt to limit them to the degree possible.  There are a couple of specific cases that are needed for our mapping to schema.org, in the ClientsAndAccounts ontology, for example, but otherwise we frown on their inclusion in FIBO.

### T7. Missing annotations  

In addition to the basic label and definition, in many cases, additional annotation properties are needed to improve understanding and usability from a user point of view.  We do not currently have a specific test for this, but are reviewing the ontologies to determine whether or not we can identify patterns that can be used to suggest candidates for review by the leadership team.  Wherever possible, we should, for example, identify the sources used for our definitions (e.g., adaptedFrom, definitionOrigin, or dct:source).  We have a relatively recent policy to minimize the number of definitions we source from copyrighted materials to strictly adhere to fair use policies, but we should cite definitions from ISO sources, from other standards, from government glossaries, from publicly available, reputable, and reliable sources to the degree possible.  Explanatory notes and examples are very helpful to FIBO users, and we need to add more of these whenever possible to aid in usability.

### T8. Partial modeling

Typically in FIBO we start by supporting requirements from a particular use case.  Further analysis may determine that some concepts or relationships have been incompletely modeled, though.  There are cases when we've modeled some concept with only a single subclass, for example.  This often means that the model is incomplete, or that the subclass is not necessary.  There are situations when we know that a subordinate ontology will bring in additional subclasses, in which case the singleton is ok.  In other cases, relationships such as "startsIn", representing the starting location for something are defined without the corresponding "endsIn".  Again, this is a case where the model appears to be incomplete.  The singleton subclass cases are easier to identify than missing corresponding relationships from an automation perspective but are things to look for when evaluating an ontology or set of terms for inclusion.  

### T9. Missing disjointness

We have minimized the use of disjointness relations in FIBO to cases that are very clearly disjoint and that should not cause issues for FIBO users mapping to back-end data stores.  Having said this, disjoint relations are very useful in identifying issues in the logic and there are cases that clearly call for disjoint relations that humans can easily point out even if they are tough to identify through automation. 

### T10. Missing domain or range in properties

Our policy for FIBO is that relationships should be as reusable as possible, and only include domain or range declarations at the highest appropriate levels.  There are situations in which the relation is very general and the range should be the most general concept “Thing” or "Resource" for data properties.  However, in other cases, the relations are more specific and it could be a good practice to specify a domain and/or range.  Most data properties should have a defined datatype in their range.  We have limited the use of xsd:string in some parts of FIBO due to the desire to allow for language-specific strings, but are planning to include our own datatype to cover this case in the future.  For dates and times there are cases where, due to our policy of being OWL DL compliant, we have not used xsd:date as an explicit datatype.  The CombinedDateTime datatype declared in the FinancialDates ontology provides a higher-level datatype for use in certain cases that we have found quite useful when we believe we might need to map that property to various representations for dates or dates and times in external data sources.  

### T11. Missing equivalent properties

Due to our approach to unique names in FIBO, there are very few cases when we need to deal with equivalences with respect to ontology imports or mapping.  However, users will notice that we have created some equivalences to similar terms in the OMG's Languages, Countries, and Codes (LCC) ontologies.  For extensions to FIBO, and for mappings to other ontologies that users request, classes should be mapped to one another, either through equivalence relations or subclass relations with appropriate restrictions.  These sorts of equivalences may be identified through running reasoners and seeing that the equivalence (or more likely, subclass) relationships are inferred.  When reviewing FIBO extensions, the leadership team will be looking for these kinds of cases, even if automation is not feasible.

### T12. Missing inverse relationships   

This issue appears when a relationship (aside from symmetric properties) does not have a defined inverse relationship. Aside from cases where a given property is describing a feature or characteristic of something, inverses are often appropriate and should be included in the ontology where the "other half"/source relationship is defined.

### T13. Defining wrong inverse relationships

This issue involves declaring two relationships as inverse relations when they are not necessarily.  For example, something is sold or something is bought; in this case, the relationships “isSoldIn” and “isBoughtIn” are not inverse.

### T14.  Use of qualified vs. unqualified restrictions

For the most part in FIBO, we have used qualified cardinality restrictions, which help with understanding as well as with identifying data quality issues in mapped back-end resources.  Extensions to FIBO should use qualified cardinalities wherever possible, and use of unqualified cardinalities must be justified when the additions are under review.

### T15.  Use of "min 1" cardinality restrictions

In most cases, a "min 1" cardinality restriction is logically equivalent to a "some values from" restriction.  Because the existential restriction is far less costly from a reasoning perspective than the corresponding cardinality restriction, we have been careful to use "some values from" as much as possible in FIBO.  Use of "min 1" cardinality restrictions must be justified when the additions are under review.

### T16.  Use of "min 0" cardinality restrictions

FIBO users may notice that we frequently use "min 0" cardinality restrictions.  The intent here is to identify properties that typically have a value for a given concept, although there are situations in which they would be undefined.  This minimizes the overhead and number of reasoning errors that might occur in mapping to back-end or reference data, but identifies for users things that they might expect to see as a restriction on that concept.

We anticipate identifying more and more quality assurance compliance criteria as time goes on, and have a backlog of other things we are considering, but the list provided above should give developers some ideas of the kinds of things we will look for in the review process and likely kick back prior to accepting extensions.