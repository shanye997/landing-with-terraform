<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_dts_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dts_instance) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_start_var"></a> [auto\_start\_var](#input\_auto\_start\_var) | n/a | `string` | `"true"` | no |
| <a name="input_compute_unit_var"></a> [compute\_unit\_var](#input\_compute\_unit\_var) | n/a | `string` | `"2"` | no |
| <a name="input_database_count_var"></a> [database\_count\_var](#input\_database\_count\_var) | n/a | `string` | `"1"` | no |
| <a name="input_du_var"></a> [du\_var](#input\_du\_var) | n/a | `string` | `"30"` | no |
| <a name="input_fee_type_var"></a> [fee\_type\_var](#input\_fee\_type\_var) | n/a | `string` | `"ONLY_CONFIGURATION_FEE"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"Month"` | no |
| <a name="input_sync_architecture_var"></a> [sync\_architecture\_var](#input\_sync\_architecture\_var) | n/a | `string` | `"bidirectional"` | no |
| <a name="input_used_time_var"></a> [used\_time\_var](#input\_used\_time\_var) | n/a | `string` | `"1"` | no |
<!-- END_TF_DOCS -->    