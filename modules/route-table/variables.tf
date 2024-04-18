variable "name" {
  description = "(필수) route table 이름."
  type        = string
  nullable    = false
}

variable "vpc_id" {
  description = "(필수) 서브넷을 생성할 VPC ID."
  type        = string
  nullable    = false
}

variable "subnets" {
  description = "(선택) route table 에 적용할 Subnet ID 리스트."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "ipv4_routes" {
  description = <<EOF
  (선택) 라우팅 테이블 IPv4 리스트 `ipv4_routes` 블록 내용.
    (필수) `destination` - 목적지 IPv4 CIDR block.
    (필수) `target` - 라우팅 테이블 타겟 설정. `target` 블록 내용.
      (필수) `type` - 라우팅 테이블 타입. 다음과 같은 타입 만 지원`CARRIER_GATEWAY`, `CORE_GATEWAY`, `EGRESS_ONLY_INTERNET_GATEWAY`, `INTERNET_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `NAT_GATEWAY`, `NETWORK_INTERFACE`, `TRANSIT_GATEWAY`, `VPC_ENDPOINT`, `VPC_PEERING_CONNECTION`.
      (필수) `id` - 타입에 대한 ID 값.
  EOF
  type = list(object({
    destination = string

    target = object({
      type = string
      id   = string
    })
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for route in var.ipv4_routes :
      contains(["CARRIER_GATEWAY", "CORE_GATEWAY", "EGRESS_ONLY_INTERNET_GATEWAY", "INTERNET_GATEWAY", "VPN_GATEWAY", "LOCAL_GATEWAY", "NAT_GATEWAY", "NETWORK_INTERFACE", "TRANSIT_GATEWAY", "VPC_ENDPOINT", "VPC_PEERING_CONNECTION"], route.target.type)
    ])
    error_message = "`type` 은 다음 설정에서만 가능 합니다. `CARRIER_GATEWAY`, `CORE_GATEWAY`, `EGRESS_ONLY_INTERNET_GATEWAY`, `INTERNET_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `NAT_GATEWAY`, `NETWORK_INTERFACE`, `TRANSIT_GATEWAY`, `VPC_ENDPOINT`, `VPC_PEERING_CONNECTION`."
  }
}

variable "ipv6_routes" {
  description = <<EOF
  (선택) 라우팅 테이블 IPv6 리스트 `ipv6_routes` 블록 내용.
    (필수) `destination` - 목적지 IPv6 CIDR block.
    (필수) `target` - 라우팅 테이블 타겟 설정. `target` 블록 내용.
      (필수) `type` - 라우팅 테이블 타입. 다음과 같은 타입 만 지원 `CARRIER_GATEWAY`, `CORE_GATEWAY`, `EGRESS_ONLY_INTERNET_GATEWAY`, `INTERNET_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `NAT_GATEWAY`, `NETWORK_INTERFACE`, `TRANSIT_GATEWAY`, `VPC_ENDPOINT`, `VPC_PEERING_CONNECTION`.
      (필수) `id` - 타입에 대한 ID 값.
  EOF
  type = list(object({
    destination = string

    target = object({
      type = string
      id   = string
    })
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for route in var.ipv6_routes :
      contains(["CARRIER_GATEWAY", "CORE_GATEWAY", "EGRESS_ONLY_INTERNET_GATEWAY", "INTERNET_GATEWAY", "VPN_GATEWAY", "LOCAL_GATEWAY", "NAT_GATEWAY", "NETWORK_INTERFACE", "TRANSIT_GATEWAY", "VPC_ENDPOINT", "VPC_PEERING_CONNECTION"], route.target.type)
    ])
    error_message = "`type` 은 다음 설정에서만 가능 합니다. `CARRIER_GATEWAY`, `CORE_GATEWAY`, `EGRESS_ONLY_INTERNET_GATEWAY`, `INTERNET_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `NAT_GATEWAY`, `NETWORK_INTERFACE`, `TRANSIT_GATEWAY`, `VPC_ENDPOINT`, `VPC_PEERING_CONNECTION`."
  }
}

variable "prefix_list_routes" {
  description = <<EOF
  (선택) 라우팅 테이블 prefix list 에 대한 리스트 `prefix_list_routes` 블록 내용.
    (필수) `name` - Prefix 이름.
    (필수) `destination` - 목적지 prefix 리스트.
    (필수) `target` - 라우팅 테이블 타겟 설정. `target` 블록 내용.
      (필수) `type` - 라우팅 테이블 타입. 다음과 같은 타입 만 지원  `CARRIER_GATEWAY`, `CORE_GATEWAY`, `EGRESS_ONLY_INTERNET_GATEWAY`, `INTERNET_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `NAT_GATEWAY`, `NETWORK_INTERFACE`, `TRANSIT_GATEWAY`, `VPC_ENDPOINT`, `VPC_PEERING_CONNECTION`.
      (필수) `id` - 타입에 대한 ID 값.
  EOF
  type = list(object({
    name        = string
    destination = string

    target = object({
      type = string
      id   = string
    })
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for route in var.prefix_list_routes :
      contains(["CARRIER_GATEWAY", "CORE_GATEWAY", "EGRESS_ONLY_INTERNET_GATEWAY", "INTERNET_GATEWAY", "VPN_GATEWAY", "LOCAL_GATEWAY", "NAT_GATEWAY", "NETWORK_INTERFACE", "TRANSIT_GATEWAY", "VPC_ENDPOINT", "VPC_PEERING_CONNECTION"], route.target.type)
    ])
    error_message = "`type` 은 다음 설정에서만 가능 합니다. `CARRIER_GATEWAY`, `CORE_GATEWAY`, `EGRESS_ONLY_INTERNET_GATEWAY`, `INTERNET_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `NAT_GATEWAY`, `NETWORK_INTERFACE`, `TRANSIT_GATEWAY`, `VPC_ENDPOINT`, `VPC_PEERING_CONNECTION`."
  }
}

variable "propagating_vpn_gateways" {
  description = "(선택) 경로를 전파할 Virtual Private Gateway ID 목록."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "tags" {
  description = "(선택) 리소스 태그 내용"
  type        = map(string)
  default     = {}
}
