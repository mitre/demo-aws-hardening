
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami = "${var.ami}"
  subnet_id = "${var.subnet_id}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  vpc_security_group_ids = ["sg-646b1b11"]
}

resource "aws_s3_bucket" "aws_demo_bucket" {
  bucket = "aws_demo_bucket_1"
  acl    = "public-read"

  tags {
    Name        = "aws_demo_bucket"
    Environment = "prod"
  }
}

