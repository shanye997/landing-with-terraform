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
| <a name="input_metric_name_var"></a> [metric\_name\_var](#input\_metric\_name\_var) | n/a | `string` | `"CpuUtilization"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleEssAlarm_basic-416840"` | no |
| <a name="input_threshold_var"></a> [threshold\_var](#input\_threshold\_var) | n/a | `string` | `"200.3"` | no |
<!-- END_TF_DOCS -->    