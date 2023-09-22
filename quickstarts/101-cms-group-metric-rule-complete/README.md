<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cms_alarm_contact_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cms_alarm_contact_group) | resource |
| [alicloud_cms_group_metric_rule.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cms_group_metric_rule) | resource |
| [alicloud_cms_monitor_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cms_monitor_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_effective_interval_var"></a> [effective\_interval\_var](#input\_effective\_interval\_var) | n/a | `string` | `"00:00-23:59"` | no |
| <a name="input_email_subject_var"></a> [email\_subject\_var](#input\_email\_subject\_var) | n/a | `string` | `"tf-example-rule-name-warning"` | no |
| <a name="input_metric_name_var"></a> [metric\_name\_var](#input\_metric\_name\_var) | n/a | `string` | `"cpu_total"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouCmsGroupMetricRuletf-example-rule-name31513"` | no |
| <a name="input_no_effective_interval_var"></a> [no\_effective\_interval\_var](#input\_no\_effective\_interval\_var) | n/a | `string` | `"00:00-05:30"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"60"` | no |
| <a name="input_silence_time_var"></a> [silence\_time\_var](#input\_silence\_time\_var) | n/a | `string` | `"86400"` | no |
| <a name="input_webhook_var"></a> [webhook\_var](#input\_webhook\_var) | n/a | `string` | `"http://www.aliyun.com"` | no |
<!-- END_TF_DOCS -->    