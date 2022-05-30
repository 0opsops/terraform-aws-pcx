# VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_network_acl_id" {
  value       = module.vpc.private_network_acl_id
  description = "ID of the private network ACL  "
}

output "private_route_table_association_ids" {
  value       = module.vpc.private_route_table_association_ids
  description = "List of IDs of the private route table association  "
}

output "private_route_table_ids" {
  value       = module.vpc.private_route_table_ids
  description = "List of IDs of private route tables"
}

output "private_subnet_arns" {
  value       = module.vpc.private_subnet_arns
  description = "List of ARNs of private subnets"
}

output "public_internet_gateway_route_id" {
  value       = module.vpc.public_internet_gateway_route_id
  description = "ID of the internet gateway route."
}

output "public_network_acl_arn" {
  value       = module.vpc.public_network_acl_arn
  description = "ARN of the public network ACL"
}

output "public_network_acl_id" {
  value       = module.vpc.public_network_acl_id
  description = "ID of the public network ACL"
}

output "public_route_table_association_ids" {
  value       = module.vpc.public_route_table_association_ids
  description = "List of IDs of the public route table association"
}

output "public_route_table_ids" {
  value       = module.vpc.public_route_table_ids
  description = "List of IDs of public route tables"
}

# CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "private_subnets_cidr_block" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "public_subnets_cidr_block" {
  description = "List of cidr_blocks of public subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "database_subnets_cidr_block" {
  description = "List of cidr_blocks of database subnets"
  value       = module.vpc.database_subnets_cidr_blocks
}

output "elasticache_subnets_cidr_block" {
  description = "List of cidr_blocks of elasticache subnets"
  value       = module.vpc.elasticache_subnets_cidr_blocks
}

# Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.vpc.database_subnets
}

output "elasticache_subnets" {
  description = "List of IDs of elasticache subnets"
  value       = module.vpc.elasticache_subnets
}

output "redshift_subnets" {
  description = "List of IDs of redshift subnets"
  value       = module.vpc.redshift_subnets
}

output "intra_subnets" {
  description = "List of IDs of intra subnets"
  value       = module.vpc.intra_subnets
}

# NAT gateways
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

output "natgw_ids" {
  description = "List of NAT Gateway IDs"
  value       = module.vpc.natgw_ids
}

output "database_subnet_group" {
  description = "ID of database subnet group"
  value       = module.vpc.database_subnet_group
}

output "database_subnet_group_name" {
  description = "ID of database subnet group"
  value       = module.vpc.database_subnet_group_name
}

output "elasticache_subnet_group" {
  description = "ID of elasticache subnet group"
  value       = module.vpc.elasticache_subnet_group
}

output "elasticache_subnet_group_name" {
  description = "ID of elasticache subnet group"
  value       = module.vpc.elasticache_subnet_group_name
}

data "aws_caller_identity" "current" {}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "EC2_IP" {
  value = aws_eip.this.public_ip
}