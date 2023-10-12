<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_express_connect_virtual_border_router.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/express_connect_virtual_border_router) | resource |
| [alicloud_vpc_bgp_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc_bgp_group) | resource |
| [alicloud_vpc_bgp_peer.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc_bgp_peer) | resource |
| [alicloud_express_connect_physical_connections.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/express_connect_physical_connections) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bfd_multi_hop_var"></a> [bfd\_multi\_hop\_var](#input\_bfd\_multi\_hop\_var) | n/a | `string` | `"10"` | no |
| <a name="input_enable_bfd_var"></a> [enable\_bfd\_var](#input\_enable\_bfd\_var) | n/a | `string` | `"true"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouvpcbgppeer38337"` | no |
| <a name="input_peer_ip_address_var"></a> [peer\_ip\_address\_var](#input\_peer\_ip\_address\_var) | n/a | `string` | `"1.1.1.1"` | no |
<!-- END_TF_DOCS -->    