<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cr_ee_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cr_ee_instance) | resource |
| [alicloud_kms_ciphertext.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_ciphertext) | resource |
| [alicloud_kms_key.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_key) | resource |
| [alicloud_kms_keys.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/kms_keys) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example-standard-6725486"` | no |
| <a name="input_password_var"></a> [password\_var](#input\_password\_var) | n/a | `string` | `"YourPassword123"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"1"` | no |
<!-- END_TF_DOCS -->    