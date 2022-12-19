<img src="https://spec.edmcouncil.org/fibo/htmlpages/develop/latest/img/FIBO_logo.11aeaf9b.jpg" width="300" align="right"/>

# How to contribute
Thanks for your interest in contributing to FIBO! This page will give you a quick overview of how things are organized and, most importantly, how to get involved.

## Table of contents

* [What it means to contribute](#what-it-means-to-contribute)
	* [Developing FIBO](#developing-fibo)
	* [FIBO Github space](#fibo-github-space)
	* [Planning events and organizing](#planning-events-and-organizing)
	* [Coding](#coding)
	* [FIBO education and documentation](#fibo-education-and-documentation)
	* [FIBO website](#fibo-website)
* [FIBO Content Teams](#fibo-content-teams)
* [Contributing to the FIBO code](#contributing-to-the-fibo-code)
	* [FIBO Sources and Products](#fibo-sources-and-products)
	* [Maturity levels](#maturity-levels)
		* [Publication Maturity Levels](#publication-maturity-levels)
	* [Issues and Pull Requests](#issues-and-pull-requests)
		* [Issues](#issues)
		* [Pull Requests](#pull-requests)
	* [Developer Certificate of Origin](#developer-certificate-of-origin)
	* [FIBO serialization tools](#fibo-serialization-tools)
	* [Local testing tools](#local-testing-tools)
	* [Automated testing and publication](#automated-testing-and-publication)
* [Principles of best practices](#principles-of-best-practices)           
* [FIBO website](#fibo-vue-website)
* [Code of conduct](#code-of-conduct)
 

# What it means to contribute

There are many possible ways to participate in the FIBO project. It really depends on whether you are a programmer, a web designer, an ontology expert, or a subject matter expert. Below there are a few groups of activities that you can be involved in.

## Developing FIBO
* Organize a group of people that will work on a FIBO extension (see [FIBO Content Teams](#fibo-content-teams))
* Join a group of people that works on FIBO extension
* Report gaps and typos in FIBO
* Carry out the subject matter expert reviews on FIBO
    * Render restrictions describable as refinements and/or reuse of properties
    * Render existing classes and properties and disjoints and inverses
    * Edit definitions
    * Harvest additional synonyms
    * Review and edit provenance metadata, ensuring that all references to other namespaces in other relevant ontologies are referenced appropriately. E.g., LCC in OMG.


## FIBO Github space 
* Restructure layouts to improve the FIBO project's usability.
* Link to duplicate issues, and suggest new issue labels, to keep things organized.
* Go through open issues and suggest closing old ones.
* Ask clarifying questions on recently opened issues to move the discussion forward.
* Find an open issue to tackle.
* Answer questions for people on open issues.
* Help moderate the discussion boards or conversation channels.
* Review code on other people's submissions.

## Planning events and organizing
* Organize workshops or meetups about FIBO.
* Help community members find the right conferences and submit proposals for speaking about FIBO.
* Start a newsletter for the project or curate highlights from the mailing list.
* Offer to mentor another contributor.

## Coding
* Ask if you can help to improve the FIBO infrastructure.
* Suggest improvement of tooling and testing.
	* The code of FIBO Viewer is developed in [this Github repository](https://github.com/edmcouncil/fibo-viewer).
	* Please consult also [ontology-publisher](https://github.com/edmcouncil/ontology-publisher) and [rdf-toolkit](https://github.com/edmcouncil/rdf-toolkit)

## FIBO education and documentation
* Write and improve the FIBO documentation.
* Write tutorials or courses for how FIBO can be used.
* Curate a folder of examples, use cases, and user stories showing how FIBO is or can be used.
* Provide test data for the use cases.
* When the FIBO is ready for the Release Maturity Level, build the required publication documentation.



# FIBO Content Teams
FIBO Content Teams (FCTs) are working groups that are formed when the FIBO Community Group decides what existing or new FIBO Domain should be further developed. FCTs can also focus on creating documentation or use cases and user stories for FIBO.


FCTs are designed to build FIBO with content that has been developed by the subject matter experts (SMEs) from the finance industry and tested to the highest requirements published by the FIBO Community. Because of this, and the fact that several FCTs will be working simultaneously, it is necessary that each FCT operates under identical guidelines (this document explains and defines the [principles for best practices](#principles-of-best-practices)). FCTs should be composed of people who understand both the finance domain and the idea of ontology.




# Contributing to the FIBO code

## FIBO Sources and Products
FIBO is developed using a familiar process from software engineering, in which a product is developed using source code, which is compiled into a product. In most software settings, source code is written in a programming language (e.g., Java, C++, or Python), which is compiled into executable code for the product.  FIBO is developed in the same way, but the product code is not 'executable' in any normal sense of the word. 

In fact, the FIBO products can be published in the same language as the source (i.e., OWL), so it is easy to be confused when looking at any particular file, whether you are looking at source or product. Management of the FIBO development process follows conventional software engineering practices, so the difference between source and product is clear when you think about the process. 

FIBO sources are managed in RDF/XML format.  The FIBO products are published in many formats and serializations (RDF/XML, ttl, json-ld, csv, MS Excel(tm), and SKOS) on the [FIBO website](http://spec.edmcouncil.org/fibo).

The sources are edited by developers using development tools (which can range in sophistication from text editing tools to elaborate WYSIWYG environments).  Products are automatically produced from an integrated testing environment. 

While it is possible to perform certain tests on sources (in most languages, these tests are largely syntactic; in the case of OWL, they can include some semantic completeness and logical correctness tests), official software testing for the development process is done on the products. Just as in classical software engineering, this is necessary, since it is imperative that the product delivered to the customers has itself been tested, not just some source that was used in building it. 
The conventional Software Release Cycle specifies many possible stages of development for a product.  In FIBO, we only use two of these, which we call 

* DEVELOPMENT (corresponding roughly to Beta in the conventional cycle) and 
* PRODUCTION (corresponding roughly to RC in the conventional cycle).  

These stages are described in more detail below as ["Publication Maturity Levels"](#maturity-levels).
In conventional software development, especially when using a formal version control system like git, there can be many versions of the source code.  Some versions are developing new features; some are bug fixes, others are experimental versions that will never move forward.  FIBO recognizes three statuses for its source code; Informative, Provisional, and Release.  These statuses are described in more detail below as ["Maturity Levels"](@maturity-levels). 

## Maturity levels

FIBO maturity levels are indicated on an ontology basis; that is, an ontology has a maturity level, not a class or a property (classes and properties have the maturity level of their containing ontology). Each FIBO ontology has one of three levels of maturity.

**Release**

* Release ontologies have undergone unit and integration testing, and have passed the most rigorous tests for completeness, consistency, and correctness.

**Provisional**

* Provisional ontologies were developed in the early days of FIBO but have not been vetted or tested to the level of Release.

**Informative**

* Informative ontologies are ones that have been considered by the FIBO Community but have been explicitly rejected. They are included in FIBO sources because they include information, without which FIBO would fail basic referential consistency tests. Casual users should usually ignore them. Developers should consider these for information only, to determine the detailed meaning of the things that reference them.

One can see the maturity level for each FIBO ontology, see e.g. 

* [https://spec.edmcouncil.org/fibo/ontology/BE/FunctionalEntities/FunctionalEntities/](https://spec.edmcouncil.org/fibo/ontology/BE/FunctionalEntities/FunctionalEntities/)
* [https://spec.edmcouncil.org/fibo/ontology/LOAN/LoansGeneral/Loans/](https://spec.edmcouncil.org/fibo/ontology/LOAN/LoansGeneral/Loans/)

The maturity level of an ontology is indicated in the ontology file itself, with a triple in RDF, e.g., 

```
fibo-bp-iss-doc: fibo-fnd-utl-av:hasMaturityLevel fibo-fnd-utl-av:Provisional . 
``` 
The development process could go as follows:

* A developer (in his/her local repo) changes the maturity of an ontology from Provisional to Release.
* They make changes to definitions in the ontology (to classes and properties).
* They test these changes until they are satisfied that the ontology is ready.
* They push the ontologies to GitHub and see what the automated tests say.
* Repeat the previous 3 steps until the tests pass. 


### Publication Maturity Levels
The FIBO publications are built from sources through a process that involves re-writing URIs to match publication conventions, converting files into multiple standard formats, and triggering derivative products such as the glossary and FIBO-V. 

The two FIBO publication products are built by combining models from the source maturity levels as follows:

* Production is made up of the Release sources only. 
* Development is made up of sources from Release, Provisional, and Informative levels, all combined together. 

FIBO Community is working to move ontologies up the maturity ladder.  Specifically, to develop Provisional ontologies to become part of the Release, and to remove reliance on Informative models so that they can be removed entirely. 


## Issues and Pull Requests

The FIBO sources are kept in this repository on GitHub. As is customary with GitHub, changes to FIBO can be proposed via the issues or can be made in a fork of this repository, and then proposed directly to the FIBO Community Group through a pull request.   

**You will need a GitHub user name to participate in the development process**. 

### Issues
[Create an issue](https://github.com/edmcouncil/fibo/issues/new/choose) if you would like to report a problem or a bug concerning FIBO.

### Discussions
[Create a new discussion](https://github.com/edmcouncil/fibo/discussions) if you would like to 

* announce your FIBO Content Team to get more attendees,
* ask a question about FIBO,
* suggest an idea for FIBO extension or FIBO documentation.


### Pull Requests

If you want to extend the content of FIBO trough pull requests, you'll need to do the following things: 

1. Make sure you have java installed; see https://www.oracle.com/technetwork/java/javase/downloads/index.html, if you need to download java.
1. Install a git client.  
	* In FIBO, we recommend [Sourcetree from Atlassian](https://www.sourcetreeapp.com/)
1. Make a "fork" of the ["fibo" repository](https://github.com/edmcouncil/fibo). Clone your fork to your local repository.
1. Install [FIBO serialization tools](#fibo-serialization-tools). This is important so that your code can be compared and merged with code from other contributors. You cannot submit a pull request to the fibo repository without this step. 
1. Install the [local testing tools](#local-testing-tools). This will allow you to process FIBO with the most common semantic web editing tools.
1. Edit FIBO using the RDF/OWL editor of your choice (Protégé, TopBraid, MagicDraw CCM, VOM, Cognitum Fluent Editor, etc. ).
1. Submit a pull request to the EDM Council's ["fibo" repository](https://github.com/edmcouncil/fibo). Please add "(WIP)" sufix to the title of your pull request.

You only have to do steps 1-5 once. Once you have begun contributing, you just repeat steps 6 and 7. 


#### To have your contribution considered by the maintainers

* Follow all instructions in [the template](.github/pull_request_template.md).
* Follow the [principles of best practices](#principles-of-best-practices).
* Add "(WIP)" sufix to the title of your pull request.
* After you submit your pull request, verify that all [status checks](https://help.github.com/articles/about-status-checks/) are passing 
* If a status check is failing, and you believe that the failure is unrelated to your change, please leave a comment on the pull request explaining why you believe the failure is unrelated. A maintainer will re-run the status check for you.
* While the prerequisites above must be satisfied prior to having your pull request reviewed, the reviewer(s) may ask you to complete additional design work, tests, or other changes before your pull request can be ultimately accepted.

#### Who can accept pull requests?

* Pull requests can be accepted only by the members of [FIBO Core Write Team](https://github.com/orgs/edmcouncil/teams/fibo-core-write-team/members) who have “Write” permission.

## Developer Certificate of Origin

We use [Probot / DCO framework](https://github.com/probot/dco) to enforce the Developer Certificate of Origin (DCO) on Pull Requests. It requires all commit messages to contain the Signed-off-by line with an email address that matches the commit author. Please read the full text of the [DCO](DCO). Contributors sign-off that they adhere to these requirements by adding a Signed-off-by line to commit messages.


If you use Sourcetree, please make sure that you choose "Sign off" from Commit Options before you commit your work.

Git has a "-s" command-line option to append the signature automatically to the commits:

```
$ git commit -s -m 'This is my commit message'
```

## FIBO serialization tools
When you cloned your fork to your local repository, you chose a directory in which FIBO resides.  This is your fibo installation directory. In order to use the FIBO Serialization tools, you will need two files, a pre-commit hook file and a Java application file called RDF Toolkit. These need to reside in a directory called /hooks under your local Git working directory, called .git; the instructions below should be followed in order to ensure that you have the latest versions of these files in their intended locations.

* In your FIBO installation directory, there is a directory called ".git", and a folder in there called "hooks".  This folder should have been created for you when you cloned the repository; if not, you can initialize your repository from the Git command line by changing directory to your fibo installation directory and typing: git init
* The Git command line can be run from within the SourceTree tool by selecting "Open in terminal" from the Actions menu. Alternatively, you may set up a Git shell environment – see separate page 'Setting up the Git Shell' for details.
* Running the initialization command should ensure that your .git environment exists and that it includes the /hooks directory. This does not automatically install or update the two files that you need to have in place for the Serializer to work. These are: 
    * [pre-commit](https://github.com/edmcouncil/rdf-toolkit/raw/master/etc/git-hook/pre-commit) (no file extension)
    * [rdf-toolkit.jar](https://jenkins.edmcouncil.org/view/rdf-toolkit/job/rdf-toolkit-build/lastSuccessfulBuild/artifact/target/rdf-toolkit.jar)
* These files are updated from time to time so it is recommended that you re-download these directly from the links below before proceeding.
* Copy the file pre-commit to your hooks directory (use right-click on the link and select the save option).  Make sure that the name of the file is just pre-commit; your browser might want to append a suffix like .txt to it. 
* Edit this pre-commit file to point to your Java JRE/JDK. To do this, open the pre-commit file in a text editor and search for "JAVA\_HOME". Edit the directory after JAVA\_HOME= to point to the location of your Java 11 (a.k.a version 1.11) or higher JRE/JDK, and save it. 
* Copy the file rdf-toolkit.jar to your hooks directory by clicking on the link, viewing where the download was saved, and moving or copying it to the .git/hooks directory. 

Once you have installed these two files, every commit you do will re-write your RDF/OWL files in a consistent way that can be compared and merged with work done by other FIBO collaborators. 

You can test Your Installation with the following steps.  These steps assume you are using Sourcetree, so adjust them to your own git installation:

* Create a branch of the FIBO repository (in Sourcetree, click the "branch" icon).  Name your branch SerializerTest.
* In a text editor, open the file fibo/BE/LegalEntities/LegalPersons.rdf
* Find the definition of LegalPerson in this file; it looks like this: 
```<owl:Class rdf:about="&fibo-be-le-lp;LegalPerson">```

* A few lines later, notice a line that contains 
```&fibo-fnd-law-lcap;hasCapacity```. It is a few lines after a line that contains ```fibo-be-le-lp;isRecognizedIn.```

* Change ```&fibo-fnd-law-lcap;hasCapacity``` to ```&fibo-be-le-lp;isCapableOf```. Save the file. 
* Commit the file to your branch.  In Sourcetree, select LegalPersons.rdf in the staging area, then "Stage Selected", then click "Commit" in the upper left.  Enter a comment (e.g., "Test serialization"), and click "commit" in the lower right.   Make sure that the toggle "Push changes immediately ..." is unselected. 
* Examine LegalPersons.rdf,  It should have changed since you saved in a few steps ago.  Verify that your new line, with ```&fibo-be-le-lp;isCapableOf``` now appears before the line with ```fibo-be-le-lp;isRecognizedIn```.
* Return to the branch you were working on before this test (in Sourcetree, double-click in the left pane on, e.g., "master"). 
* Delete branch SerializerTest.  (in Sourcetree, right-click on the branch in the left pane, and select "delete".  You might have to enable "Force delete" to make it work correctly. 

## Local testing tools
FIBO developers are accustomed to using desktop tools like Protégé, TopBraid Composer, VOM, and MagicDraw/CCM.  These tools include a variety of tests that experienced users rely on to determine the correctness of their models. In order to satisfy themselves that the ontologies are correct, they need to be able to test the same configuration of ontologies that will be published (i.e., Production and Development, see above).  

In order to make this possible on their local machine, developers need to be able to load just the Release ontologies (from their current testbed).  This is done by creating a file called **AboutFIBOProd.rdf**.  Developers working with the pre-release files will want to load all FIBO files; this is done with a file called **AboutFIBODev.rdf**.  These "About" files load the same files that are loaded by the publishing process of FIBO (for Prod and Dev, respectively).  

Some tools (e.g., Protégé and CCM) use catalog files to manage the file loading.  These can also be automatically created. 

To perform local testing, do the following steps:

1. Make sure you can run a Bash shell.  Windows now has a native Bash shell.  One is also available as part of SourceTree. 
1. Download the FIBO tools: [dev_toolkit](./etc/dev_toolkit).
1. Create a catalog file by running the shell command ```./createCatalog.sh``` (optional, for use with Protege or CCM only)
1. Create the About files by running the shell command ```./createAbout.sh``` (this can take a while)
1. Load [AboutFIBOProd.rdf](AboutFIBOProd.rdf) or [AboutFIBODev.rdf](AboutFIBODev.rdf) to perform local tests. 

Step 3 needs to be done again whenever you create a new file or change the base URI of a file. 

Step 4 needs to be done again whenever you change the maturity level or base URI of a file, add a new file, or delete a file. 

## Automated testing and publication

When FIBO is 'pushed' to a registered fork, a Jenkins job runs to perform standard tests. These tests are strict and comprehensive for the Production release of FIBO and are quite lax for the Development release of FIBO (for Development, they just check that nothing is referenced unless it is defined)

When a pull request results in a new version of FIBO in the EDMC repository, a series of publication processes are performed according to the FIBO publication policy.  


# Principles of best practices
Principles of best practices for FIBO have been collected in a separate file called [ONTOLOGY\_GUIDE](ONTOLOGY_GUIDE.md).


# FIBO Vue website 
<img src="https://vuejs.org/images/logo.png" width="50" align="right"/>

The FIBO Vue application sources are located in [edmcouncil/html-pages](https://github.com/edmcouncil/html-pages) repository.


# Code of conduct
This project adheres to the Contributor Covenant [code of conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [fibo@edmcouncil.org](mailto:fibo@edmcouncil.org).
