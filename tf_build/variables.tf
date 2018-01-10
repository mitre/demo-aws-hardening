variable aws_ssh_key_name {
 	default = ""
 }

variable aws_access_key {
 	default = ""
 }

variable aws_secret_key {
 	default = ""
 }

variable aws_instance_type {
 	default = ""
 }

variable aws_subnet_id {
 	default = ""
 }

variable aws_bucket_prefix {
 	default = ""
 }

variable aws_ami_id {
 	default = ""
 }

variable aws_security_group {
 	default = ""
 }

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

variable "ami_id" {
  description = "The ID of the AMI to run in the cluster. This should be an AMI built from the Packer template under examples/vault-consul-ami/vault-consul.json. If no AMI is specified, the template will 'just work' by using the example public AMIs. WARNING! Do not use the example AMIs in a production setting!"
  default = ""
}

variable "aws_region" {
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "force_destroy_s3_bucket" {
  description = "If you set this to true, when you run terraform destroy, this tells Terraform to delete all the objects in the S3 bucket used for backend storage. You should NOT set this to true in production or you risk losing all your data! This property is only here so automated tests of this module can clean up after themselves."
  default     = true
}

variable "vpc_id" {
    description = "The ID of the VPC in which the nodes will be deployed.  Uses default VPC if not supplied."
    default = ""
}
