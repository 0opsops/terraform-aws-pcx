variable "request_s3" {
  type        = string
  default     = ""
  description = "Requester S3 Bucket name"
}

variable "request_state" {
  type        = string
  default     = ""
  description = "Requester State file name"
}

variable "accept_s3" {
  type        = string
  default     = ""
  description = "Accepter S3 Bucket name"
}

variable "accept_state" {
  type        = string
  default     = ""
  description = "Accepter State file name"
}

variable "accept_region" {
  type        = string
  default     = ""
  description = "Accepter VPC region"
}

variable "tags" {
  type = map(string)
  validation {
    condition     = can(var.tags["Name"])
    error_message = "At least Name tag is required!"
  }
  default = {
    Name = "Account A to Account B"
  }
  description = "PCX brief description"
}
