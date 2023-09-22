<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_quotas_quota_alarm.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/quotas_quota_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_quota_alarm_name_var"></a> [quota\_alarm\_name\_var](#input\_quota\_alarm\_name\_var) | n/a | `string` | `"tf-exampleQuotasQuotaAlarmTest2038727"` | no |
| <a name="input_threshold_percent_var"></a> [threshold\_percent\_var](#input\_threshold\_percent\_var) | n/a | `string` | `"20"` | no |
| <a name="input_threshold_type_var"></a> [threshold\_type\_var](#input\_threshold\_type\_var) | n/a | `string` | `"usable"` | no |
| <a name="input_threshold_var"></a> [threshold\_var](#input\_threshold\_var) | n/a | `string` | `"100"` | no |
| <a name="input_web_hook_var"></a> [web\_hook\_var](#input\_web\_hook\_var) | n/a | `string` | `"https://oapi.dingtalk.com/robot/send?access_token=0a09bd617f43d07e8607b258c6cdffbacf0e023f1bbe46cfeb0265127802bf43"` | no |
<!-- END_TF_DOCS -->    