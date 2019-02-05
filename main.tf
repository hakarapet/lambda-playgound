terraform {
	backend "s3" {
			encrypt         = true
			bucket          = "hk-terraform-state-bucket"
			key             = "hakarapet/terraform/lambda-playgound"
			# role_arn        = "arn:aws:iam::529837707544:role/hk-terraform-role"
			region          = "eu-central-1"
			# dynamodb_table  = "hk-terraform-dynamodb-locks"
		}
	}

	provider "aws" {
		region = "eu-central-1"
		access_key = "${var.AWS_ACCESS_KEY_ID}"
  	secret_key = "${var.SECRET_AWS_ACCESS_KEY}"
}
