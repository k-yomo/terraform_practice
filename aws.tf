// these two environment variables below must be set
// AWS_ACCESS_KEY_ID
// AWS_SECRET_ACCESS_KEY
provider "aws" {
  region = "us-east-1"
}

# S3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  # S3 bucket names must be unique across all AWS accounts
  bucket = "k-yomo-terraform-practice"
  acl    = "private"
}

// EC2 instance
resource "aws_instance" "instance" {
  // Ubuntu 16.10 AMI
  ami = "ami-b374d5a5"
  instance_type = "t2.micro"

  // explicit dependency
  depends_on = ["aws_s3_bucket.s3_bucket"]
}

// Elastic IP
resource "aws_eip" "ip" {
  // implicit dependency that requires terraform to create instance first, then ip
  instance = "${aws_instance.instance.id}"
}
