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
| <a name="input_bandwidth_var"></a> [bandwidth\_var](#input\_bandwidth\_var) | n/a | `string` | `"200"` | no |
| <a name="input_circuit_code_var"></a> [circuit\_code\_var](#input\_circuit\_code\_var) | n/a | `string` | `"tf-example-hM7XVPPmgiQkbPNgaQtqqGzX"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-example-aoMEQnZ9PgEgzHjEV69O21rp"` | no |
| <a name="input_detect_multiplier_var"></a> [detect\_multiplier\_var](#input\_detect\_multiplier\_var) | n/a | `string` | `"10"` | no |
| <a name="input_enable_ipv6_var"></a> [enable\_ipv6\_var](#input\_enable\_ipv6\_var) | n/a | `string` | `"false"` | no |
| <a name="input_local_gateway_ip_var"></a> [local\_gateway\_ip\_var](#input\_local\_gateway\_ip\_var) | n/a | `string` | `"192.168.0.11"` | no |
| <a name="input_min_rx_interval_var"></a> [min\_rx\_interval\_var](#input\_min\_rx\_interval\_var) | n/a | `string` | `"300"` | no |
| <a name="input_min_tx_interval_var"></a> [min\_tx\_interval\_var](#input\_min\_tx\_interval\_var) | n/a | `string` | `"300"` | no |
| <a name="input_peer_gateway_ip_var"></a> [peer\_gateway\_ip\_var](#input\_peer\_gateway\_ip\_var) | n/a | `string` | `"192.168.0.12"` | no |
| <a name="input_peering_subnet_mask_var"></a> [peering\_subnet\_mask\_var](#input\_peering\_subnet\_mask\_var) | n/a | `string` | `"255.255.255.0"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"active"` | no |
| <a name="input_virtual_border_router_name_var"></a> [virtual\_border\_router\_name\_var](#input\_virtual\_border\_router\_name\_var) | n/a | `string` | `"tf-example-MImKNETo3qwDBwnHVW3UUB8Y"` | no |
| <a name="input_vlan_id_var"></a> [vlan\_id\_var](#input\_vlan\_id\_var) | n/a | `string` | `"1217"` | no |
<!-- END_TF_DOCS -->    