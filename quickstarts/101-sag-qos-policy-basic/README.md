<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_sag_qos.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/sag_qos) | resource |
| [alicloud_sag_qos_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/sag_qos_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dest_cidr_var"></a> [dest\_cidr\_var](#input\_dest\_cidr\_var) | n/a | `string` | `"10.10.0.0/24"` | no |
| <a name="input_dest_port_range_var"></a> [dest\_port\_range\_var](#input\_dest\_port\_range\_var) | n/a | `string` | `"-1/-1"` | no |
| <a name="input_ip_protocol_var"></a> [ip\_protocol\_var](#input\_ip\_protocol\_var) | n/a | `string` | `"ALL"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-testQosPolicy2023-09-22"` | no |
| <a name="input_priority_var"></a> [priority\_var](#input\_priority\_var) | n/a | `string` | `"1"` | no |
| <a name="input_source_cidr_var"></a> [source\_cidr\_var](#input\_source\_cidr\_var) | n/a | `string` | `"192.168.0.0/24"` | no |
| <a name="input_source_port_range_var"></a> [source\_port\_range\_var](#input\_source\_port\_range\_var) | n/a | `string` | `"-1/-1"` | no |
<!-- END_TF_DOCS -->    