# vpc-full

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_database_route_table"></a> [database\_route\_table](#module\_database\_route\_table) | ../../modules/route-table | n/a |
| <a name="module_database_subnet_group"></a> [database\_subnet\_group](#module\_database\_subnet\_group) | ../../modules/subnet-group | n/a |
| <a name="module_eip"></a> [eip](#module\_eip) | ../../modules/elastic-ip | n/a |
| <a name="module_nat_gateway"></a> [nat\_gateway](#module\_nat\_gateway) | ../../modules/nat-gateway | n/a |
| <a name="module_private_route_table"></a> [private\_route\_table](#module\_private\_route\_table) | ../../modules/route-table | n/a |
| <a name="module_private_subnet_group"></a> [private\_subnet\_group](#module\_private\_subnet\_group) | ../../modules/subnet-group | n/a |
| <a name="module_public_route_table"></a> [public\_route\_table](#module\_public\_route\_table) | ../../modules/route-table | n/a |
| <a name="module_public_subnet_group"></a> [public\_subnet\_group](#module\_public\_subnet\_group) | ../../modules/subnet-group | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../../modules/vpc | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_route"></a> [database\_route](#output\_database\_route) | Database 라우팅 정보 |
| <a name="output_database_subnets"></a> [database\_subnets](#output\_database\_subnets) | Database Subnet 정보 |
| <a name="output_nat_gateway"></a> [nat\_gateway](#output\_nat\_gateway) | NatGateway 정보 |
| <a name="output_private_route"></a> [private\_route](#output\_private\_route) | Private 라우팅 정보 |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | Private Subnet 정보 |
| <a name="output_public_route"></a> [public\_route](#output\_public\_route) | Public 라우팅 정보 |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | Public Subnet 정보 |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | VPC 정보 |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
