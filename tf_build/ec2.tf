
provider "aws" {
  version = "=1.1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}

resource "aws_instance" "example" {
  ami = "${var.aws_ami_id}"
  subnet_id = "${var.aws_subnet_id}"
  instance_type = "${var.aws_instance_type}"
  key_name = "${var.aws_ssh_key_name}"
  vpc_security_group_ids = ["${var.aws_security_group}"]
}

#============================================================#
#                      Security Groups
#============================================================#

# Look up the default VPC and the default security group for it
data "aws_vpc" "default" {
  default = "true"
}

resource "aws_default_security_group" "default_" {
  vpc_id = "${data.aws_vpc.default.id}"
}

output "ec2_security_group_default_vpc_id" {
  value = "${data.aws_vpc.default.id}"
}

# Create ingress rules for specified security group
resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${data.aws_vpc.default.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol = "tcp"
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.1/32", "10.0.0.2/32", "10.0.0.3/32"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "ec2_security_group_allow_all_group_id" {
  value = "${aws_security_group.allow_all.id}"
}
