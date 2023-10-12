<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_log_etl.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_etl) | resource |
| [alicloud_log_project.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_project) | resource |
| [alicloud_log_store.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_store) | resource |
| [alicloud_log_store.default1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_store) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key_id_var"></a> [access\_key\_id\_var](#input\_access\_key\_id\_var) | n/a | `string` | `"access_key_id_test"` | no |
| <a name="input_access_key_secret_var"></a> [access\_key\_secret\_var](#input\_access\_key\_secret\_var) | n/a | `string` | `"access_key_secret_test"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `""` | no |
| <a name="input_display_name_var"></a> [display\_name\_var](#input\_display\_name\_var) | n/a | `string` | `"update_name"` | no |
| <a name="input_from_time_var"></a> [from\_time\_var](#input\_from\_time\_var) | n/a | `string` | `"1616486027"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplelogossshipper-813328"` | no |
| <a name="input_script_var"></a> [script\_var](#input\_script\_var) | n/a | `string` | `"e_set('aliyun','aliyun')"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"RUNNING"` | no |
| <a name="input_to_time_var"></a> [to\_time\_var](#input\_to\_time\_var) | n/a | `string` | `"1617486027"` | no |
<!-- END_TF_DOCS -->    