// these two environment variables below must be set
// AWS_ACCESS_KEY_ID
// AWS_SECRET_ACCESS_KEY
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  // Ubuntu 16.10 AMI
  ami = "ami-b374d5a5"
  instance_type = "t2.micro"
}
