<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_alidns_address_pool.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alidns_address_pool) | resource |
| [alicloud_alidns_gtm_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alidns_gtm_instance) | resource |
| [alicloud_alidns_monitor_config.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alidns_monitor_config) | resource |
| [alicloud_cms_alarm_contact_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cms_alarm_contact_group) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | n/a | `string` | `""` | no |
| <a name="input_evaluation_count_var"></a> [evaluation\_count\_var](#input\_evaluation\_count\_var) | n/a | `string` | `"1"` | no |
| <a name="input_interval_var"></a> [interval\_var](#input\_interval\_var) | n/a | `string` | `"60"` | no |
| <a name="input_monitor_extend_info_var"></a> [monitor\_extend\_info\_var](#input\_monitor\_extend\_info\_var) | n/a | `string` | `"{\\\"failureRate\\\":50,\\\"port\\\":80}"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example5450"` | no |
| <a name="input_protocol_type_var"></a> [protocol\_type\_var](#input\_protocol\_type\_var) | n/a | `string` | `"TCP"` | no |
| <a name="input_timeout_var"></a> [timeout\_var](#input\_timeout\_var) | n/a | `string` | `"5000"` | no |
<!-- END_TF_DOCS -->    