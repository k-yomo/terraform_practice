// these two environment variables below must be set
// AWS_ACCESS_KEY_ID
// AWS_SECRET_ACCESS_KEY
provider "aws" {
  region = "${var.region}"
}
