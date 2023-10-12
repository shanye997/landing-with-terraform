<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_express_connect_virtual_border_router.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/express_connect_virtual_border_router) | resource |
| [alicloud_express_connect_physical_connections.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/express_connect_physical_connections) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_local_gateway_ip_var"></a> [local\_gateway\_ip\_var](#input\_local\_gateway\_ip\_var) | n/a | `string` | `"192.168.0.11"` | no |
| <a name="input_peer_gateway_ip_var"></a> [peer\_gateway\_ip\_var](#input\_peer\_gateway\_ip\_var) | n/a | `string` | `"192.168.0.12"` | no |
| <a name="input_peering_subnet_mask_var"></a> [peering\_subnet\_mask\_var](#input\_peering\_subnet\_mask\_var) | n/a | `string` | `"255.255.255.0"` | no |
| <a name="input_vlan_id_var"></a> [vlan\_id\_var](#input\_vlan\_id\_var) | n/a | `string` | `"1217"` | no |
<!-- END_TF_DOCS -->    