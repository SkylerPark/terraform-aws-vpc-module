# security-group

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
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_security_group_egress_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | (선택) security group 설명. | `string` | `"Managed by Terraform."` | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | (선택) 송신 규칙 설정. `ingress_rules` 블록 내용.<br>    (Required) `id` - 송신에 대한 규칙 ID 값 Terraform 코드에서만 사용.<br>    (Optional) `description` - 규칙에 대한 설명.<br>    (Required) `protocol` - 규칙에 대한 프로토콜. `protocol` 이 `-1` 로 설정시 모든 프로토콜 모든 포트범위로 되며, `from_port` 와 `to_port` 값은 정의 불가.<br>    (Required) `from_port` - 포트 범위의 시작. TCP and UDP protocols, or an ICMP/ICMPv6 type.<br>    (Required) `to_port` - 포트 범위의 끝. TCP and UDP protocols, or an ICMP/ICMPv6 code.<br>    (Optional) `ipv4_cidrs` - IPv4 에 대한 CIDR 리스트.<br>    (Optional) `ipv6_cidrs` - IPv6 에 대한 CIDR 리스트.<br>    (Optional) `prefix_lists` - prefix ID 리스트.<br>    (Optional) `security_groups` - security group ID 리스트.<br>    (Optional) `self` - self 보안 그룹으로 추가할지 여부. | <pre>list(object({<br>    id              = string<br>    description     = optional(string, "")<br>    protocol        = string<br>    from_port       = number<br>    to_port         = number<br>    ipv4_cidrs      = optional(list(string), [])<br>    ipv6_cidrs      = optional(list(string), [])<br>    prefix_lists    = optional(list(string), [])<br>    security_groups = optional(list(string), [])<br>    self            = optional(bool, false)<br>  }))</pre> | `[]` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | (선택) 수신 규칙 설정. `ingress_rules` 블록 내용.<br>    (Required) `id` - 수신에 대한 규칙 ID 값 Terraform 코드에서만 사용.<br>    (Optional) `description` - 규칙에 대한 설명.<br>    (Required) `protocol` - 규칙에 대한 프로토콜. `protocol` 이 `-1` 로 설정시 모든 프로토콜 모든 포트범위로 되며, `from_port` 와 `to_port` 값은 정의 불가.<br>    (Required) `from_port` - 포트 범위의 시작. TCP and UDP protocols, or an ICMP/ICMPv6 type.<br>    (Required) `to_port` - 포트 범위의 끝. TCP and UDP protocols, or an ICMP/ICMPv6 code.<br>    (Optional) `ipv4_cidrs` - IPv4 에 대한 CIDR 리스트.<br>    (Optional) `ipv6_cidrs` - IPv6 에 대한 CIDR 리스트.<br>    (Optional) `prefix_lists` - prefix ID 리스트.<br>    (Optional) `security_groups` - security group ID 리스트.<br>    (Optional) `self` - self 보안 그룹으로 추가할지 여부. | <pre>list(object({<br>    id              = string<br>    description     = optional(string, "")<br>    protocol        = string<br>    from_port       = number<br>    to_port         = number<br>    ipv4_cidrs      = optional(list(string), [])<br>    ipv6_cidrs      = optional(list(string), [])<br>    prefix_lists    = optional(list(string), [])<br>    security_groups = optional(list(string), [])<br>    self            = optional(bool, false)<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) security group 이름. | `string` | n/a | yes |
| <a name="input_revoke_rules_on_delete"></a> [revoke\_rules\_on\_delete](#input\_revoke\_rules\_on\_delete) | (선택) 규칙 삭제 전 수신 및 송식 규칙에 연결된 모든 보안 그룹을 취소하도록 지시하는 옵션. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용. | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (필수) security group 을 생성 할 VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | security group ARN. |
| <a name="output_description"></a> [description](#output\_description) | security group 설명. |
| <a name="output_egress_rules"></a> [egress\_rules](#output\_egress\_rules) | security group 송신 rules. |
| <a name="output_id"></a> [id](#output\_id) | security group ID. |
| <a name="output_ingress_rules"></a> [ingress\_rules](#output\_ingress\_rules) | security group 수신 rules. |
| <a name="output_name"></a> [name](#output\_name) | security group 이름. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | security group 이 포함되어 있는 VPC ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
