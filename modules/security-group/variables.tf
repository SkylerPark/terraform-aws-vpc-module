variable "name" {
  description = "(필수) security group 이름."
  type        = string
  nullable    = false
}

variable "description" {
  description = "(선택) security group 설명."
  type        = string
  default     = ""
  nullable    = false
}

variable "vpc_id" {
  description = "(필수) security group 을 생성 할 VPC ID."
  type        = string
  nullable    = false
}

variable "revoke_rules_on_delete" {
  description = "(선택) 규칙 삭제 전 수신 및 송식 규칙에 연결된 모든 보안 그룹을 취소하도록 지시하는 옵션."
  type        = bool
  default     = false
  nullable    = false
}

variable "ingress_rules" {
  description = <<EOF
  (선택) 수신 규칙 설정. `ingress_rules` 블록 내용.
    (Required) `id` - 수신에 대한 규칙 ID 값 Terraform 코드에서만 사용.
    (Optional) `description` - 규칙에 대한 설명.
    (Required) `protocol` - 규칙에 대한 프로토콜. `protocol` 이 `-1` 로 설정시 모든 프로토콜 모든 포트범위로 되며, `from_port` 와 `to_port` 값은 정의 불가.
    (Required) `from_port` - 포트 범위의 시작. TCP and UDP protocols, or an ICMP/ICMPv6 type.
    (Required) `to_port` - 포트 범위의 끝. TCP and UDP protocols, or an ICMP/ICMPv6 code.
    (Optional) `ipv4_cidrs` - IPv4 에 대한 CIDR 리스트.
    (Optional) `ipv6_cidrs` - IPv6 에 대한 CIDR 리스트.
    (Optional) `prefix_lists` - prefix ID 리스트.
    (Optional) `security_groups` - security group ID 리스트.
    (Optional) `self` - self 보안 그룹으로 추가할지 여부.
  EOF
  type = list(object({
    id              = string
    description     = optional(string, "")
    protocol        = string
    from_port       = number
    to_port         = number
    ipv4_cidrs      = optional(list(string), [])
    ipv6_cidrs      = optional(list(string), [])
    prefix_lists    = optional(list(string), [])
    security_groups = optional(list(string), [])
    self            = optional(bool, false)
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for rule in var.ingress_rules :
      anytrue([
        length(rule.ipv4_cidrs) > 0,
        length(rule.ipv6_cidrs) > 0,
        length(rule.prefix_lists) > 0,
        length(rule.security_groups) > 0,
        rule.self,
      ])
    ])
    error_message = "`ipv4_cidrs`, `ipv6_cidrs`, `prefix_lists`, `security_groups` or `self` 중 하나 이상을 지정해야 합니다."
  }
}

variable "egress_rules" {
  description = <<EOF
  (선택) 송신 규칙 설정. `ingress_rules` 블록 내용.
    (Required) `id` - 송신에 대한 규칙 ID 값 Terraform 코드에서만 사용.
    (Optional) `description` - 규칙에 대한 설명.
    (Required) `protocol` - 규칙에 대한 프로토콜. `protocol` 이 `-1` 로 설정시 모든 프로토콜 모든 포트범위로 되며, `from_port` 와 `to_port` 값은 정의 불가.
    (Required) `from_port` - 포트 범위의 시작. TCP and UDP protocols, or an ICMP/ICMPv6 type.
    (Required) `to_port` - 포트 범위의 끝. TCP and UDP protocols, or an ICMP/ICMPv6 code.
    (Optional) `ipv4_cidrs` - IPv4 에 대한 CIDR 리스트.
    (Optional) `ipv6_cidrs` - IPv6 에 대한 CIDR 리스트.
    (Optional) `prefix_lists` - prefix ID 리스트.
    (Optional) `security_groups` - security group ID 리스트.
    (Optional) `self` - self 보안 그룹으로 추가할지 여부.
  EOF
  type = list(object({
    id              = string
    description     = optional(string, "")
    protocol        = string
    from_port       = number
    to_port         = number
    ipv4_cidrs      = optional(list(string), [])
    ipv6_cidrs      = optional(list(string), [])
    prefix_lists    = optional(list(string), [])
    security_groups = optional(list(string), [])
    self            = optional(bool, false)
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for rule in var.egress_rules :
      anytrue([
        length(rule.ipv4_cidrs) > 0,
        length(rule.ipv6_cidrs) > 0,
        length(rule.prefix_lists) > 0,
        length(rule.security_groups) > 0,
        rule.self,
      ])
    ])
    error_message = "`ipv4_cidrs`, `ipv6_cidrs`, `prefix_lists`, `security_groups` or `self` 중 하나 이상을 지정해야 합니다."
  }
}

variable "tags" {
  description = "(선택) 리소스 태그 내용."
  type        = map(string)
  default     = {}
  nullable    = false
}
