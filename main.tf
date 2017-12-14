
provider "aws" {
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

resource "aws_s3_bucket" "${var.aws_bucket_prefix}-aws_demo_bucket" {
  bucket = "aws_demo_bucket_1"
  acl    = "public-read"

  tags {
    Name        = "aws_demo_bucket"
    Environment = "prod"
  }
}

# add s3 bucket elements - pub
# add s3 bucket elements - pri
