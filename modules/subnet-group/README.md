# subnet-group

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
| [aws_dax_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dax_subnet_group) | resource |
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_dms_replication_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_replication_subnet_group) | resource |
| [aws_docdb_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_subnet_group) | resource |
| [aws_elasticache_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_memorydb_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/memorydb_subnet_group) | resource |
| [aws_neptune_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_subnet_group) | resource |
| [aws_redshift_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshift_subnet_group) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_customer_owned_ipv4_address_assignment"></a> [customer\_owned\_ipv4\_address\_assignment](#input\_customer\_owned\_ipv4\_address\_assignment) | (선택) 소유 IPv4 주소 할당을 위한 구성. `customer_owned_ipv4_address_assignment` 블록 내용.<br>    (선택) `enabled` - 소유 IPv4 주소를 자동으로 요청할지 여부. Defaults: `false`.<br>    (선택) `outpost` - outpost 리소스 Arn.<br>    (선택) `pool` - 소유 IPv4 주소 풀. | <pre>object({<br>    enabled = optional(bool, false)<br>    outpost = optional(string)<br>    pool    = optional(string)<br>  })</pre> | `{}` | no |
| <a name="input_dax_subnet_group"></a> [dax\_subnet\_group](#input\_dax\_subnet\_group) | (Optional) DAX Subnet Group 설정. `dax_subnet_group` 블록 내용.<br>    (Optional) `enabled` - DAX Subnet Group 생성 여부. Default: `false`.<br>    (Optional) `name` - DAX Subnet Group 이름. Default: `$Name-dex-subnet-group`<br>    (Optional) `description` - DAX Subnet Group 설명. | <pre>object({<br>    enabled     = optional(bool, false)<br>    name        = optional(string)<br>    description = optional(string, "Managed by Terraform.")<br>  })</pre> | `{}` | no |
| <a name="input_dms_replication_subnet_group"></a> [dms\_replication\_subnet\_group](#input\_dms\_replication\_subnet\_group) | (Optional) DMS Replication Subnet Group 설정. `dms_replication_subnet_group` 블록 내용.<br>    (Optional) `enabled` - DMS Replication Subnet Group 생성 여부. Default: `false`.<br>    (Optional) `name` - DMS Replication Subnet Group 이름. Default: `$Name-dmsreplication-subnet-group`<br>    (Optional) `description` - DMS Replication Subnet Group 설명. | <pre>object({<br>    enabled     = optional(bool, false)<br>    name        = optional(string)<br>    description = optional(string, "Managed by Terraform.")<br>  })</pre> | `{}` | no |
| <a name="input_dns_config"></a> [dns\_config](#input\_dns\_config) | (선택) 서브넷 DNS 쿼리에 대한 구성. `dns_config` 블록 내용.<br>    (선택) `hostname_type` - 시작시 인스턴스에 할당할 호스트 이름 유형. IPv6 의 경우 `resource-name` 으로 설정해야 합니다. IPv4 의 경우 둘중 하나로 설정 가능합니다. `ip-name` or `resource-name`. Valid values are `ip-name`, `resource-name`. Defaults to `resource-name`.<br>    (선택) `dns_resource_name_ipv4_enabled` - DNS A 레코드를 사용하여 인스턴스 호스트 이름에 대한 DNS 쿼리에 응답할지 여부. Default: `false`.<br>    (선택) `dns_resource_name_ipv6_enabled` - DNS AAAA 레코드를 사용하여 인스턴스 호스트 이름에 대한 DNS 쿼리에 응답할지 여부. IPv6 의 경우 항상 `true` 입니다. Defaults: `false`.<br>    (선택) `dns64_enabled` - IPv6 전용 서비스가 IPv4 전용 서비스 및 네트워크와 통신할 수 있도록 dns64 활성화 여부. Defaults: `false`. | <pre>object({<br>    hostname_type                  = optional(string, "resource-name")<br>    dns_resource_name_ipv4_enabled = optional(bool, false)<br>    dns_resource_name_ipv6_enabled = optional(bool, false)<br>    dns64_enabled                  = optional(bool, false)<br>  })</pre> | `{}` | no |
| <a name="input_docdb_subnet_group"></a> [docdb\_subnet\_group](#input\_docdb\_subnet\_group) | (Optional) DocumentDB Subnet Group 설정. `docdb_subnet_group` 블록 내용.<br>    (Optional) `enabled` - DocumentDB Subnet Group 생성 여부. Default: `false`.<br>    (Optional) `name` - DocumentDB Subnet Group 이름. Default: `$Name-docdb-subnet-group`<br>    (Optional) `description` - The description of the DocumentDB Subnet Group. | <pre>object({<br>    enabled     = optional(bool, false)<br>    name        = optional(string)<br>    description = optional(string, "Managed by Terraform.")<br>  })</pre> | `{}` | no |
| <a name="input_elasticache_subnet_group"></a> [elasticache\_subnet\_group](#input\_elasticache\_subnet\_group) | (Optional) ElastiCache Subnet Group 설정. `elasticache_subnet_group` 블록 내용.<br>    (Optional) `enabled` - ElastiCache Subnet Group 생성 여부. Default: `false`.<br>    (Optional) `name` - ElastiCache Subnet Group 이름. Default: `$Name-elasticache-subnet-group`<br>    (Optional) `description` - ElastiCache Subnet Group 설명. | <pre>object({<br>    enabled     = optional(bool, false)<br>    name        = optional(string)<br>    description = optional(string, "Managed by Terraform.")<br>  })</pre> | `{}` | no |
| <a name="input_ipv6_address_assignment"></a> [ipv6\_address\_assignment](#input\_ipv6\_address\_assignment) | (선택) IPv6 할당을 위한 구성. `ipv6_address_assignment` 블록 내용.<br>    (선택) `enabled` - IPv6 주소를 자동으로 요청할지 여부. Defaults: `false`. | <pre>object({<br>    enabled = optional(bool, false)<br>  })</pre> | `{}` | no |
| <a name="input_memorydb_subnet_group"></a> [memorydb\_subnet\_group](#input\_memorydb\_subnet\_group) | (Optional)MemoryDB Subnet Group 설정. `memorydb_subnet_group` 블록 내용.<br>    (Optional) `enabled` - MemoryDB Subnet Group 생성 여부. Default: `false`.<br>    (Optional) `name` -  MemoryDB Subnet Group 이름. `$Name-memory-subnet-group`<br>    (Optional) `description` - MemoryDB Subnet Group 설명. | <pre>object({<br>    enabled     = optional(bool, false)<br>    name        = optional(string)<br>    description = optional(string, "Managed by Terraform.")<br>  })</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) 리소스 이름 | `string` | n/a | yes |
| <a name="input_neptune_subnet_group"></a> [neptune\_subnet\_group](#input\_neptune\_subnet\_group) | (Optional) Neptune Subnet Group 설정. `neptune_subnet_group` 블록 내용.<br>    (Optional) `enabled` - Neptune Subnet Group 생성 여부. Default: `false`.<br>    (Optional) `name` - Neptune Subnet Group 이름. `$Name-neptune-subnet-group`<br>    (Optional) `description` - Neptune Subnet Group 설명. | <pre>object({<br>    enabled     = optional(bool, false)<br>    name        = optional(string)<br>    description = optional(string, "Managed by Terraform.")<br>  })</pre> | `{}` | no |
| <a name="input_public_ipv4_address_assignment"></a> [public\_ipv4\_address\_assignment](#input\_public\_ipv4\_address\_assignment) | (선택) 공용 IPv4 주소 할당을 위한 구성. `public_ipv4_address_assignment` 블록 내용.<br>    (선택) `enabled` - 공용 IPv4 주소를 자동으로 요청할지 여부. Default: `false`. | <pre>object({<br>    enabled = optional(bool, false)<br>  })</pre> | `{}` | no |
| <a name="input_rds_subnet_group"></a> [rds\_subnet\_group](#input\_rds\_subnet\_group) | (Optional) RDS Subnet Group 설정. `rds_subnet_group` 블록 내용.<br>    (Optional) `enabled` - RDS Subnet Group 생성 여부. Default: `false`.<br>    (Optional) `name` - RDS Subnet Group 이름. `$Name-rds-subnet-group`<br>    (Optional) `description` - RDS Subnet Group 설명. | <pre>object({<br>    enabled     = optional(bool, false)<br>    name        = optional(string)<br>    description = optional(string, "Managed by Terraform.")<br>  })</pre> | `{}` | no |
| <a name="input_redshift_subnet_group"></a> [redshift\_subnet\_group](#input\_redshift\_subnet\_group) | (Optional) Redshift Subnet Group 설정. `redshift_subnet_group` 블록 내용.<br>    (Optional) `enabled` - Redshift Subnet Group 생성 여부. Defaults to `false`.<br>    (Optional) `name` - Redshift Subnet Group 이름. `$Name-redshift-subnet-group`<br>    (Optional) `description` - Redshift Subnet Group 설명. | <pre>object({<br>    enabled     = optional(bool, false)<br>    name        = optional(string)<br>    description = optional(string, "Managed by Terraform.")<br>  })</pre> | `{}` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | (필수) 서브넷 그룹. Each block of `subnets` 블록 내용.<br>    (선택) `type` - Subnet 타입을 지정 가능한 설정값 `DUALSTACK` or `IPV6`. Default: `DUALSTACK`.<br>    (선택) `availability_zone` - Subnet 에 대한 가용영역.<br>    (선택) `ipv4_cidr` - subnet IPV4 CIDR.<br>    (선택) `ipv6_cidr` - subnet IPV6 CIDR. | <pre>map(object({<br>    type = optional(string, "DUALSTACK")<br><br>    availability_zone = optional(string)<br>    ipv4_cidr         = optional(string)<br>    ipv6_cidr         = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용 | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (필수) 서브넷을 생성할 VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arns"></a> [arns](#output\_arns) | subnet group arn list |
| <a name="output_dax_subnet_group"></a> [dax\_subnet\_group](#output\_dax\_subnet\_group) | DAX Subnet Group 설정 정보.<br>    `id` - DAX Subnet Group ID.<br>    `name` - DAX Subnet Group Name. |
| <a name="output_dms_replication_subnet_group"></a> [dms\_replication\_subnet\_group](#output\_dms\_replication\_subnet\_group) | DMS Replication Subnet Group 설정 정보.<br>    `id` - DMS Replication Subnet Group ID.<br>    `arn` - DMS Replication Subnet Group ARN.<br>    `name` - DMS Replication Subnet Group Name. |
| <a name="output_docdb_subnet_group"></a> [docdb\_subnet\_group](#output\_docdb\_subnet\_group) | DocumentDB Subnet Group 설정 정보.<br>    `id` - DocumentDB Subnet Group ID.<br>    `arn` - DocumentDB Subnet Group ARN.<br>    `name` - the DocumentDB Subnet Group Name. |
| <a name="output_elasticache_subnet_group"></a> [elasticache\_subnet\_group](#output\_elasticache\_subnet\_group) | ElastiCache Subnet Group 설정 정보.<br>    `id` - ElastiCache Subnet Group ID.<br>    `arn` - ElastiCache Subnet Group ARN.<br>    `name` - ElastiCache Subnet Group Name. |
| <a name="output_ids"></a> [ids](#output\_ids) | subnet group id list |
| <a name="output_ipv4_cidrs"></a> [ipv4\_cidrs](#output\_ipv4\_cidrs) | subnet IPv4 CIDR List. |
| <a name="output_ipv6_cidrs"></a> [ipv6\_cidrs](#output\_ipv6\_cidrs) | subnet IPv4 CIDR List. |
| <a name="output_memorydb_subnet_group"></a> [memorydb\_subnet\_group](#output\_memorydb\_subnet\_group) | MemoryDB Subnet Group 설정 정보.<br>    `id` - MemoryDB Subnet Group ID.<br>    `arn` - MemoryDB Subnet Group ARN.<br>    `name` - the MemoryDB Subnet Group Name. |
| <a name="output_name"></a> [name](#output\_name) | subnet group 이름. |
| <a name="output_neptune_subnet_group"></a> [neptune\_subnet\_group](#output\_neptune\_subnet\_group) | Neptune Subnet Group 설정 정보.<br>    `id` - Neptune Subnet Group ID.<br>    `arn` - Neptune Subnet Group ARN.<br>    `name` - Neptune Subnet Group Name. |
| <a name="output_rds_subnet_group"></a> [rds\_subnet\_group](#output\_rds\_subnet\_group) | RDS Subnet Group 설정 정보.<br>    `id` - RDS Subnet Group ID.<br>    `arn` - RDS Subnet Group ARN.<br>    `name` - RDS Subnet Group Name. |
| <a name="output_redshift_subnet_group"></a> [redshift\_subnet\_group](#output\_redshift\_subnet\_group) | Redshift Subnet Group 설정 정보.<br>    `id` - Redshift Subnet Group ID.<br>    `arn` - Redshift Subnet Group ARN.<br>    `name` - Redshift Subnet Group Name. |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | Subnet Group 정보 리스트. |
| <a name="output_subnets_by_az"></a> [subnets\_by\_az](#output\_subnets\_by\_az) | subnet group 에 대한 availability zone. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | subnet group 이 할당되어 있는 VPC ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
