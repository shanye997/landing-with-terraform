<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_eip_address.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/eip_address) | resource |
| [alicloud_forward_entry.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/forward_entry) | resource |
| [alicloud_nat_gateway.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nat_gateway) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_external_port_var"></a> [external\_port\_var](#input\_external\_port\_var) | n/a | `string` | `"80"` | no |
| <a name="input_internal_ip_var"></a> [internal\_ip\_var](#input\_internal\_ip\_var) | n/a | `string` | `"172.16.0.3"` | no |
| <a name="input_internal_port_var"></a> [internal\_port\_var](#input\_internal\_port\_var) | n/a | `string` | `"8080"` | no |
| <a name="input_ip_protocol_var"></a> [ip\_protocol\_var](#input\_ip\_protocol\_var) | n/a | `string` | `"tcp"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleap-southeast-1forwardentry47495"` | no |
| <a name="input_number"></a> [number](#input\_number) | n/a | `string` | `"2"` | no |
<!-- END_TF_DOCS -->    