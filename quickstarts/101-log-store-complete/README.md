<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_kms_key.key](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_key) | resource |
| [alicloud_log_project.foo](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_project) | resource |
| [alicloud_log_store.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_store) | resource |
| [alicloud_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_append_meta_var"></a> [append\_meta\_var](#input\_append\_meta\_var) | n/a | `string` | `"false"` | no |
| <a name="input_auto_split_var"></a> [auto\_split\_var](#input\_auto\_split\_var) | n/a | `string` | `"true"` | no |
| <a name="input_enable_web_tracking_var"></a> [enable\_web\_tracking\_var](#input\_enable\_web\_tracking\_var) | n/a | `string` | `"true"` | no |
| <a name="input_hot_ttl_var"></a> [hot\_ttl\_var](#input\_hot\_ttl\_var) | n/a | `string` | `"0"` | no |
| <a name="input_max_split_shard_count_var"></a> [max\_split\_shard\_count\_var](#input\_max\_split\_shard\_count\_var) | n/a | `string` | `"60"` | no |
| <a name="input_mode_var"></a> [mode\_var](#input\_mode\_var) | n/a | `string` | `"standard"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example-log-store-605179"` | no |
| <a name="input_retention_period_var"></a> [retention\_period\_var](#input\_retention\_period\_var) | n/a | `string` | `"30"` | no |
| <a name="input_shard_count_var"></a> [shard\_count\_var](#input\_shard\_count\_var) | n/a | `string` | `"1"` | no |
<!-- END_TF_DOCS -->    