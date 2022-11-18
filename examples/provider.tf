terraform {
  required_version = ">= v1.1.8"
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 4.16.0"
      configuration_aliases = [aws.requester, aws.accepter]
    }
  }

  backend "s3" {
    bucket  = "S3_BUCKET_NAME"          # Replace PCX state bucket nmae
    key     = "STATE_NAME.tfstate"      # Replace PCX state file name
    region  = "REGION"                  # BUCKET REGION
    encrypt = true
  }
}

provider "aws" {
  region  = "us-east-1" # Replace region
  alias   = "request"
  profile = "acc_a" # Replace request AWS profile
}
provider "aws" {
  region  = "ap-southeast-1" # Replace region
  alias   = "accept"
  profile = "acc_b" # Replace accept AWS profile
}
