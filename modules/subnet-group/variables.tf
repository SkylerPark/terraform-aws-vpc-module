variable "vpc_id" {
  description = "(필수) 서브넷을 생성할 VPC ID."
  type        = string
  nullable    = false
}

variable "name" {
  description = "(필수) 리소스 이름"
  type        = string
  nullable    = false
}

variable "subnets" {
  description = <<EOF
  (필수) 서브넷 그룹. Each block of `subnets` 블록 내용.
    (선택) `type` - Subnet 타입을 지정 가능한 설정값 `DUALSTACK` or `IPV6`. Default: `DUALSTACK`.
    (선택) `availability_zone` - Subnet 에 대한 가용영역.
    (선택) `ipv4_cidr` - subnet IPV4 CIDR.
    (선택) `ipv6_cidr` - subnet IPV6 CIDR.
  EOF
  type = map(object({
    type = optional(string, "DUALSTACK")

    availability_zone = optional(string)
    ipv4_cidr         = optional(string)
    ipv6_cidr         = optional(string)
  }))
  nullable = false

  validation {
    condition     = length(keys(var.subnets)) > 0
    error_message = "하나 이상의 서브넷을 설정 해야합니다."
  }

  validation {
    condition = alltrue([
      for subnet in values(var.subnets) :
      contains(["DUALSTACK", "IPV6"], subnet.type)
    ])
    error_message = "`type` 필드는 `DUALSTACK` or `IPV6` 중 하나만 설정 해야합니다."
  }

  validation {
    condition = alltrue([
      for subnet in values(var.subnets) :
      subnet.ipv4_cidr != null
      if subnet.type == "DUALSTACK"
    ])
    error_message = "`DUALSTACK` 타입은 IPv4 를 제공 해야합니다."
  }

  validation {
    condition = alltrue([
      for subnet in values(var.subnets) :
      subnet.ipv6_cidr != null && subnet.ipv4_cidr == null
      if subnet.type == "IPV6"
    ])
    error_message = "`IPV6` 타입은 IPv6 를 제공해야 합니다. "
  }
}

variable "public_ipv4_address_assignment" {
  description = <<EOF
  (선택) 공용 IPv4 주소 할당을 위한 구성. `public_ipv4_address_assignment` 블록 내용.
    (선택) `enabled` - 공용 IPv4 주소를 자동으로 요청할지 여부. Default: `false`.
  EOF
  type = object({
    enabled = optional(bool, false)
  })
  default  = {}
  nullable = false
}

variable "customer_owned_ipv4_address_assignment" {
  description = <<EOF
  (선택) 소유 IPv4 주소 할당을 위한 구성. `customer_owned_ipv4_address_assignment` 블록 내용.
    (선택) `enabled` - 소유 IPv4 주소를 자동으로 요청할지 여부. Defaults: `false`.
    (선택) `outpost` - outpost 리소스 Arn.
    (선택) `pool` - 소유 IPv4 주소 풀.
  EOF
  type = object({
    enabled = optional(bool, false)
    outpost = optional(string)
    pool    = optional(string)
  })
  default  = {}
  nullable = false
}

variable "ipv6_address_assignment" {
  description = <<EOF
  (선택) IPv6 할당을 위한 구성. `ipv6_address_assignment` 블록 내용.
    (선택) `enabled` - IPv6 주소를 자동으로 요청할지 여부. Defaults: `false`.
  EOF
  type = object({
    enabled = optional(bool, false)
  })
  default  = {}
  nullable = false
}

variable "dns_config" {
  description = <<EOF
  (선택) 서브넷 DNS 쿼리에 대한 구성. `dns_config` 블록 내용.
    (선택) `hostname_type` - 시작시 인스턴스에 할당할 호스트 이름 유형. IPv6 의 경우 `resource-name` 으로 설정해야 합니다. IPv4 의 경우 둘중 하나로 설정 가능합니다. `ip-name` or `resource-name`. Valid values are `ip-name`, `resource-name`. Defaults to `resource-name`.
    (선택) `dns_resource_name_ipv4_enabled` - DNS A 레코드를 사용하여 인스턴스 호스트 이름에 대한 DNS 쿼리에 응답할지 여부. Default: `false`.
    (선택) `dns_resource_name_ipv6_enabled` - DNS AAAA 레코드를 사용하여 인스턴스 호스트 이름에 대한 DNS 쿼리에 응답할지 여부. IPv6 의 경우 항상 `true` 입니다. Defaults: `false`.
    (선택) `dns64_enabled` - IPv6 전용 서비스가 IPv4 전용 서비스 및 네트워크와 통신할 수 있도록 dns64 활성화 여부. Defaults: `false`.
  EOF
  type = object({
    hostname_type                  = optional(string, "resource-name")
    dns_resource_name_ipv4_enabled = optional(bool, false)
    dns_resource_name_ipv6_enabled = optional(bool, false)
    dns64_enabled                  = optional(bool, false)
  })
  default  = {}
  nullable = false

  validation {
    condition     = contains(["ip-name", "resource-name"], var.dns_config.hostname_type)
    error_message = "Valid values for `hostname_type` are `ip-name` and `resource-name`."
  }
}

