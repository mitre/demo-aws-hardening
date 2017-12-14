# aws-demo-hardening  

A kitchen-terraform based example of building and validating AWS security settings

## Setup Notes:  

### Install your gems  

You will need to ensure the needed ruby gems are installed:

- `bundle install` to installed the needed gems

### Setup your Environment  

You will need to set the following env_vars for this to work.

<<<<<<< HEAD
- AWS_SUBNET_ID
- AWS_SSH_KEY_ID
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_DEFAULT_INSTANCE_TYPE
- AWS_SUBNET_ID
- AWS_KEY_NAME
- AWS_DEFAULT_REGION
- AWS_AMI_ID
- AWS_SG_ID
=======
#####AWS
- `AWS_...=<your...>`  
- `AWS_... `
- ...
>>>>>>> 6f4a2f3e5911befd762ee56a0bad45782a932e4d

#####Terraform
- `TF_VAR...=<your...>`  
- `TF_VAR_${var}... `
- `TF_VAR_subnet_id = sub-nnn`

where ${var} is a variable name from terraform variable file.

Alternatively, variables are defined here
- `variables.tf    `    (default values)
- `testing.tfvars  `  (your values)

## Usage:

1. `bundle exec kitchen create aws-demo-baseline-ubuntu`
2. `bundle exec kitchen converge aws-demo-baseline-ubuntu`
3. `bundle exec kitchen verify aws-demo-baseline-ubuntu`
4. `bundle exec kitchen destroy aws-demo-baseline-ubuntu`

or

1. `bundle exec kitchen test aws-demo-baseline-ubuntu --destroy=always`

## Quetions:

- see: https://newcontext-oss.github.io/kitchen-terraform/tutorials/amazon_provider_ec2.html
- see: https://github.com/chef/inspec-aws

## Updates:

<<<<<<< HEAD
This repo contains a sub-module(s) so remember to use a :
=======
This repo contains a sub-module(s) so rememeber to use a :
>>>>>>> 6f4a2f3e5911befd762ee56a0bad45782a932e4d

Initial
- ` git clone https://github.com/aaronlippold/aws-demo-hardening.git --recurse-submodules`


Updates
- ` git pull --recurse-submodules`
- ` git fetch --all --prune --recurse-submodules`
