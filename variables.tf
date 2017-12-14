<<<<<<< HEAD
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_name" {}
variable "region" {}
variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group" {}
=======
variable "access_key" {
	default = ""
}

variable "secret_key" {
	default = ""
}

variable "key_name" {
	default = "inspec1"
}

variable "region" {
	default = "us-east-1"
}

variable "ami" {
	default = "ami-fce3c696"
}

variable "instance_type" {
	default = "t2.micro"
}

variable "subnet_id" {
	default = "subnet-e6fb64cc"
}
>>>>>>> 6f4a2f3e5911befd762ee56a0bad45782a932e4d
