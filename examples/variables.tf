variable "request_s3" {
  type        = string
  default     = ""
  description = ""
}

variable "request_state" {
  type        = string
  default     = ""
  description = ""
}

variable "accept_s3" {
  type        = string
  default     = ""
  description = ""
}

variable "accept_state" {
  type        = string
  default     = ""
  description = ""
}

variable "accept_region" {
  type        = string
  default     = ""
  description = ""
}

variable "tags" {
  type = map(string)
  validation {
    condition     = can(var.tags["Name"])
    error_message = "At least Name tag is required!"
  }
  default     = {}
  description = ""
}
