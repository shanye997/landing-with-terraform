<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_vpn_connection.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpn_connection) | resource |
| [alicloud_vpn_customer_gateway.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpn_customer_gateway) | resource |
| [alicloud_vpn_pbr_route_entry.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpn_pbr_route_entry) | resource |
| [alicloud_vpn_gateways.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpn_gateways) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhoupbr57780"` | no |
| <a name="input_publish_vpc_var"></a> [publish\_vpc\_var](#input\_publish\_vpc\_var) | n/a | `string` | `"false"` | no |
| <a name="input_weight_var"></a> [weight\_var](#input\_weight\_var) | n/a | `string` | `"100"` | no |
<!-- END_TF_DOCS -->    