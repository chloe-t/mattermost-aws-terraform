## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_all_ips"></a> [allow\_all\_ips](#input\_allow\_all\_ips) | allow\_all\_ips | `string` | `"0.0.0.0/0"` | no |
| <a name="input_app_port"></a> [app\_port](#input\_app\_port) | app\_port | `number` | `443` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS infrastructure regio | `string` | `null` | no |
| <a name="input_aws_vpc_id"></a> [aws\_vpc\_id](#input\_aws\_vpc\_id) | aws\_vpc\_id | `string` | `""` | no |
| <a name="input_aws_vpc_main_cidr_block"></a> [aws\_vpc\_main\_cidr\_block](#input\_aws\_vpc\_main\_cidr\_block) | aws\_vpc\_main\_cidr\_block | `list(string)` | `[]` | no |## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_all_ips"></a> [allow\_all\_ips](#input\_allow\_all\_ips) | allow\_all\_ips | `string` | `"0.0.0.0/0"` | no |
| <a name="input_app_port"></a> [app\_port](#input\_app\_port) | app\_port | `number` | `443` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS infrastructure regio | `string` | `null` | no |
| <a name="input_aws_vpc_id"></a> [aws\_vpc\_id](#input\_aws\_vpc\_id) | aws\_vpc\_id | `string` | `""` | no |
| <a name="input_aws_vpc_main_cidr_block"></a> [aws\_vpc\_main\_cidr\_block](#input\_aws\_vpc\_main\_cidr\_block) | aws\_vpc\_main\_cidr\_block | `list(string)` | `[]` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | sg\_name | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tag map for the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_security_group_arn"></a> [aws\_security\_group\_arn](#output\_aws\_security\_group\_arn) | security group arn |
| <a name="output_aws_security_group_id"></a> [aws\_security\_group\_id](#output\_aws\_security\_group\_id) | security group id |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | sg\_name | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tag map for the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_security_group_arn"></a> [aws\_security\_group\_arn](#output\_aws\_security\_group\_arn) | security group arn |
| <a name="output_aws_security_group_id"></a> [aws\_security\_group\_id](#output\_aws\_security\_group\_id) | security group id |