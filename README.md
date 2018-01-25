# aws-demo-hardening  

A kitchen-terraform based example of building and validating AWS security settings

## Setup Notes:  

### Install your gems  

You will need to ensure the needed ruby gems are installed:

- `bundle install` to installed the needed gems

### Setup your Environment  

You will need to set the following env_vars for this to work.

- AWS_SUBNET_ID
- AWS_SSH_KEY_ID
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- TF_VAR_aws_secret_key
- AWS_DEFAULT_INSTANCE_TYPE
- AWS_SUBNET_ID
- AWS_KEY_NAME
- AWS_DEFAULT_REGION
- AWS_AMI_ID
- AWS_SG_ID

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

This repo contains a sub-module(s) so remember to use a :

Initial
- ` git clone https://github.com/aaronlippold/aws-demo-hardening.git`

Alternatively,  to include submodules
- ` git clone https://github.com/aaronlippold/aws-demo-hardening.git --recursive`

Updates
- ` git pull`

## Useful Examples:
- https://github.com/hashicorp/terraform-aws-vault/pull/26/files
