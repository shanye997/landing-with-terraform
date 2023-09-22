<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ess_alarm.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ess_alarm) | resource |
| [alicloud_ess_scaling_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ess_scaling_group) | resource |
| [alicloud_ess_scaling_rule.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ess_scaling_rule) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_vswitch.default1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_monitor_group_id_var"></a> [cloud\_monitor\_group\_id\_var](#input\_cloud\_monitor\_group\_id\_var) | n/a | `string` | `"5390371"` | no |
| <a name="input_comparison_operator_var"></a> [comparison\_operator\_var](#input\_comparison\_operator\_var) | n/a | `string` | `">="` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"Acc alarm test"` | no |
| <a name="input_enable_var"></a> [enable\_var](#input\_enable\_var) | n/a | `string` | `"true"` | no |
| <a name="input_evaluation_count_var"></a> [evaluation\_count\_var](#input\_evaluation\_count\_var) | n/a | `string` | `"2"` | no |
| <a name="input_metric_name_var"></a> [metric\_name\_var](#input\_metric\_name\_var) | n/a | `string` | `"CpuUtilization"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleEssAlarm_basic-416840"` | no |
| <a name="input_name_var"></a> [name\_var](#input\_name\_var) | n/a | `string` | `"tf-exampleEssAlarm_basic-416840"` | no |
| <a name="input_statistics_var"></a> [statistics\_var](#input\_statistics\_var) | n/a | `string` | `"Average"` | no |
| <a name="input_threshold_var"></a> [threshold\_var](#input\_threshold\_var) | n/a | `string` | `"200.3"` | no |
<!-- END_TF_DOCS -->    