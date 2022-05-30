terraform {
  required_version = ">= v1.1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.14.0"
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
