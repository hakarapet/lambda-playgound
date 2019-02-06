terraform {
  backend "s3" {
      encrypt         = true
      bucket          = "hk-terraform-state-bucket"
      key             = "hakarapet/terraform/lambda-playgound"
      region          = "eu-central-1"
      dynamodb_table  = "hk-terraform-dynamodb-locks"
    }
  }

  provider "aws" {
    region = "eu-central-1"
    access_key = "${var.AWS_ACCESS_KEY_ID}"
    secret_key = "${var.SECRET_AWS_ACCESS_KEY}"
}
