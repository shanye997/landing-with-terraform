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
| <a name="input_type_var"></a> [type\_var](#input\_type\_var) | n/a | `string` | `"A"` | no |
| <a name="input_value_var"></a> [value\_var](#input\_value\_var) | n/a | `string` | `"2.2.2.${count.index}"` | no |
<!-- END_TF_DOCS -->    