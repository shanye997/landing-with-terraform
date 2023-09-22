<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vpn_connection.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpn_connection) | resource |
| [alicloud_vpn_customer_gateway.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpn_customer_gateway) | resource |
| [alicloud_vpn_gateway.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpn_gateway) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_effect_immediately_var"></a> [effect\_immediately\_var](#input\_effect\_immediately\_var) | n/a | `string` | `"true"` | no |
| <a name="input_enable_dpd_var"></a> [enable\_dpd\_var](#input\_enable\_dpd\_var) | n/a | `string` | `"true"` | no |
| <a name="input_enable_nat_traversal_var"></a> [enable\_nat\_traversal\_var](#input\_enable\_nat\_traversal\_var) | n/a | `string` | `"true"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleVpnConnectionBaisc6787030727460479157"` | no |
<!-- END_TF_DOCS -->    