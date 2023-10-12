<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ecp_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecp_instance) | resource |
| [alicloud_ecp_key_pair.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecp_key_pair) | resource |
| [alicloud_security_group.group](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_ecp_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/ecp_instance_types) | data source |
| [alicloud_ecp_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/ecp_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-examplecn-hangzhouecpinstance54658"` | no |
| <a name="input_force_var"></a> [force\_var](#input\_force\_var) | n/a | `string` | `"true"` | no |
| <a name="input_instance_name_var"></a> [instance\_name\_var](#input\_instance\_name\_var) | n/a | `string` | `"tf-examplecn-hangzhouecpinstance54658"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouecpinstance54658"` | no |
| <a name="input_payment_type_var"></a> [payment\_type\_var](#input\_payment\_type\_var) | n/a | `string` | `"PayAsYouGo"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"Running"` | no |
| <a name="input_vnc_password_var"></a> [vnc\_password\_var](#input\_vnc\_password\_var) | n/a | `string` | `"Cp1234"` | no |
<!-- END_TF_DOCS -->    