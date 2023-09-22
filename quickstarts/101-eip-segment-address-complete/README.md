<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_eip_segment_address.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/eip_segment_address) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bandwidth_var"></a> [bandwidth\_var](#input\_bandwidth\_var) | n/a | `string` | `"5"` | no |
| <a name="input_eip_mask_var"></a> [eip\_mask\_var](#input\_eip\_mask\_var) | n/a | `string` | `"28"` | no |
| <a name="input_internet_charge_type_var"></a> [internet\_charge\_type\_var](#input\_internet\_charge\_type\_var) | n/a | `string` | `"PayByBandwidth"` | no |
| <a name="input_isp_var"></a> [isp\_var](#input\_isp\_var) | n/a | `string` | `"BGP"` | no |
| <a name="input_netmode_var"></a> [netmode\_var](#input\_netmode\_var) | n/a | `string` | `"public"` | no |
<!-- END_TF_DOCS -->    