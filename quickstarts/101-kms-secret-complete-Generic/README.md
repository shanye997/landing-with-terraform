<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_kms_key.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_key) | resource |
| [alicloud_kms_secret.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf_exampleKmsSecretWithKey_5220747"` | no |
| <a name="input_force_delete_without_recovery_var"></a> [force\_delete\_without\_recovery\_var](#input\_force\_delete\_without\_recovery\_var) | n/a | `string` | `"true"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf_exampleKmsSecretWithKey_5220747"` | no |
| <a name="input_secret_data_type_var"></a> [secret\_data\_type\_var](#input\_secret\_data\_type\_var) | n/a | `string` | `"text"` | no |
| <a name="input_secret_data_var"></a> [secret\_data\_var](#input\_secret\_data\_var) | n/a | `string` | `"tf_exampleKmsSecretWithKey_5220747"` | no |
| <a name="input_version_id_var"></a> [version\_id\_var](#input\_version\_id\_var) | n/a | `string` | `"00003"` | no |
<!-- END_TF_DOCS -->    