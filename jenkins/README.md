# FIBO Jenkins

## How can I get access?

The FIBO Jenkins server runs at https://jenkins.edmcouncil.org.
It uses Github user authentication, so everyone needs to have a Github userid in order to access the Jenkins server.
This userid needs to be part of the EDM Council organization on Github.

## Jenkins Master & Slaves

The server that runs at https://jenkins.edmcouncil.org is the so called "Jenkins Master Server". 
The idea is that most common jobs will run there, until we need more capacity. In that case we can delegate the work
of running Jenkins jobs to "slaves". These are Jenkins-servers that do not have their own GUI, they're installed on 
any other machine automatically by the Jenkins Master, and simply run Jenkins jobs.

### Vendor Slaves

The facility that Jenkins provides to run jobs on a slave, can also be used to run specific jobs on special hardware. 
That hardware could be hosted elsewhere, for instance at the premises of a vendor in the FIBO space, such as a triple
store vendor. These vendors could then run the FIBO test jobs on their own hardware, all configured and tuned as good
as it gets. Whenever a change is pulled into the FIBO repository, all sorts of jobs can get triggered on many different
machines, validating that change.

### fibo-infra repo & directory structure

- [`bin/`](../bin/README.md)
  
  The `bin/` directory contains scripts and executable tools (like jena) that
  can be used on your own computer or in a Jenkins job context.
  
- [`jenkins/`](../jenkins/README.md)

  The `jenkins/` directory contains files related to Jenkins, including all scripts
  that can only run in a Jenkins job context (those are stored under `jenkins/bin/`)

- [`site/`](../site/README.md)

  All static files that are published on `spec.edmcouncil.org`.
  
  NOTE: Please do NOT store generated files here!
  

## Creating jobs

### Triggering Jobs

TODO

### Naming conventions

TODO

## Tools on Jenkins Master

### Jena

Jena can be used in your Jenkins job scripts. It is installed as follows:

| Version | Directory |
| ------- | --------- |
| jena 2  | `/usr/local/jena2` |
| jena 3  | `/usr/local/jena3` |

You could also just use the name `/usr/local/jena`.


