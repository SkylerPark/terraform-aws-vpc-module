variable "name" {
  description = "(필수) NAT Gateway 리소스 이름."
  type        = string
  nullable    = false
}

variable "is_private" {
  description = "(Optional) NAT Gateway 를 비공개 혹은 공개 연결 유형. Default: `false` (public)."
  type        = bool
  default     = false
  nullable    = false
}

variable "subnet_id" {
  description = "(필수) NAT Gateway 를 생성 할 Subnet ID."
  type        = string
  nullable    = false
}

variable "primary_ip_assignment" {
  description = <<EOF
  (선택) NAT Gateway 에 기본 IP 주소 설정. `primary_ip_assignment` 블록 내용.
    (선택) `elastic_ip` - NAT Gateway 를 elastic IP 로 생성.
    (선택) `private_ip` - NAT Gateway 와 연결할 개인 IP 주소 미설정시 자동할당.
  EOF
  type = object({
    elastic_ip = optional(string)
    private_ip = optional(string)
  })
  default  = {}
  nullable = false
}

variable "secondary_ip_assignments" {
  description = <<EOF
  (선택) NAT gateway 에 보조 IP 주소를 할당하기 위한 구성. `secondary_ip_assignments` 블록 내용.
    (선택) `elastic_ip` - NAT Gateway 를 elastic IP 로 생성.
    (선택) `private_ip` - NAT Gateway 와 연결할 개인 IP 주소 미설정시 자동할당.
  EOF
  type = list(object({
    elastic_ip = optional(string)
    private_ip = optional(string)
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for assignment in var.secondary_ip_assignments : (
        assignment.elastic_ip != null || assignment.private_ip != null
      )
    ])
    error_message = "다음 설정중 하나를 제공 해야 합니다. `elastic_ip` or `private_ip`."
  }
}

variable "secondary_ip_count" {
  description = "NAT Gateway 보조 private IPv4 주소 수."
  type        = number
  default     = null
  nullable    = true

  validation {
    condition = (var.secondary_ip_count != null
      ? var.secondary_ip_count > 0 && var.secondary_ip_count < 32
      : true
    )
    error_message = "`secondary_ip_count` 는 0 부터 32까지 제한 됩니다."
  }
}

variable "tags" {
  description = "(선택) 리소스 태그 내용"
  type        = map(string)
  default     = {}
}