variable "dax_subnet_group" {
  description = <<EOF
  (Optional) DAX Subnet Group 설정. `dax_subnet_group` 블록 내용.
    (Optional) `enabled` - DAX Subnet Group 생성 여부. Default: `false`.
    (Optional) `name` - DAX Subnet Group 이름. Default: `$Name-dex-subnet-group`
    (Optional) `description` - DAX Subnet Group 설명.
  EOF
  type = object({
    enabled     = optional(bool, false)
    name        = optional(string)
    description = optional(string, "Managed by Terraform.")
  })
  default  = {}
  nullable = false
}

variable "dms_replication_subnet_group" {
  description = <<EOF
  (Optional) DMS Replication Subnet Group 설정. `dms_replication_subnet_group` 블록 내용.
    (Optional) `enabled` - DMS Replication Subnet Group 생성 여부. Default: `false`.
    (Optional) `name` - DMS Replication Subnet Group 이름. Default: `$Name-dmsreplication-subnet-group`
    (Optional) `description` - DMS Replication Subnet Group 설명.
  EOF
  type = object({
    enabled     = optional(bool, false)
    name        = optional(string)
    description = optional(string, "Managed by Terraform.")
  })
  default  = {}
  nullable = false
}

variable "docdb_subnet_group" {
  description = <<EOF
  (Optional) DocumentDB Subnet Group 설정. `docdb_subnet_group` 블록 내용.
    (Optional) `enabled` - DocumentDB Subnet Group 생성 여부. Default: `false`.
    (Optional) `name` - DocumentDB Subnet Group 이름. Default: `$Name-docdb-subnet-group`
    (Optional) `description` - The description of the DocumentDB Subnet Group.
  EOF
  type = object({
    enabled     = optional(bool, false)
    name        = optional(string)
    description = optional(string, "Managed by Terraform.")
  })
  default  = {}
  nullable = false
}

variable "elasticache_subnet_group" {
  description = <<EOF
  (Optional) ElastiCache Subnet Group 설정. `elasticache_subnet_group` 블록 내용.
    (Optional) `enabled` - ElastiCache Subnet Group 생성 여부. Default: `false`.
    (Optional) `name` - ElastiCache Subnet Group 이름. Default: `$Name-elasticache-subnet-group`
    (Optional) `description` - ElastiCache Subnet Group 설명.
  EOF
  type = object({
    enabled     = optional(bool, false)
    name        = optional(string)
    description = optional(string, "Managed by Terraform.")
  })
  default  = {}
  nullable = false
}

variable "memorydb_subnet_group" {
  description = <<EOF
  (Optional)MemoryDB Subnet Group 설정. `memorydb_subnet_group` 블록 내용.
    (Optional) `enabled` - MemoryDB Subnet Group 생성 여부. Default: `false`.
    (Optional) `name` -  MemoryDB Subnet Group 이름. `$Name-memory-subnet-group`
    (Optional) `description` - MemoryDB Subnet Group 설명.
  EOF
  type = object({
    enabled     = optional(bool, false)
    name        = optional(string)
    description = optional(string, "Managed by Terraform.")
  })
  default  = {}
  nullable = false
}

variable "neptune_subnet_group" {
  description = <<EOF
  (Optional) Neptune Subnet Group 설정. `neptune_subnet_group` 블록 내용.
    (Optional) `enabled` - Neptune Subnet Group 생성 여부. Default: `false`.
    (Optional) `name` - Neptune Subnet Group 이름. `$Name-neptune-subnet-group`
    (Optional) `description` - Neptune Subnet Group 설명.
  EOF
  type = object({
    enabled     = optional(bool, false)
    name        = optional(string)
    description = optional(string, "Managed by Terraform.")
  })
  default  = {}
  nullable = false
}

variable "rds_subnet_group" {
  description = <<EOF
  (Optional) RDS Subnet Group 설정. `rds_subnet_group` 블록 내용.
    (Optional) `enabled` - RDS Subnet Group 생성 여부. Default: `false`.
    (Optional) `name` - RDS Subnet Group 이름. `$Name-rds-subnet-group`
    (Optional) `description` - RDS Subnet Group 설명.
  EOF
  type = object({
    enabled     = optional(bool, false)
    name        = optional(string)
    description = optional(string, "Managed by Terraform.")
  })
  default  = {}
  nullable = false
}

variable "redshift_subnet_group" {
  description = <<EOF
  (Optional) Redshift Subnet Group 설정. `redshift_subnet_group` 블록 내용.
    (Optional) `enabled` - Redshift Subnet Group 생성 여부. Defaults to `false`.
    (Optional) `name` - Redshift Subnet Group 이름. `$Name-redshift-subnet-group`
    (Optional) `description` - Redshift Subnet Group 설명.
  EOF
  type = object({
    enabled     = optional(bool, false)
    name        = optional(string)
    description = optional(string, "Managed by Terraform.")
  })
  default  = {}
  nullable = false
}

variable "tags" {
  description = "(선택) 리소스 태그 내용"
  type        = map(string)
  default     = {}
}
