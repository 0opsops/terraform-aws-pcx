terraform {
  required_version = ">= v1.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.41.0"
    }
  }

  backend "s3" {
    bucket  = ""
    key     = ""
    region  = ""
    encrypt = true
  }
}

provider "aws" {
  region = var.aws_region
}
