# FIBO Development & Test Environment - Progress

Date     | Who     | Action
:--------|:--------|:------
14/08/04 | @jgeluk | Jenkins configured now, with Github authentication. First job runs (performing a `pallet lint` check on all .owl files
14/07/30 | @jgeluk | Installed NGINX as the HTTP server, working as HTTP proxy to the Jenkins server using [this](http://markunsworth.com/2012/02/11/setting-up-a-jenkins-build-server-on-ec2/) procedure.
14/07/30 | @jgeluk | Amazon increased EC2 instance limit for their Virginia data center from 0 to 20
14/07/28 | @jgeluk | Filled in a sales form after getting that advise from Amazon support in order to increase the EC2 limit from zero to five
14/07/27 | @jgeluk | Defined VPC, SecurityGroup etc but stuck due to EC2 instance limit still on 0
14/07/27 | @jgeluk | Sent request to Amazon (cc Dennis) to increase EC2 instance limit from 0 to 5
14/07/23 | @jgeluk | Created user id `dallemang` in Amazon AWS IAM service
14/07/23 | @jgeluk | Started this progress documentation
14/07/23 | Dennis  | Created userid `jgeluk` in the IAM service for @jgeluk and gave `jgeluk` full admin access.
14/07/23 | Dennis  | Created EDM Council account on Amazon AWS. He is the main account holder
