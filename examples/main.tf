module "pcx" {

  providers = {
    aws.requester = aws.requester
    aws.accepter  = aws.accepter
  }

  # source        = "git::git@github.com:0opsops/terraform-aws-pcx.git?ref=v1.0.0"    ## using specific tags
  # source        = "git::git@github.com:0opsops/terraform-aws-pcx.git"
  source        = "0opsops/pcx/aws" # Latest version will use
  # version       = "1.0.1"           # define specific version
  request_s3    = var.request_s3
  request_state = var.request_state
  accept_s3     = var.accept_s3
  accept_state  = var.accept_state
  accept_region = var.accept_region
  tags          = var.tags
}