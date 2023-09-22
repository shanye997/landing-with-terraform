<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_db_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_account) | resource |
| [alicloud_db_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_kms_secret.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_secret) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf_exampleKmsSecret_7606862"` | no |
| <a name="input_force_delete_without_recovery_var"></a> [force\_delete\_without\_recovery\_var](#input\_force\_delete\_without\_recovery\_var) | n/a | `string` | `"true"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf_exampleKmsSecret_7606862"` | no |
| <a name="input_secret_data_type_var"></a> [secret\_data\_type\_var](#input\_secret\_data\_type\_var) | n/a | `string` | `"text"` | no |
| <a name="input_secret_data_var"></a> [secret\_data\_var](#input\_secret\_data\_var) | n/a | `string` | `"{\\\"Accounts\\\":[{\\\"AccountName\\\":\\\"${alicloud_db_account.default.account_name}\\\",\\\"AccountPassword\\\":\\\"${alicloud_db_account.default.password}\\\"}]}"` | no |
| <a name="input_version_id_var"></a> [version\_id\_var](#input\_version\_id\_var) | n/a | `string` | `"00001"` | no |
<!-- END_TF_DOCS -->    