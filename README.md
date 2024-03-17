# AWS VPCs Peering

## Support PCX in same/multi regions and same/multi accounts pre-existing VPCs

## THIS MODULE FULLY DEPENDENT ON TERRAFORM STATE FILES, A `VPC` AND ITS `S3 REMOTE STATE` MUST BE IN THE SAME REGION

__________________________________________________________
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= v1.1.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=5.41.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.accepter"></a> [aws.accepter](#provider\_aws.accepter) | >=5.41.0 |
| <a name="provider_aws.requester"></a> [aws.requester](#provider\_aws.requester) | >=5.41.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route.accept_private_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.accept_public_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.request_private_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.request_public_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_vpc_peering_connection.request_x_accept](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [aws_vpc_peering_connection_accepter.request_x_accept](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |
| [aws_vpc_peering_connection_options.accept](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_options) | resource |
| [aws_vpc_peering_connection_options.request](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_options) | resource |
| [aws_caller_identity.accept](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.request](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_s3_bucket.accept](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |
| [aws_s3_object.accept_network_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_object) | data source |
| [aws_s3_object.request_network_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_object) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accept_region"></a> [accept\_region](#input\_accept\_region) | Accepter VPC region | `string` | n/a | yes |
| <a name="input_accept_s3"></a> [accept\_s3](#input\_accept\_s3) | Accepter S3 Bucket name | `string` | n/a | yes |
| <a name="input_accept_state"></a> [accept\_state](#input\_accept\_state) | Accepter State file name | `string` | n/a | yes |
| <a name="input_request_s3"></a> [request\_s3](#input\_request\_s3) | Requester S3 Bucket name | `string` | n/a | yes |
| <a name="input_request_state"></a> [request\_state](#input\_request\_state) | Requester State file name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | PCX brief description | `map(string)` | n/a | yes |

## Outputs

No outputs.
