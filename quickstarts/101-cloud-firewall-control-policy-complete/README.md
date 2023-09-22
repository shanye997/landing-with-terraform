<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cloud_firewall_control_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cloud_firewall_control_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl_action_var"></a> [acl\_action\_var](#input\_acl\_action\_var) | n/a | `string` | `"accept"` | no |
| <a name="input_application_name_var"></a> [application\_name\_var](#input\_application\_name\_var) | n/a | `string` | `"ANY"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"放行所有流量"` | no |
| <a name="input_dest_port_group_var"></a> [dest\_port\_group\_var](#input\_dest\_port\_group\_var) | n/a | `string` | `""` | no |
| <a name="input_dest_port_type_var"></a> [dest\_port\_type\_var](#input\_dest\_port\_type\_var) | n/a | `string` | `"port"` | no |
| <a name="input_dest_port_var"></a> [dest\_port\_var](#input\_dest\_port\_var) | n/a | `string` | `"0/0"` | no |
| <a name="input_destination_type_var"></a> [destination\_type\_var](#input\_destination\_type\_var) | n/a | `string` | `"net"` | no |
| <a name="input_destination_var"></a> [destination\_var](#input\_destination\_var) | n/a | `string` | `"100.1.1.0/24"` | no |
| <a name="input_proto_var"></a> [proto\_var](#input\_proto\_var) | n/a | `string` | `"ANY"` | no |
| <a name="input_release_var"></a> [release\_var](#input\_release\_var) | n/a | `string` | `"true"` | no |
| <a name="input_source_type_var"></a> [source\_type\_var](#input\_source\_type\_var) | n/a | `string` | `"net"` | no |
| <a name="input_source_var"></a> [source\_var](#input\_source\_var) | n/a | `string` | `"1.2.3.0/24"` | no |
<!-- END_TF_DOCS -->    