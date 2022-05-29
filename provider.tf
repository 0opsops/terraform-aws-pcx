terraform {
  required_version = ">= v1.1.8"
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 4.16.0"
      configuration_aliases = [aws.requester, aws.accepter]
    }
  }
}

provider "aws" {
  default_tags {
    tags = var.tags
  }
}
