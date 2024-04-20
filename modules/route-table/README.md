# route-table

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route.ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.ipv6](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.prefix_list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_vpn_gateway_route_propagation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway_route_propagation) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ipv4_routes"></a> [ipv4\_routes](#input\_ipv4\_routes) | (선택) 라우팅 테이블 IPv4 리스트 `ipv4_routes` 블록 내용.<br>    (필수) `destination` - 목적지 IPv4 CIDR block.<br>    (필수) `target` - 라우팅 테이블 타겟 설정. `target` 블록 내용.<br>      (필수) `type` - 라우팅 테이블 타입. 다음과 같은 타입 만 지원`CARRIER_GATEWAY`, `CORE_GATEWAY`, `EGRESS_ONLY_INTERNET_GATEWAY`, `INTERNET_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `NAT_GATEWAY`, `NETWORK_INTERFACE`, `TRANSIT_GATEWAY`, `VPC_ENDPOINT`, `VPC_PEERING_CONNECTION`.<br>      (필수) `id` - 타입에 대한 ID 값. | <pre>list(object({<br>    destination = string<br><br>    target = object({<br>      type = string<br>      id   = string<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_ipv6_routes"></a> [ipv6\_routes](#input\_ipv6\_routes) | (선택) 라우팅 테이블 IPv6 리스트 `ipv6_routes` 블록 내용.<br>    (필수) `destination` - 목적지 IPv6 CIDR block.<br>    (필수) `target` - 라우팅 테이블 타겟 설정. `target` 블록 내용.<br>      (필수) `type` - 라우팅 테이블 타입. 다음과 같은 타입 만 지원 `CARRIER_GATEWAY`, `CORE_GATEWAY`, `EGRESS_ONLY_INTERNET_GATEWAY`, `INTERNET_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `NAT_GATEWAY`, `NETWORK_INTERFACE`, `TRANSIT_GATEWAY`, `VPC_ENDPOINT`, `VPC_PEERING_CONNECTION`.<br>      (필수) `id` - 타입에 대한 ID 값. | <pre>list(object({<br>    destination = string<br><br>    target = object({<br>      type = string<br>      id   = string<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) route table 이름. | `string` | n/a | yes |
| <a name="input_prefix_list_routes"></a> [prefix\_list\_routes](#input\_prefix\_list\_routes) | (선택) 라우팅 테이블 prefix list 에 대한 리스트 `prefix_list_routes` 블록 내용.<br>    (필수) `name` - Prefix 이름.<br>    (필수) `destination` - 목적지 prefix 리스트.<br>    (필수) `target` - 라우팅 테이블 타겟 설정. `target` 블록 내용.<br>      (필수) `type` - 라우팅 테이블 타입. 다음과 같은 타입 만 지원  `CARRIER_GATEWAY`, `CORE_GATEWAY`, `EGRESS_ONLY_INTERNET_GATEWAY`, `INTERNET_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `NAT_GATEWAY`, `NETWORK_INTERFACE`, `TRANSIT_GATEWAY`, `VPC_ENDPOINT`, `VPC_PEERING_CONNECTION`.<br>      (필수) `id` - 타입에 대한 ID 값. | <pre>list(object({<br>    name        = string<br>    destination = string<br><br>    target = object({<br>      type = string<br>      id   = string<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_propagating_vpn_gateways"></a> [propagating\_vpn\_gateways](#input\_propagating\_vpn\_gateways) | (선택) 경로를 전파할 Virtual Private Gateway ID 목록. | `list(string)` | `[]` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | (선택) route table 에 적용할 Subnet ID 리스트. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용 | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (필수) 서브넷을 생성할 VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | route table arn. |
| <a name="output_associated_subnets"></a> [associated\_subnets](#output\_associated\_subnets) | route table 과 연결된 서브넷 ID 목록. |
| <a name="output_id"></a> [id](#output\_id) | route table ID. |
| <a name="output_ipv4_routes"></a> [ipv4\_routes](#output\_ipv4\_routes) | IPv4 CIDR 라우팅 테이블 rule 리스트. |
| <a name="output_ipv6_routes"></a> [ipv6\_routes](#output\_ipv6\_routes) | IPv6 CIDR 라우팅 테이블 rule 리스트. |
| <a name="output_prefix_list_routes"></a> [prefix\_list\_routes](#output\_prefix\_list\_routes) | Prefix list 라우팅 테이블 rule 리스트. |
| <a name="output_propagated_vpn_gateways"></a> [propagated\_vpn\_gateways](#output\_propagated\_vpn\_gateways) | 경로를 전파하는 Virtual Private Gatway ID 목록. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | route table 할당되어 있는 VPC ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
