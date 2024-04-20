# elastic-ip

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
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance"></a> [instance](#input\_instance) | (선택) 인스턴스에 매칭되는 설정. 필수값 `id`. `instance` 블록 내용.<br>    (선택) `enabled` - 인스턴스에 EIP 를 할당 여부 `Default: false`.<br>    (필수) `id` - 인스턴스 ID. | <pre>object({<br>    id      = optional(string, null)<br>    enabled = optional(bool, false)<br>  })</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) Elastic IP 이름. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용 | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | elastic ip ID |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | elastic ip Ip address |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
