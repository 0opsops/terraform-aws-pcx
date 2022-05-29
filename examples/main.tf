module "pcx" {

  providers = {
    aws.requester = aws.request
    aws.accepter  = aws.accept
  }

  # source        = "git::git@github.com:0opsops/terraform-aws-pcx.git?ref=v1.0.0"    ## using specific tags
  source        = "git::git@github.com:0opsops/terraform-aws-pcx.git"
  request_s3    = var.request_s3
  request_state = var.request_state
  accept_s3     = var.accept_s3
  accept_state  = var.accept_state
  accept_region = var.accept_region
  tags          = var.tags
}