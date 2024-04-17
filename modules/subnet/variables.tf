variable "vpc_id" {
  description = "(필수) 서브넷을 생성할 VPC ID."
  type        = string
  nullable    = false
}

variable "subnets" {
  description = <<EOF
  (필수) 서브넷 그룹. Each block of `subnets` 블록 내용.
    (Optional) `availability_zone` - Subnet 에 대한 가용영역.
    (Optional) `ipv4_cidr` - subnet IPV4 CIDR.
  EOF
  type = map(object({
    availability_zone = optional(string)
    ipv4_cidr         = optional(string)
  }))
  nullable = false

  validation {
    condition     = length(keys(var.subnets)) > 0
    error_message = "At least one subnet must be provided."
  }
}

variable "public_ipv4_address_assignment" {
  description = <<EOF
  (Optional) A configuration for public IPv4 address assignment. `public_ipv4_address_assignment` as defined below.
    (Optional) `enabled` - Whether to automatically request a public IPv4 address for a new network interface in this subnet. Defaults to `false`.
  EOF
  type = object({
    enabled = optional(bool, false)
  })
  default  = {}
  nullable = false
}

variable "customer_owned_ipv4_address_assignment" {
  description = <<EOF
  (Optional) A configuration for Customer-owned IPv4 address assignment. `customer_owned_ipv4_address_assignment` as defined below.
    (Optional) `enabled` - Whether to automatically request a Customer-owned IPv4 address for a new network interface in this subnet. Defaults to `false`.
    (Optional) `outpost` - The Amazon Resource Name (ARN) of the Outpost.
    (Optional) `pool` - The customer owned IPv4 address pool.
  EOF
  type = object({
    enabled = optional(bool, false)
    outpost = optional(string)
    pool    = optional(string)
  })
  default  = {}
  nullable = false
}

variable "dns_config" {
  description = <<EOF
  (Optional) A configuration for DNS queries for the subnet. `dns_config` as defined below.
    (Optional) `hostname_type` - The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID (`RESOURCE_NAME`). For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address (`IP_NAME`) or the instance ID (`RESOURCE_NAME`). Valid values are `IP_NAME`, `RESOURCE_NAME`. Defaults to `RESOURCE_NAME`.
    (Optional) `dns_resource_name_ipv4_enabled` - Whether to respond to DNS queries for instance hostnames with DNS A records. Always `false` for IPv6 only subnet. Defaults to `false`.
  EOF
  type = object({
    hostname_type                  = optional(string, "resource-name")
    dns_resource_name_ipv4_enabled = optional(bool, false)
  })
  default  = {}
  nullable = false

  validation {
    condition     = contains(["ip-name", "resource-name"], var.dns_config.hostname_type)
    error_message = "Valid values for `hostname_type` are `ip-name` and `resource-name`."
  }
}

variable "tags" {
  description = "(선택) 리소스 태그 내용"
  type        = map(string)
  default     = {}
}
