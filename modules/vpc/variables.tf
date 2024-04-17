variable "name" {
  description = "(필수) VPC 이름"
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

variable "tags" {
  description = "(선택) 리소스 태그 내용"
  type        = map(string)
  default     = {}
}
