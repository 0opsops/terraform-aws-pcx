terraform {
  required_version = ">= v1.14.0"
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">=6.0.0"
      configuration_aliases = [aws.requester, aws.accepter]
    }
  }
}

provider "aws" {
  default_tags {
    tags = var.tags
  }
}
