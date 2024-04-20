# nat-gateway

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
| [aws_nat_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_is_private"></a> [is\_private](#input\_is\_private) | (Optional) NAT Gateway 를 비공개 혹은 공개 연결 유형. Default: `false` (public). | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) NAT Gateway 리소스 이름. | `string` | n/a | yes |
| <a name="input_primary_ip_assignment"></a> [primary\_ip\_assignment](#input\_primary\_ip\_assignment) | (선택) NAT Gateway 에 기본 IP 주소 설정. `primary_ip_assignment` 블록 내용.<br>    (선택) `elastic_ip` - NAT Gateway 를 elastic IP 로 생성.<br>    (선택) `private_ip` - NAT Gateway 와 연결할 개인 IP 주소 미설정시 자동할당. | <pre>object({<br>    elastic_ip = optional(string)<br>    private_ip = optional(string)<br>  })</pre> | `{}` | no |
| <a name="input_secondary_ip_assignments"></a> [secondary\_ip\_assignments](#input\_secondary\_ip\_assignments) | (선택) NAT gateway 에 보조 IP 주소를 할당하기 위한 구성. `secondary_ip_assignments` 블록 내용.<br>    (선택) `elastic_ip` - NAT Gateway 를 elastic IP 로 생성.<br>    (선택) `private_ip` - NAT Gateway 와 연결할 개인 IP 주소 미설정시 자동할당. | <pre>list(object({<br>    elastic_ip = optional(string)<br>    private_ip = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_secondary_ip_count"></a> [secondary\_ip\_count](#input\_secondary\_ip\_count) | NAT Gateway 보조 private IPv4 주소 수. | `number` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | (필수) NAT Gateway 를 생성 할 Subnet ID. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용 | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_availability_zone"></a> [availability\_zone](#output\_availability\_zone) | NAT Gateway 존영역.<br>    `id` - availability zone ID.<br>    `name` - availability zone Name. |
| <a name="output_elastic_ip"></a> [elastic\_ip](#output\_elastic\_ip) | elastic Ip 주소의 할당 ID. |
| <a name="output_id"></a> [id](#output\_id) | NAT Gateway ID. |
| <a name="output_name"></a> [name](#output\_name) | NAT Gateway 이름. |
| <a name="output_primary_private_ip"></a> [primary\_private\_ip](#output\_primary\_private\_ip) | NAT Gateway Private IP 주소. |
| <a name="output_primary_public_ip"></a> [primary\_public\_ip](#output\_primary\_public\_ip) | NAT Gateway Public IP 주소. |
| <a name="output_secondary_private_ips"></a> [secondary\_private\_ips](#output\_secondary\_private\_ips) | NAT Gateway Secondary Private IP 주소. |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | NAT Gateway Subnet 정보.<br>    `id` - subnet ID.<br>    `arn` - subnet ARN. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | NAT Gateway 할당되어 있는 VPC ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
