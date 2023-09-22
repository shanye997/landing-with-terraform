<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cms_metric_rule_template.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cms_metric_rule_template) | resource |
| [alicloud_cms_monitor_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cms_monitor_group) | resource |
| [alicloud_cms_monitor_group_instances.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cms_monitor_group_instances) | resource |
| [alicloud_slb_load_balancer.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_load_balancer) | resource |
| [alicloud_slb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/slb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_mode_var"></a> [apply\_mode\_var](#input\_apply\_mode\_var) | n/a | `string` | `"GROUP_INSTANCE_FIRST"` | no |
| <a name="input_enable_end_time_var"></a> [enable\_end\_time\_var](#input\_enable\_end\_time\_var) | n/a | `string` | `"23"` | no |
| <a name="input_enable_start_time_var"></a> [enable\_start\_time\_var](#input\_enable\_start\_time\_var) | n/a | `string` | `"00"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhoucloudmonitorservicemetricruletemplate7809"` | no |
| <a name="input_notify_level_var"></a> [notify\_level\_var](#input\_notify\_level\_var) | n/a | `string` | `"4"` | no |
| <a name="input_silence_time_var"></a> [silence\_time\_var](#input\_silence\_time\_var) | n/a | `string` | `"8640"` | no |
| <a name="input_webhook_var"></a> [webhook\_var](#input\_webhook\_var) | n/a | `string` | `"https://www.aliyun.com"` | no |
<!-- END_TF_DOCS -->    