<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_mse_gateway.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/mse_gateway) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delete_slb_var"></a> [delete\_slb\_var](#input\_delete\_slb\_var) | n/a | `string` | `"true"` | no |
| <a name="input_enterprise_security_group_var"></a> [enterprise\_security\_group\_var](#input\_enterprise\_security\_group\_var) | n/a | `string` | `"true"` | no |
| <a name="input_internet_slb_spec_var"></a> [internet\_slb\_spec\_var](#input\_internet\_slb\_spec\_var) | n/a | `string` | `"slb.s2.small"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhoumsegateway62656"` | no |
| <a name="input_slb_spec_var"></a> [slb\_spec\_var](#input\_slb\_spec\_var) | n/a | `string` | `"slb.s2.small"` | no |
<!-- END_TF_DOCS -->    