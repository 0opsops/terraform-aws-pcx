terraform {
  required_version = ">= v1.1.8"
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">=5.41.0"
      configuration_aliases = [aws.requester, aws.accepter]
    }
  }

  backend "s3" {
    bucket  = "eks-labs-tfstate"  # PCX state bucket name
    key     = "us-pcx-sg.tfstate" # PCX state file name
    region  = "us-east-1"         # BUCKET REGION for PCX state to keep
    encrypt = true
  }
}

provider "aws" {
  region  = "us-east-1" # Replace region
  alias   = "requester"
  profile = "acc_a" # Replace request AWS profile
}
provider "aws" {
  region  = "ap-southeast-1" # Replace region
  alias   = "accepter"
  profile = "acc_b" # Replace accept AWS profile
}
