# FIBO Infrastructure, Development & Test Environment

Documentation of the FIBO Development & Test Environment

This repository contains all infrastructural scripts, settings, documentation etc.

## Introduction

We are continously working on the improvement of the process around Development, Builds, Tests and Deployments of FIBO.

## Publication of all artifacts

All FIBO artifacts that are published by the Enterprise Data Management
Council are created by the publisher jobs on our Jenkins server.
The general structure of the URLs on our publication server 
(https://spec.edmcouncil.org) and the corresponding directory structure
is documented here [doc/publishing/](./doc/publishing/README.md)

## Technical Infrastructure

Progress on actual technical steps can be followed here: [progress.md](progress.md)

### Amazon Web Services

All our machines run in the Amazon cloud, also known as "Amazon Web Services".

See also [AWS](./aws/README.md)

### Jenkins

Jenkins is the gatekeeper in our "Test Driven Development" (TDD) 
based "Software Development Life Cycle" (SDLC). All changes that end up having consequences that are shown on our 
"spec site" (https://spec.edmcouncil.org) go via a number of github based repositories where each change triggers one
or more Jenkins jobs.

See also [Jenkins](./jenkins/README.md)

#### Git Repositories

- [fibo](https://github.com/edmcouncil/fibo)
- [fibo-infra](https://github.com/edmcouncil/fibo-infra)
- [rdf-toolkit](https://github.com/edmcouncil/rdf-toolkit)

### JIRA

The JIRA project that defines all the issues around the EDM Council's
FIBO infrastructure can be found here: https://jira.edmcouncil.org/projects/INFRA

### Confluence (Wiki)

The Wiki is here: https://wiki.edmcouncil.org/display/INFRA

We use the wiki to track tasks and discussions for all FCTs and the FLT. 

### Stardog

Currently runs on http://stardog.edmcouncil.org/



