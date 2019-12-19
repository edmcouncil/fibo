<img src="https://spec.edmcouncil.org/fibo/htmlpages/master/latest/img/FIBO_logo.11aeaf9b.jpg" width="300" align="right"/>

# How to contribute
Thanks for your interest in contributing to FIBO! This page will give you a quick overview of how things are organised and most importantly, how to get involved.

## Table of contents

* [What it means to contribute]()
	* [Developing FIBO]()
	* [FIBO Github space]()
	* [Planning events and organizing]()
	* [Coding]()
	* [FIBO education and documentation]()
	* [FIBO website]()
* [FIBO Working Groups (aka FIBO Content Teams)]()
* [Bug reports, feature requests and Pull Requests]()
	* [Bug reports and feature requests]()
	* [Pull Requests]()
* [Contributing to the FIBO code]()
	* [Developer Certificate of Origin (DCO)]()
	* [FIBO Serialization tools](#fibo-serialization-tools)
	* [Local Testing tools](#local-testing-tools)
	* [Principles of best practices (aka FIBO code conventions)]()
* [Updating the FIBO website]()
	* [Sources location]()
	* [Requirements]()
	* [Running the content of website locally]()
	* [Editing the FIBO website content]()
* [EDMC WIKI & JIRA]()
* [Code of conduct]()
 

# What it means to contribute

There are many possible forms of contribution to the FIBO project. It really depends on whether you are a programmer, a web-designer, an ontology expert or a subject matter expert. Below there are a few groups of activities that you can be involved in.

## Developing FIBO
* Organize a group of people that will work on a FIBO extension (see FIBO Content Teams)
* Join a group of people that works on FIBO extension
* Report gaps and typos in FIBO
* Carry out the subject matter expert reviews on FIBO
	* Render restrictions describable as refinements and/or reuse of properties
	* Render existing classes and properties and disjoints and inverses
	* Edit definitions
	* Harvest additional synonyms
	* Review and edit provenance metadata ensuring that all references to other namespaces in other relevant ontologies are referenced appropriately. E.g., LCC in OMG.


## FIBO Github space 
* Restructure layouts to improve the FIBO project’s usability
* Link to duplicate issues, and suggest new issue labels, to keep things organized
* Go through open issues and suggest closing old ones
* Ask clarifying questions on recently opened issues to move the discussion forward
* Find an open issue to tackle
* Answer questions for people on open issues
* Help moderate the discussion boards or conversation channels
* Review code on other people’s submissions

## Planning events and organizing
* Organize workshops or meetups about FIBO
* Help community members find the right conferences and submit proposals for speaking about FIBO
* Start a newsletter for the project, or curate highlights from the mailing list
* Offer to mentor another contributor

## Coding
* Ask if you can help improving the FIBO infrastructure
* Suggest improvement of tooling and testing

## FIBO education and documentation
* Write and improve the FIBO documentation
* Write tutorials or courses for how FIBO can be used
* Curate a folder of examples, use cases, and user stories showing how FIBO is or can be used
* Provide test data for the use cases
* When the FIBO is ready for the Release Maturity Level, build required publication
documentation

## FIBO website

* Help improving the [FIBO website](https://spec.edmcouncil.org/fibo/) (see below)
* Conduct user research to reorganize and refine the project’s navigation or menus
* Put together a style guide to help the project have a consistent visual design
* Create nice graphics
* Suggest improvements in [FIBO Viewer](https://spec.edmcouncil.org/fibo/ontology/)


# FIBO Working Groups (aka FIBO Content Teams)
FIBO Working Groups (FWGs) are formed when the FIBO Community Group  decides what existing or new FIBO Domain should be further developed. FWGs can also focus on creating documentation or use cases and user stories for FIBO.


FCTs are designed to build FIBO with content that has been developed by the subject matter experts (SMEs) from the Finance industry and tested to the highest requirements published by the FIBO Community. Because of this, and the fact that several FCTs will be working simultaneously, it is necessary that each FCT operate under identical guidelines (this documents explains and defines.......). In between these meetings, Ontologists and other experts prepare for SME reviews that should be publish in the FIBO project repository.

FCTs should be composed by who people who understand the idea of ontology and the Finance Domain.


# Bug reports, feature requests and Pull Requests

## Bug reports and feature requests
Bug reports and feature requests are tracked as [GitHub issues](https://guides.github.com/features/issues/). Create an issue on FIBO repository and provide the following information by filling in the templates:

* [bug report](./.github/ISSUE_TEMPLATE/bug_report.md)
* [feature_request](./.github/ISSUE_TEMPLATE/feature_request.md)

## Pull Requests

Please follow these steps to have your contribution considered by the maintainers:

1. Follow all instructions in [the template](PULL_REQUEST_TEMPLATE.md)
2. Follow the FIBO developer quide and make sure that you proposal follows the principles of best practice 
3. After you submit your pull request, verify that all [status checks](https://help.github.com/articles/about-status-checks/) are passing 
4. If a status check is failing, and you believe that the failure is unrelated to your change, please leave a comment on the pull request explaining why you believe the failure is unrelated. A maintainer will re-run the status check for you. If we conclude that the failure was a false positive, then we will open an issue to track that problem with our status check suite.

While the prerequisites above must be satisfied prior to having your pull request reviewed, the reviewer(s) may ask you to complete additional design work, tests, or other changes before your pull request can be ultimately accepted.


# Contributing to the FIBO code

If you want to extend the content of FIBO, you'll need to do the following things: 

1. Create a login for github.com. 
1. Make sure you have java installed; see https://www.oracle.com/technetwork/java/javase/downloads/index.html, if you need to download java.
1. Install a git client.  In FIBO, we recommend [Sourcetree from Atlassian](https://www.sourcetreeapp.com/)
1. Make a "fork" of the ["fibo" repository](https://github.com/edmcouncil/fibo). Clone your fork to your local repository.
1. Install [FIBO serialization tools](#fibo-serialization-tools). This is important so that your code can be compared and merged with code from other contributors. You cannot submit a pull request to the fibo repository without this step. 
1. Install the local testing tools (see below). This will allow you to process FIBO with the most common semantic web editing tools.
1. Edit FIBO using the RDF/OWL editor of your choice (Protégé, TopBraid, MagicDraw CCM, VOM, Cognitum Fluent Editor, etc. ).
1. Submit a Pull Request to the EDM Council's ["fibo" repository](https://github.com/edmcouncil/fibo).

You only have to do steps 1-6 once. Once you have begun contributing, you just repeat steps 7 and 8. 

## Developer Certificate of Origin (DCO) 

We use [Probot / DCO framework](https://github.com/probot/dco) to enforce the Developer Certificate of Origin (DCO) on Pull Requests. It requires all commit messages to contain the Signed-off-by line with an email address that matches the commit author. Please read the full text of the [DCO](DCO). Contributors sign-off that they adhere to these requirements by adding a Signed-off-by line to commit messages.


If you use Sourcetree, please make sure that you choose "Sign off" from Commit Options befor you commit your work.

Git has a "-s" command-line option to append the signature automatically to the commits:

```
$ git commit -s -m 'This is my commit message'

```

## FIBO Serialization tools
When you cloned your fork to your local repository, you chose a directory in which FIBO resides.  This is your fibo installation directory. In order to use the FIBO Serialization tools, you will need two files, a pre-commit hook file and a Java application file called RDF Toolkit. These need to reside in a directory called /hooks under your local Git working directory, called .git; the instructions below should be followed in order to ensure that you have the latest versions of these files in their intended locations.

* In your FIBO installation directory, there is a directory called “.git”, and a folder in there called “hooks”.  This folder should have been created for you when you cloned the repository; if not, you can initialize your repository from the Git command line by changing directory to your fibo installation directory and typing: git init
* The Git command line can be run from within the SourceTree tool by selecting "Open in terminal" from the Actions menu. Alternatively, you may set up a Git shell environment – see separate page ‘Setting up the Git Shell’ for details.
* Running the initialization command should ensure that your .git environment exists and that it includes the /hooks directory. This does not automatically install or update the two files that you need to have in place for the Serializer to work. These are: 
	* pre-commit (no file extension)
	* rdf-toolkit.jar
* These files are updated from time to time so it is recommended that you re-download these directly from the links below before proceeding.
* Copy the file pre-commit to your hooks directory (use right-click on the link and select the save option).  Make sure that the name of the file is just pre-commit; your browser might want to append a suffix like .txt to it. 
* Edit this pre-commit file to point to your Java JRE/JDK. To do this, open the pre-commit file in a text editor and search for “JAVA_HOME”. Edit the directory after JAVA_HOME= to point to the location of your Java 8 (a.k.a version 1.8) or higher JRE/JDK, and save it. 
* Copy the file rdf-toolkit.jar to your hooks directory by clicking on the link, viewing where the download was saved, and moving or copying it to the .git/hooks directory. 

Once you have installed these two files, every commit you do will re-write your RDF/OWL files in a consistent way that can be compared and merged with work done by other FIBO collaborators. 

You can test Your Installation with the following steps.  These steps assume you are using Sourcetree, so adjust them to your own git installation:

* Create a branch of the FIBO repository (in Sourcetree, click the "branch" icon).  Name your branch SerializerTest.
* In a text editor, open the file fibo/BE/LegalEntities/LegalPersons.rdf
* Find the definition of LegalPerson in this file; it looks like this: 
```
<owl:Class rdf:about="&fibo-be-le-lp;LegalPerson">
```
* A few lines later, notice a line that contains 
```
&fibo-fnd-law-lcap;hasCapacity.
```
  It is a few lines after a line that contains fibo-be-le-lp;isRecognizedIn.
* change 
```
&fibo-fnd-law-lcap;hasCapacity
```  to 
```
&fibo-be-le-lp;isCapableOf
``` .   Save the file. 
* Commit the file to your branch.  In Sourcetree, select LegalPersons.rdf in the staging area, then "Stage Selected", then click "Commit" in the upper left.  Enter a comment (e.g., "Test serialization"), and click "commit" in the lower right.   Make sure that the toggle "Push changes immediately ..." is unselected. 
* Examine LegalPersons.rdf,  It should have changed since you saved in a few steps ago.  Verify that your new line, with 
```
&fibo-be-le-lp;isCapableOf
``` now appears before the line with 
```
fibo-be-le-lp;isRecognizedIn
``` .
* Return to the branch you were working on before this test (in Sourcetree, double-click in the left pane on, e.g., "master"). 
* Delete branch SerializerTest.  (in Sourcetree, right-click on the branch in the left pane, and select "delete".  You might have to enable "Force delete" to make it work correctly. 

## Local Testing tools
FIBO developers are accustomed to using desktop tools like Protégé, TopBraid Composer, VOM, and MagicDraw/CCM.  These tools include a variety of tests that experienced users rely on to determine the correctness of their models. In order to satisfy themselves that the ontologies are correct, they need to be able to test the same configuration of ontologies that will be published (i.e., Production and Development, see above).  

In order to make this possible on their local machine, developers need to be able to load just the Release ontologies (from their current testbed).  This is done by creating a file called AboutProd.ttl (also AboutProd.rdf).  Developers working with the pre-release files will want to load all FIBO files; this is done with a file called AboutDev.ttl (also AboutDev.rdf).  These "About" files load the same files that are loaded by the publishing process of FIBO (for Prod and Dev, respectively).  

Some tools (e.g., Protégé and CCM) use catalog files to manage the file loading.  These can also be automatically created. 

To perform local testing, do the following steps:

1. Make sure you can run a Bash shell.  Windows now has a native Bash shell (Windows 10).  One is also available as part of SourceTree. 
1. Download the FIBO tools from https://jenkins.edmcouncil.org/job/fibo-infra-publish/lastSuccessfulBuild/artifact/jenkins/bin/dev_toolkit.zip [DOES NOT WORK].  Unzip this into your FIBO installation directory. 
1. Create a catalog file by running the shell command ./createCatalog.sh (optional, for use with Protege or CCM only)
1. Create the About files by running the shell command ./createAbout.sh (this can take a while)
1. Load AboutProd.ttl (.rdf) or AboutDev.ttl (.rdf) to perform local tests. 

Step 3 needs to be done again whenever you create a new file or change the base URI of a file. 

Step 4 needs to be done again whenever you change the maturity level or base URI of a file, add a new file or delete a file. 


[url](https://spec.edmcouncil.org/fibo/development-process)


## Principles of best practices (aka FIBO code conventions)
### I. Use case development

* In general, and especially at more specific levels in the hierarchy, **every ontology element (i.e., class, property and definitional individual) should be used in at least one competency question in at least one use case**.  

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

### II. Terminology Work

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

#### Ontology Header Information
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

These issues are considered show stoppers from a FIBO publication perspective and must be rectified prior to checking in any ontology revisions.  In other words, DOCTYPE ENTITY declarations are required, use of abbreviated IRIs and QNames is required for readability purposes, and there must not be a default IRI in any FIBO ontology.



#### FIBO standard IRI format

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

#### Capturing Terminology for the Body of an Ontology
While there are ontologists that argue that naming in an ontology is not only irrelevant but can be challenging due to the number and nature of overlapping terms, overloaded terms, and other issues that many industries face, **FIBO's primary use case is to assist in the standardization and disambiguation of terminology used in the financial domain**, and specifically for use in contracts.  

This means that the terminology is just as important as the underlying logic and mathematics as a product that the industry can use, and **words do matter**.  Having said this, it can be very difficult to ensure that the terminology used is acceptable to all of our FIBO stakeholders, and so we encourage and need participation by subject matter experts to ensure that we have complete and appropriate coverage for the terms used in a given sub-domain of finance.  Many institutions have found that their team members are sometimes 'sloppy' with the language that they use.  Culturally, especially within small sub-groups, the language used can evolve based on internal jargon, the jargon used in the applications that the team needs to do their work, and due to other factors.  The intent here is to do our best to use the language that the business analysts in the relevant sub-domains agree on, and we attempt to get multiple SMEs across institutions to agree to limit the influence of any particular organization or group of people using a specific tool or application alone to accomplish their job.  

We cross-reference the terminology with government glossaries, standards glossaries, and other sources to the degree possible in order to ensure that our resulting terminology is representative.  When those sources are from government references or standards, such as ISO standards, we include a reference to the source wherever possible.

A generic template for capturing terminology and related annotations can be found [here](https://www.morganclaypool.com/doi/suppl/10.2200/S00834ED1V01Y201802WBE018/suppl_file/OETerminologyTemplate.xlsx), which is described in depth in Chapter 4 of the Ontology Engineering book referenced above.

#### Naming and Labeling Conventions
In general, **FIBO enforces a unique names assumption**, even across namespaces, even though the OWL language does not.  There is content in the provisional and informative ontologies that does not adhere to this policy, but for any released ontology we require unique naming. 

* **Class names must be singular**,
* **property names must be verbs**, and
* **naming conventions follow W3C Semantic Web de facto standard conventions**.  

From that policy, the following requirements must be followed:

##### Classes
* **Class names should be expressed in upper camel case, no special characters, no abbreviations in names**.  There are rare examples where we deviate from this policy, such as for code lists that are automatically generated, but otherwise, abbreviations should not be used despite resulting in lengthy names in some cases. 
* **Abbreviations should be included as annotations (using an abbreviation annotation) on the class** where appropriate. 
* **Class names must be singular and should not be duplicated** - i.e., having a class named "Lifecycle" in two different ontologies, regardless of the domain or module, is strictly prohibited.  There have been cases where a class introduced at some domain level has been needed in another domain, and thus the class has been promoted to a higher, common level in the ontology architecture - in these cases, the lower level class should be deprecated.

##### Properties
* **Property names, both object and data properties, should be expressed in lower camel case, no special characters, no abbreviations in names**.  
* **Verbs must be used for property naming for all object and data properties, without the inclusion of the name of the domain or range class names, with few exceptions for properties of the form "has x", for readability purposes**.  
* **Property names should not be duplicated** - i.e., having a property named "hasJurisdiction" in two different ontologies, regardless of the domain or module, is strictly prohibited.  There have been cases where, due to legacy naming or moving properties from a lower-level domain to an upper-level domain have resulted in temporary duplication - in these cases, the lower level property should be deprecated.  Properties in OWL can be specified so that they are reusable in property restrictions and other axioms on many classes, which limits, if not eliminates, the need to duplicate names.  If a property is needed at a higher level in the ontology network, or with a different or less constrained domain that that which was used in its initial definition, one should raise an issue.

##### Naming conventions
Naming conventions for OWL individuals are less consistent across practitioners.  

* ISO 704 promotes the **use of lower case for individuals unless they incorporate proper names, which we have largely followed in FIBO for labels, but not at the URI level**. 
* **Individual names should be expressed in upper camel case, no special characters, no abbreviations in names**.  There are rare examples where we deviate from this policy, such as for code lists that are automatically generated, but otherwise, abbreviations should not be used despite resulting in lengthy names in some cases.  **Abbreviations should be included as annotations on the individual** where appropriate.  
* **Individual names should not be duplicated** if at all possible, but there are times when this is difficult to avoid, such as with respect to stages or states related to something.  In these cases, the FIBO Community Group should determine the right approach, given that the namespace will distinguish the individuals from one another.
* **Every (Classes, Properties, and Individuals) curated entity must have a label and a definition**, at a minimum, with **additional annotations, such as the source for the term or definition, strongly encouraged**.
* **Labels should be expressed in lower case, English, with proper spacing as if they were written as text**.  The only exception to the lower case rule in labels is for **proper names, which may be capitalized**, as appropriate.  **Abbreviations should be captured in upper case, no spacing, with special characters only in cases where the abbreviation is commonly used with an embedded hyphen, for example**.  
* Given that FIBO is expressed primarily in American English, and that we have a unique names assumption policy as described above, **there should be only one rdfs:label for any entity**, and **it should be the natural language (American English) representation of that entity, space-separated, including the language tag for English, with all other names represented using synonym or abbreviation annotations**.  Where alternate language equivalents are available, **additional language-tagged labels may be used**, however.  Some of our Canadian entities include French labels, for example, in which case proper diacritical marks expressed in UTF-8 format should be included in the label (but not in the camel case name). 
* It is up to the community of practice to determine the **criteria for additional labels** as well as how to manage them.  **We recommend that they are managed within the community's environment as an extension to FIBO in a separate namespace, however, so that revisions to FIBO can be incorporated without clobbering any local annotations**.  New annotations that provide context for the annotations, potentially that subclass skos:prefLabel or fibo-fnd-utl-av:synonym, may be appropriate in order to highlight those annotations for use by locally-managed applications.  
* With respect to additional labels for any first-class ontology element, annotations representing synonyms and abbreviations may be used within FIBO itself. 

#### Definitions
* **Definitions must be ISO 704 conformant, meaning, they must be expressed as partial sentences that can be used to replace the term in a sentence**.  
* **Any additional clarification, scope notes, explanatory notes, or other comments on the use of a given concept should be incorporated in other annotations**.  
* **Definitions must not be circular**, i.e., the class, property, or individual name must not be used in the definition itself.  

While there are cases in FIBO that do not currently follow ISO 704 conventions, we are working to rectify this over time.

Additional requirements with respect to definition development and supporting annotations include:

* **Every first-class element (class, property, and defining individual) must have a definition, expressed using the skos:definition annotation property rather than rdfs:comment.**
* ISO 704 suggests a **“genus / differentia” structure for definitions, meaning, it recommends identifying one or more ancestral concepts as well as relationships and characteristics that differentiate the concept in question from sibling concepts**.  We attempt to follow this to the degree possible in FIBO:
	* For classes (nouns), most **definitions should be phrased “<parent class> that …”**, naming the parent(s) and including text that relates that class to others through relationships (object properties) and characteristics (attributes / data properties).
	* For properties, most definitions should be phrased **“<parent relationship> that …”** – in a similar form as the definitions for classes, and all property definitions must begin with a verb.
* Definitions should not include content that is or can be modeled via restrictions or other axioms unless they are inherently required to define the concept. Because we are generating the model-based component of a definition, this information is redundant.
* Definitions ideally should be sourced from sanctioned references, such as government glossaries, ISO standards, etc. and such sources should be noted in **annotations that describe the source (fibo-fnd-utl-av:adaptedFrom, fibo-fnd-utl-av:definitionOrigin)**.
* Like labels, **definitions should be expressed clearly in English.  There should be only one skos:definition for any entity, and it should be the natural language (American English) representation of that entity, including the language tag for English**.  
* Where alternate language equivalents are available, additional language-tagged skos:definition elements may be included, however.  **Additional information, such as examples, scope details, explanations, and so forth should be captured using the appropriate annotation from SKOS, Dublin Core, the Specification Metadata, or the FIBO Annotation Vocabulary**.
* **Reference data individuals may use rdfs:comment, but any defining individual should use skos:definition as the annotation property linking that individual to its definition**.



# FIBO website <img src="https://vuejs.org/images/logo.png" width="50" align="right"/>


The FIBO Vue application sources are located in FIBO main repository. In the FIBO Vue source code is located under: fibo/etc/fibo-vue/. Please consult the [README.md](./etc/fibo-vue/README.md) file to learn how to update the FIBO website.

      

# EDMC WIKI & JIRA

* [EDMC WIKI](https://wiki.edmcouncil.org/)
* [EDMC JIRA](https://jira.edmcouncil.org)


# Code of conduct
This project adheres to the Contributor Covenant code of conduct. By participating, you are expected to uphold this code. Please report unacceptable behavior to [fibo@edmcouncil.org](mailto:fibo@edmcouncil.org). 