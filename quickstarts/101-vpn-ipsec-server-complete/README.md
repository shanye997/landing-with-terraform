<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_vpn_ipsec_server.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpn_ipsec_server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_ip_pool_var"></a> [client\_ip\_pool\_var](#input\_client\_ip\_pool\_var) | n/a | `string` | `"10.0.1.0/24"` | no |
| <a name="input_effect_immediately_var"></a> [effect\_immediately\_var](#input\_effect\_immediately\_var) | n/a | `string` | `"true"` | no |
| <a name="input_local_subnet_var"></a> [local\_subnet\_var](#input\_local\_subnet\_var) | n/a | `string` | `"192.168.1.0/24"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouvpnipsecserver68333"` | no |
| <a name="input_psk_enabled_var"></a> [psk\_enabled\_var](#input\_psk\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_psk_var"></a> [psk\_var](#input\_psk\_var) | n/a | `string` | `"tf-testpask"` | no |
<!-- END_TF_DOCS -->    