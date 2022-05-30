variable "vpc_name" {
  type        = string
  description = "Name of VPC"
}
variable "aws_region" {
  type        = string
  description = "Region to be deployed VPC"
}
variable "key_name" {
  type        = string
  description = "Instance login key"
}
variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}
variable "cidr" {
  type        = string
  description = "VPC CIDR"
}
variable "public_subnets" {
  type        = list(string)
  description = "Public subnets"
}
variable "private_subnets" {
  type        = list(string)
  description = "Private subnets"
}
variable "azs" {
  type        = list(string)
  description = "AWS Availability Zones"
}
