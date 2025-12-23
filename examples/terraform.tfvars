request_s3    = "acc-a-tf" # replace with your "account A" bucket name
request_state = "acc_a.tfstate"
accept_s3     = "acc-b-tf" # replace with your "account B" bucket name
accept_state  = "acc_b.tfstate"
accept_region = "ap-southeast-1"
tags = {
  Name         = "Peering US to SG"
  ManagedBy    = "Terraform"
  Environment  = "Labs"
  Organization = "OopsOps"
}