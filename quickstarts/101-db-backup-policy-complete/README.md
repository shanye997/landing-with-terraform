<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_db_backup_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_backup_policy) | resource |
| [alicloud_db_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vswitch.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_db_instance_classes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_instance_classes) | data source |
| [alicloud_db_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_archive_backup_keep_count_var"></a> [archive\_backup\_keep\_count\_var](#input\_archive\_backup\_keep\_count\_var) | n/a | `string` | `"3"` | no |
| <a name="input_archive_backup_keep_policy_var"></a> [archive\_backup\_keep\_policy\_var](#input\_archive\_backup\_keep\_policy\_var) | n/a | `string` | `"ByWeek"` | no |
| <a name="input_archive_backup_retention_period_var"></a> [archive\_backup\_retention\_period\_var](#input\_archive\_backup\_retention\_period\_var) | n/a | `string` | `"100"` | no |
| <a name="input_backup_interval_var"></a> [backup\_interval\_var](#input\_backup\_interval\_var) | n/a | `string` | `"60"` | no |
| <a name="input_backup_retention_period_var"></a> [backup\_retention\_period\_var](#input\_backup\_retention\_period\_var) | n/a | `string` | `"830"` | no |
| <a name="input_category_var"></a> [category\_var](#input\_category\_var) | n/a | `string` | `"Standard"` | no |
| <a name="input_compress_type_var"></a> [compress\_type\_var](#input\_compress\_type\_var) | n/a | `string` | `"1"` | no |
| <a name="input_enable_backup_log_var"></a> [enable\_backup\_log\_var](#input\_enable\_backup\_log\_var) | n/a | `string` | `"true"` | no |
| <a name="input_high_space_usage_protection_var"></a> [high\_space\_usage\_protection\_var](#input\_high\_space\_usage\_protection\_var) | n/a | `string` | `"Enable"` | no |
| <a name="input_local_log_retention_hours_var"></a> [local\_log\_retention\_hours\_var](#input\_local\_log\_retention\_hours\_var) | n/a | `string` | `"48"` | no |
| <a name="input_local_log_retention_space_var"></a> [local\_log\_retention\_space\_var](#input\_local\_log\_retention\_space\_var) | n/a | `string` | `"35"` | no |
| <a name="input_log_backup_frequency_var"></a> [log\_backup\_frequency\_var](#input\_log\_backup\_frequency\_var) | n/a | `string` | `"LogInterval"` | no |
| <a name="input_log_backup_retention_period_var"></a> [log\_backup\_retention\_period\_var](#input\_log\_backup\_retention\_period\_var) | n/a | `string` | `"700"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleDBbackuppolicy"` | no |
| <a name="input_preferred_backup_time_var"></a> [preferred\_backup\_time\_var](#input\_preferred\_backup\_time\_var) | n/a | `string` | `"13:00Z-14:00Z"` | no |
| <a name="input_released_keep_policy_var"></a> [released\_keep\_policy\_var](#input\_released\_keep\_policy\_var) | n/a | `string` | `"Lastest"` | no |
<!-- END_TF_DOCS -->    