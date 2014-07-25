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

Service\ Name | Description | Purpose
:-------------|:------------|:-------
[IAM](http://aws.amazon.com/iam/) | Identity & Access Management | Used to define groups and users that have access to the actual backend Amazon AWS EC2 machines. This is not the same as groups and users in services like Jenkins.
[EC2](http://aws.amazon.com/ec2/) | Elastic Compute Cloud | Used to define and run Virtual Machines
[S3](http://aws.amazon.com/s3/)   | Simple Storage Service | Used to publish & host static content
[Route53](http://aws.amazon.com/route53/) | Domain Name System (DNS) web service | Used to define the various host names in the edmcouncil.org domain and their mapping to "S3 buckets"

### IAM

In IAM there is currently one userid defined: `jgeluk`.
Dean Allemang will be the 2nd AWS user.
In the very near future, a userid and group allocation plan needs to be devised and documented right here.

### EC2

### S3

### Route53
