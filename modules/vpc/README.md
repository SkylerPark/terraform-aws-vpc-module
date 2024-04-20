# vpc

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
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_ipv4_cidr_block_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_ipv4_cidr_block_association) | resource |
| [aws_vpc_ipv6_cidr_block_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_ipv6_cidr_block_association) | resource |
| [aws_vpn_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_hostnames_enabled"></a> [dns\_hostnames\_enabled](#input\_dns\_hostnames\_enabled) | (선택) 인스턴스 시작시 퍼블릭IP 주소에 해당하는 퍼블릭DNS 호스트이름을 수신할지 여부. Default: `false`. | `bool` | `false` | no |
| <a name="input_dns_resolution_enabled"></a> [dns\_resolution\_enabled](#input\_dns\_resolution\_enabled) | (선택) Amazon DNS서버를 통한 DNS 확인이 VPC에 대해 지원하는지 여부. Default: `true`. | `bool` | `true` | no |
| <a name="input_internet_gateway"></a> [internet\_gateway](#input\_internet\_gateway) | (필수) VPC Internet Gateway 설정값 입니다. `internet_gateway` 블록 내용.<br>    (선택) `enabled` - Internet Gateway 생성 할지에 대한 여부. Defaults: `true`.<br>    (선택) `name` - Internet Gateway 이름 입니다. Defaults: `VPC`-igw. | <pre>object({<br>    enabled = optional(bool, true)<br>    name    = optional(string)<br>  })</pre> | `{}` | no |
| <a name="input_ipv4_cidrs"></a> [ipv4\_cidrs](#input\_ipv4\_cidrs) | (필수) IPv4 CIDR 리스트.<br>    (선택) `type` - CIDR type `MANUAL` and `IPAM_POOL`. Default: `MANUAL`.<br>    (선택) `cidr` - VPC CIDR block between /16 and /28.<br>    (선택) `ipam_pool` - IPAM Pool 을 이용하여 CIDR 할당<br>      (필수) `id` - IPAM pool ID.<br>      (선택) `netmask_length` - IPAM pool netmask. | <pre>list(object({<br>    type = optional(string, "MANUAL")<br>    cidr = optional(string)<br>    ipam_pool = optional(object({<br>      id             = string<br>      netmask_length = optional(number)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_ipv6_cidrs"></a> [ipv6\_cidrs](#input\_ipv6\_cidrs) | (필수) IPv6s CIDR 리스트.<br>    (선택) `type` - CIDR type `AMAZON` and `IPAM_POOL`. Default: `AMAZON`.<br>    (선택) `amazon` - VPC에 사용할 Amazon 제공 IPv6 CIDR 을 가져오기 위한 구성. `type` 이 `AMAZON` 일때만 사용됩니다. `amazon` 블록 내용.<br>      (선택) `network_border_group` - 네트워크 경계 그룹의 이름 입니다. Defaults: VPC 지역 이름.<br>    (선택) `ipam_pool` - IPAM Pool 을 이용하여 CIDR 할당<br>      (필수) `id` - IPAM pool ID.<br>      (선택) `cidr` - VPC CIDR 블록. Required if `netmask_length` 가 설정 되지 않았고 `allocation_default_netmask` 설정 되지 않았을 경우 필수.<br>      (선택) `netmask_length` - IPAM pool netmask. | <pre>list(object({<br>    type = optional(string, "AMAZON")<br>    amazon = optional(object({<br>      network_border_group = optional(string)<br>    }), {})<br>    ipam_pool = optional(object({<br>      id             = string<br>      cidr           = optional(string)<br>      netmask_length = optional(number)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) VPC 내 리소스 전체 이름 Prifix | `string` | n/a | yes |
| <a name="input_network_address_usage_metrics_enabled"></a> [network\_address\_usage\_metrics\_enabled](#input\_network\_address\_usage\_metrics\_enabled) | (선택) VPC NAU (Network Address Usage) 지표 활성화 여부. Defaults: `false`. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용 | `map(string)` | `{}` | no |
| <a name="input_tenancy"></a> [tenancy](#input\_tenancy) | (선택) 인스턴스에 대한 tenancy 옵션. `default` or `dedicated`. Default: `default`.<br>    `default` - 인스턴스 시작시 지정된 인스턴스 tenancy 속성을 사용하도록 보장한다.<br>    `dedicated` - 인스턴스 생성시 전용 tenancy 를 보장하고 인스턴스 시간당 $2 요금이 포함된다. | `string` | `"default"` | no |
| <a name="input_vpn_gateway"></a> [vpn\_gateway](#input\_vpn\_gateway) | (필수) Site-to-Site VPN 설정값 입니다. `vpn_gateway` 블록내용.<br>    (선택) `enabled` - VPN Gateway 을 생성할지에 대한 여부. Defaults; `false`.<br>    (선택) `name` - VPN Gateway 이름 입니다. Default: `VPC`-vgw.<br>    (선택) `asn` - Autonomous System Number (ASN). Defaults: `64512`. | <pre>object({<br>    enabled = optional(bool, false)<br>    name    = optional(string)<br>    asn     = optional(number, 64512)<br>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | VPC arn |
| <a name="output_id"></a> [id](#output\_id) | VPC ID |
| <a name="output_internet_gateway"></a> [internet\_gateway](#output\_internet\_gateway) | VPC Internet Gateway 내용.<br>    `id` - Internet Gateway ID.<br>    `arn` - Internet Gateway ARN. |
| <a name="output_ipv4_primary_cidr"></a> [ipv4\_primary\_cidr](#output\_ipv4\_primary\_cidr) | VPC Primary CIDR blocks. |
| <a name="output_ipv4_secondary_cidr"></a> [ipv4\_secondary\_cidr](#output\_ipv4\_secondary\_cidr) | VPC Secondary CIDR blocks. |
| <a name="output_ipv6_primary_cidr"></a> [ipv6\_primary\_cidr](#output\_ipv6\_primary\_cidr) | VPC Primary CIDR blocks. |
| <a name="output_ipv6_secondary_cidr"></a> [ipv6\_secondary\_cidr](#output\_ipv6\_secondary\_cidr) | VPC Primary CIDR blocks. |
| <a name="output_name"></a> [name](#output\_name) | VPC 이름. |
| <a name="output_vpn_gateway"></a> [vpn\_gateway](#output\_vpn\_gateway) | VPC virtual private gateway of 내용.<br>    `id` - Virtual Private Gateway ID.<br>    `arn` - Virtual Private Gateway ARN.<br>    `asn` - Virtual Private Gateway Autonomous System Number (ASN). |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
