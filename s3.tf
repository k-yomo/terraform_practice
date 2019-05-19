resource "aws_s3_bucket" "s3_bucket" {
  # S3 bucket names must be unique across all AWS accounts
  bucket = "k-yomo-terraform-practice"
  acl    = "private"
  region = "${var.region}"
}
