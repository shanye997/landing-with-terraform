<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_dcdn_waf_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dcdn_waf_policy) | resource |
| [alicloud_dcdn_waf_rule.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dcdn_waf_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_var"></a> [action\_var](#input\_action\_var) | n/a | `string` | `"monitor"` | no |
| <a name="input_cc_status_var"></a> [cc\_status\_var](#input\_cc\_status\_var) | n/a | `string` | `"on"` | no |
| <a name="input_cn_region_list_var"></a> [cn\_region\_list\_var](#input\_cn\_region\_list\_var) | n/a | `string` | `"510000,430000"` | no |
| <a name="input_effect_var"></a> [effect\_var](#input\_effect\_var) | n/a | `string` | `"rule"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf_exampleDcdnWafRule37270"` | no |
| <a name="input_other_region_list_var"></a> [other\_region\_list\_var](#input\_other\_region\_list\_var) | n/a | `string` | `"DE,GB"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"on"` | no |
| <a name="input_waf_group_ids_var"></a> [waf\_group\_ids\_var](#input\_waf\_group\_ids\_var) | n/a | `string` | `"1012"` | no |
<!-- END_TF_DOCS -->    