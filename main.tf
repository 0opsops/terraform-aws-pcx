data "aws_s3_bucket" "accept" {
  provider = aws.accepter
  bucket   = var.accept_s3
}
data "aws_caller_identity" "request" {
  provider = aws.requester
}
data "aws_caller_identity" "accept" {
  provider = aws.accepter
}

data "aws_s3_object" "request_network_state" {
  provider = aws.requester
  bucket   = var.request_s3
  key      = var.request_state
}

locals {
  requestnetworkstate = jsondecode("${data.aws_s3_object.request_network_state.body}")
}

data "aws_s3_object" "accept_network_state" {
  provider = aws.accepter
  bucket   = var.accept_s3
  key      = var.accept_state
}

locals {
  acceptnetworkstate = jsondecode("${data.aws_s3_object.accept_network_state.body}")
}


## Requester side OPS VPC
resource "aws_vpc_peering_connection" "request_x_accept" {
  provider      = aws.requester
  vpc_id        = local.requestnetworkstate.outputs.vpc_id.value
  peer_vpc_id   = local.acceptnetworkstate.outputs.vpc_id.value
  peer_owner_id = data.aws_caller_identity.accept.account_id
  peer_region   = data.aws_s3_bucket.accept.region
  tags          = merge(var.tags)
}

## Accepter side QA VPC
resource "aws_vpc_peering_connection_accepter" "request_x_accept" {
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection.request_x_accept.id
  auto_accept               = true
  tags                      = merge(var.tags)
}

resource "aws_vpc_peering_connection_options" "request" {
  provider                  = aws.requester
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.request_x_accept.id

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}

resource "aws_vpc_peering_connection_options" "accept" {
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.request_x_accept.id

  accepter {
    allow_remote_vpc_dns_resolution = true
  }
}


## Add routes vice versa
resource "aws_route" "request_public_route" {
  provider                  = aws.requester
  route_table_id            = local.requestnetworkstate.outputs.public_route_table_ids.value[0]
  destination_cidr_block    = local.acceptnetworkstate.outputs.vpc_cidr_block.value
  vpc_peering_connection_id = aws_vpc_peering_connection.request_x_accept.id
}
resource "aws_route" "request_private_route" {
  provider                  = aws.requester
  route_table_id            = local.requestnetworkstate.outputs.private_route_table_ids.value[0]
  destination_cidr_block    = local.acceptnetworkstate.outputs.vpc_cidr_block.value
  vpc_peering_connection_id = aws_vpc_peering_connection.request_x_accept.id
}
resource "aws_route" "accept_public_route" {
  provider                  = aws.accepter
  route_table_id            = local.acceptnetworkstate.outputs.public_route_table_ids.value[0]
  destination_cidr_block    = local.requestnetworkstate.outputs.vpc_cidr_block.value
  vpc_peering_connection_id = aws_vpc_peering_connection.request_x_accept.id
}
resource "aws_route" "accept_private_route" {
  provider                  = aws.accepter
  route_table_id            = local.acceptnetworkstate.outputs.private_route_table_ids.value[0]
  destination_cidr_block    = local.requestnetworkstate.outputs.vpc_cidr_block.value
  vpc_peering_connection_id = aws_vpc_peering_connection.request_x_accept.id
}
