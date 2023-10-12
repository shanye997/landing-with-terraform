<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ots_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ots_instance) | resource |
| [alicloud_ots_table.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ots_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deviation_cell_version_in_sec_var"></a> [deviation\_cell\_version\_in\_sec\_var](#input\_deviation\_cell\_version\_in\_sec\_var) | n/a | `string` | `"86400"` | no |
| <a name="input_enable_sse_var"></a> [enable\_sse\_var](#input\_enable\_sse\_var) | n/a | `string` | `"true"` | no |
| <a name="input_max_version_var"></a> [max\_version\_var](#input\_max\_version\_var) | n/a | `string` | `"1"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"example12904"` | no |
| <a name="input_sse_key_type_var"></a> [sse\_key\_type\_var](#input\_sse\_key\_type\_var) | n/a | `string` | `"SSE_KMS_SERVICE"` | no |
| <a name="input_time_to_live_var"></a> [time\_to\_live\_var](#input\_time\_to\_live\_var) | n/a | `string` | `"-1"` | no |
<!-- END_TF_DOCS -->    