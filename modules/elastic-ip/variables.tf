variable "name" {
  description = "(필수) Elastic IP 이름."
  type        = string
  nullable    = false
}

variable "instance" {
  description = <<EOF
  (선택) 인스턴스에 매칭되는 설정. 필수값 `id`. `instance` 블록 내용.
    (선택) `enabled` - 인스턴스에 EIP 를 할당 여부 `Default: false`.
    (필수) `id` - 인스턴스 ID.
  EOF
  type = object({
    id      = optional(string, null)
    enabled = optional(bool, false)
  })
  default  = {}
  nullable = false
}

variable "tags" {
  description = "(선택) 리소스 태그 내용"
  type        = map(string)
  default     = {}
}
