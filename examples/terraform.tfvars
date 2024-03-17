request_s3    = "ACC_A_BUCKET_NAME"
request_state = "acc_a.tfstate"
accept_s3     = "ACC_B_BUCKET_NAME"
accept_state  = "acc_b.tfstate"
accept_region = "ap-southeast-1"
tags = {
  Name         = "Peering US to SG"
  ManagedBy    = "Terraform"
  Environment  = "Labs"
  Organization = "OopsOps"
}