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
    bucket  = "S3_BUCKET"          # Replace PCX state bucket nmae
    key     = "STATE_NAME.tfstate" # Replace PCX state file name
    region  = "REGION"
    encrypt = true
  }
}

provider "aws" {
  region  = "REGION" # Replace region
  alias   = "request"
  profile = "REQUESTER_PROFILE" # Replace request AWS profile
}
provider "aws" {
  region  = "REGION" # Replace region
  alias   = "accept"
  profile = "ACCEPTER_PROFILE" # Replace accept AWS profile
}
