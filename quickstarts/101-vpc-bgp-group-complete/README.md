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
| [alicloud_express_connect_physical_connections.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/express_connect_physical_connections) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_key_var"></a> [auth\_key\_var](#input\_auth\_key\_var) | n/a | `string` | `"YourPassword+12345678"` | no |
| <a name="input_is_fake_asn_var"></a> [is\_fake\_asn\_var](#input\_is\_fake\_asn\_var) | n/a | `string` | `"true"` | no |
| <a name="input_local_asn_var"></a> [local\_asn\_var](#input\_local\_asn\_var) | n/a | `string` | `"64512"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouvpcbgpgroup11631"` | no |
| <a name="input_peer_asn_var"></a> [peer\_asn\_var](#input\_peer\_asn\_var) | n/a | `string` | `"1111"` | no |
<!-- END_TF_DOCS -->    