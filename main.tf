
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

resource "aws_s3_bucket" "aws_demo_bucket" {
  bucket = "${var.aws_ssh_key_name}-aws_demo_s3_bucket"
  acl    = "public-read"
  force_destroy = true

  tags {
    Name        = "aws_demo_bucket"
    Environment = "prod"
  }
}

# add s3 bucket elements - pub

resource "aws_s3_bucket_object" "public-read" {
  bucket = "${var.aws_ssh_key_name}-aws_demo_s3_bucket"
  acl    = "public-read"
  key    = "public-pic-read.jpg"
  source = "./data/public-pic.jpg"
  etag   = "${md5(file("./data/public-pic.jpg"))}"

  depends_on = ["aws_s3_bucket.aws_demo_bucket"]
}

# add s3 bucket elements - pub Authenticated Users only

resource "aws_s3_bucket_object" "authenticated-read" {
  bucket = "${var.aws_ssh_key_name}-aws_demo_s3_bucket"
  acl    = "authenticated-read"
  key    = "public-pic-authenticated.jpg"
  source = "./data/public-pic.jpg"
  etag   = "${md5(file("./data/public-pic.jpg"))}"

  depends_on = ["aws_s3_bucket.aws_demo_bucket"]
}
# add s3 bucket elements - pri

resource "aws_s3_bucket_object" "private" {
  bucket = "${var.aws_ssh_key_name}-aws_demo_s3_bucket"
  acl = "private"
  key    = "private-pic.jpg"
  source = "./data/private-pic.jpg"
  etag   = "${md5(file("./data/private-pic.jpg"))}"

  depends_on = ["aws_s3_bucket.aws_demo_bucket"]
}

# valid ACLs are Error: aws_s3_bucket_object.public: "acl" contains an invalid canned ACL type "public". V
#alid types are either "authenticated-read", "aws-exec-read", "bucket-owner-full-control", "bucket-owner-read",
# "private", "public-read", or "public-read-write"
