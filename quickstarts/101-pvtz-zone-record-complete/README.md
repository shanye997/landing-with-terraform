<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_pvtz_zone.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/pvtz_zone) | resource |
| [alicloud_pvtz_zone_record.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/pvtz_zone_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_priority_var"></a> [priority\_var](#input\_priority\_var) | n/a | `string` | `"2"` | no |
| <a name="input_remark_var"></a> [remark\_var](#input\_remark\_var) | n/a | `string` | `"pvtz_zone_remark"` | no |
| <a name="input_rr_var"></a> [rr\_var](#input\_rr\_var) | n/a | `string` | `"www"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"DISABLE"` | no |
| <a name="input_ttl_var"></a> [ttl\_var](#input\_ttl\_var) | n/a | `string` | `"30"` | no |
| <a name="input_type_var"></a> [type\_var](#input\_type\_var) | n/a | `string` | `"A"` | no |
| <a name="input_value_var"></a> [value\_var](#input\_value\_var) | n/a | `string` | `"2.2.2.${count.index}"` | no |
<!-- END_TF_DOCS -->    