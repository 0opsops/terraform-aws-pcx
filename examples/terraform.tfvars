request_s3    = "REQUESTER_BUCKET_NAME"
request_state = "REQUESTER_NETWORK_STATE_NAME.tfstate"
accept_s3     = "ACCEPT_BUCKET_NAME"
accept_state  = "ACCEPTER_NETWORK_STATE_NAME.tfstate"
accept_region = "ACCEPTER_REGION"
tags = {
  Name         = "DEV to STG"
  ManagedBy    = "Terraform"
  Environment  = "Development"
  Organization = "OopsOps"
}