variable "name" {
  description = "(필수) VPC 내 리소스 전체 이름 Prifix"
  type        = string
  nullable    = false
}

variable "ipv4_cidrs" {
  description = <<EOF
  (필수) IPv4 CIDR 리스트.
    (선택) `type` - CIDR type `MANUAL` and `IPAM_POOL`. Default: `MANUAL`.
    (선택) `cidr` - VPC CIDR block between /16 and /28.
    (선택) `ipam_pool` - IPAM Pool 을 이용하여 CIDR 할당 
      (필수) `id` - IPAM pool ID.
      (선택) `netmask_length` - IPAM pool netmask.
  EOF
  type = list(object({
    type = optional(string, "MANUAL")
    cidr = optional(string)
    ipam_pool = optional(object({
      id             = string
      netmask_length = optional(number)
    }))
  }))
  default  = []
  nullable = false

  validation {
    condition     = length(var.ipv4_cidrs) > 0
    error_message = "CIDR 이 1개이상 필요합니다."
  }
  validation {
    condition = alltrue([
      for ipv4_cidr in var.ipv4_cidrs :
      contains(["MANUAL", "IPAM_POOL"], ipv4_cidr.type)
    ])
    error_message = "`type`값에 다음과 같은 설정을 해야합니다. `MANUAL` or `IPAM_POOL`."
  }
}

variable "ipv6_cidrs" {
  description = <<EOF
  (필수) IPv6s CIDR 리스트.
    (선택) `type` - CIDR type `AMAZON` and `IPAM_POOL`. Default: `AMAZON`.
    (선택) `amazon` - VPC에 사용할 Amazon 제공 IPv6 CIDR 을 가져오기 위한 구성. `type` 이 `AMAZON` 일때만 사용됩니다. `amazon` 블록 내용.
      (선택) `network_border_group` - 네트워크 경계 그룹의 이름 입니다. Defaults: VPC 지역 이름.
    (선택) `ipam_pool` - IPAM Pool 을 이용하여 CIDR 할당 
      (필수) `id` - IPAM pool ID.
      (선택) `cidr` - VPC CIDR 블록. Required if `netmask_length` 가 설정 되지 않았고 `allocation_default_netmask` 설정 되지 않았을 경우 필수.
      (선택) `netmask_length` - IPAM pool netmask.
  EOF
  type = list(object({
    type = optional(string, "AMAZON")
    amazon = optional(object({
      network_border_group = optional(string)
    }), {})
    ipam_pool = optional(object({
      id             = string
      cidr           = optional(string)
      netmask_length = optional(number)
    }))
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for ipv6_cidr in var.ipv6_cidrs :
      contains(["AMAZON", "IPAM_POOL"], ipv6_cidr.type)
    ])
    error_message = "`type` 값에 다음과 같은 설정을 해야합니다. `AMAZON` or `IPAM_POOL`."
  }
}

variable "tenancy" {
  description = <<EOF
  (선택) 인스턴스에 대한 tenancy 옵션. `default` or `dedicated`. Default: `default`.
    `default` - 인스턴스 시작시 지정된 인스턴스 tenancy 속성을 사용하도록 보장한다.
    `dedicated` - 인스턴스 생성시 전용 tenancy 를 보장하고 인스턴스 시간당 $2 요금이 포함된다.
  EOF
  type        = string
  default     = "default"
  nullable    = false

  validation {
    condition     = contains(["default", "dedicated"], var.tenancy)
    error_message = "다음값을 입력해야 합니다. `default` or `dedicated`."
  }
}

variable "network_address_usage_metrics_enabled" {
  description = "(선택) VPC NAU (Network Address Usage) 지표 활성화 여부. Defaults: `false`."
  type        = bool
  default     = false
  nullable    = false
}

variable "dns_hostnames_enabled" {
  description = "(선택) 인스턴스 시작시 퍼블릭IP 주소에 해당하는 퍼블릭DNS 호스트이름을 수신할지 여부. Default: `false`."
  type        = bool
  default     = false
  nullable    = false
}

variable "dns_resolution_enabled" {
  description = "(선택) Amazon DNS서버를 통한 DNS 확인이 VPC에 대해 지원하는지 여부. Default: `true`."
  type        = bool
  default     = true
  nullable    = false
}

variable "internet_gateway" {
  description = <<EOF
  (필수) VPC Internet Gateway 설정값 입니다. `internet_gateway` 블록 내용.
    (선택) `enabled` - Internet Gateway 생성 할지에 대한 여부. Defaults: `true`.
    (선택) `name` - Internet Gateway 이름 입니다. Defaults: `VPC`-igw.
  EOF
  type = object({
    enabled = optional(bool, true)
    name    = optional(string)
  })
  default  = {}
  nullable = false
}

variable "vpn_gateway" {
  description = <<EOF
  (필수) Site-to-Site VPN 설정값 입니다. `vpn_gateway` 블록내용.
    (선택) `enabled` - VPN Gateway 을 생성할지에 대한 여부. Defaults; `false`.
    (선택) `name` - VPN Gateway 이름 입니다. Default: `VPC`-vgw.
    (선택) `asn` - Autonomous System Number (ASN). Defaults: `64512`.
  EOF
  type = object({
    enabled = optional(bool, false)
    name    = optional(string)
    asn     = optional(number, 64512)
  })
  default  = {}
  nullable = false

  validation {
    condition = anytrue([
      var.vpn_gateway.asn >= 64512 && var.vpn_gateway.asn <= 65534,
      var.vpn_gateway.asn >= 4200000000 && var.vpn_gateway.asn <= 4294967294,
    ])
    error_message = "`asn` 는 `64512` - `65534` or `4200000000` - `4294967294` 사이에 설정 해야합니다."
  }
}

variable "tags" {
  description = "(선택) 리소스 태그 내용"
  type        = map(string)
  default     = {}
}
