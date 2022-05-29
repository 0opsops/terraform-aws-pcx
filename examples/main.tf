module "pcx" {

  providers = {
    aws.requester = aws.request
    aws.accepter  = aws.accept
  }

  # source        = "git::github.com/0opsops/pcx.git//modules?ref=v1.0.0" ## using specific tags
  source        = "git::github.com/0opsops/pcx.git//modules"
  request_s3    = var.request_s3
  request_state = var.request_state
  accept_s3     = var.accept_s3
  accept_state  = var.accept_state
  accept_region = var.accept_region
  tags          = var.tags
}