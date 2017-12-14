
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
<<<<<<< HEAD
  bucket = "aws_demo_bucket_1"
=======
  bucket = "${var.aws_ssh_key_name}-aws_demo_bucket"
>>>>>>> 3c4eaeabb9be72ecd9380c75be801928bcf73e5b
  acl    = "public-read"

  tags {
    Name        = "aws_demo_bucket"
    Environment = "prod"
  }
}

# working version
#resource "aws_s3_bucket" "aws_demo_bucket" {
#  bucket = "aws_demo_bucket_1"
#  acl    = "public-read"
#
#  tags {
#    Name        = "aws_demo_bucket"
#    Environment = "prod"
#  }
#}



# add s3 bucket elements - pub

resource "aws_s3_bucket_object" "object" {
  bucket = "${var.aws_ssh_key_name}-aws_demo_bucket"
  acl = public
  key    = "public-pic.jpg"
  source = "./data/public-pic.jpg"
  etag   = "${md5(file("path/to/file"))}"
}

# add s3 bucket elements - pri

resource "aws_s3_bucket_object" "object" {
  bucket = "${var.aws_ssh_key_name}-aws_demo_bucket"
  acl = private
  key    = "private-pic.jpg"
  source = "./data/private-pic.jpg"
  etag   = "${md5(file("path/to/file"))}"
}
