# FIBO Development & Test Environment

Documentation of the FIBO Development & Test Environment

## Introduction

We are in the process of setting up the FIBO Development & Test Environment.

Progress on actual technical steps can be followed here: [progress.md](progress.md)
## Amazon AWS

The Amazon AWS primary management console can be reached at: https://322861261923.signin.aws.amazon.com/console

(The number 322861261923 is the Amazon AWS Account ID for the EDM Council's account, of which Dennis Wisnosky is the primary account holder).

### Amazon AWS Services

The following services of Amazon AWS will be used:

Service Name  | Description | Purpose
:-------------|:------------|:-------
[IAM](http://aws.amazon.com/iam/) | Identity & Access Management | Used to define groups and users that have access to the actual backend Amazon AWS EC2 machines. This is not the same as groups and users in services like Jenkins.
[EC2](http://aws.amazon.com/ec2/) | Elastic Compute Cloud | Used to define and run Virtual Machines
[VPC](http://aws.amazon.com/vpc/) | Virtual Private Cloud | Used to define a subnet behind a firewall in which the various EC2 instances can run (for now just the Jenkins Master server).
[S3](http://aws.amazon.com/s3/)   | Simple Storage Service | Used to publish & host static content
[Route53](http://aws.amazon.com/route53/) | Domain Name System (DNS) web service | Used to define the various host names in the edmcouncil.org domain and their mapping to "S3 buckets"

### IAM

In the very near future, a userid and group allocation plan needs to be devised and documented right here.

#### Users

IAM User ID | Github User ID | Name | IAM Roles | IAM Groups
:-----------|:---------------|:-----|:----------|:----------
`jgeluk` | @jgeluk | Jacobus Geluk | | `fibo-admins`
`dallemang` | @dallemang | Dean Allemang | | `fibo-admins`

#### Groups

IAM Group ID | Purpose
:------------|:-------
`fibo-admins` | Provides full access to all services of Amazon AWS (including IAM) and therefore all virtual machines etc.
`fibo-jenkins-master-admins` | Provides at the moment same access as `fibo-admins` except for access to IAM. Will eventually have to be trimmed down to the group of people who maintain just the Jenkins server and need access to the host it runs on.

#### Roles

| IAM Role ID | Purpose
:-------------|:-------
`jenkins-master-server` | Used by the EC2 instance that hosts the Jenkins server to access other services like S3.

### VPC

At the moment there is just one simple subnet, which runs one EC2 instance (see below). (See [this page](https://console.aws.amazon.com/vpc/home?region=us-east-1#vpcs:) in the AWS Console):

VPC ID       | Purpose
:------------|:-------
vpc-02359667 | Public Subnet, for running internet facing servers like the Jenkins Master server.

### EC2

The following EC2 instances (virtual machines) are created (see [this page](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#Instances:) in the AWS Console):

EC2 ID     | Purpose
:----------|:-------
i-fbe91cd1 | Jenkins Master Server

### S3

### Route53
