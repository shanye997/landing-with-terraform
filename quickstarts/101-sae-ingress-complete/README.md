<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_sae_application.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/sae_application) | resource |
| [alicloud_sae_ingress.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/sae_ingress) | resource |
| [alicloud_sae_namespace.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/sae_namespace) | resource |
| [alicloud_slb.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb) | resource |
| [alicloud_slb_server_certificate.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_server_certificate) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"ingress-sae-test"` | no |
| <a name="input_listener_port_var"></a> [listener\_port\_var](#input\_listener\_port\_var) | n/a | `string` | `"443"` | no |
| <a name="input_listener_protocol_var"></a> [listener\_protocol\_var](#input\_listener\_protocol\_var) | n/a | `string` | `"HTTPS"` | no |
| <a name="input_load_balance_type_var"></a> [load\_balance\_type\_var](#input\_load\_balance\_type\_var) | n/a | `string` | `"alb"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhousaeingress5078"` | no |
| <a name="input_namespace_id"></a> [namespace\_id](#input\_namespace\_id) | n/a | `string` | `"cn-hangzhou:tfexample290"` | no |
<!-- END_TF_DOCS -->    