<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_nat_gateway.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nat_gateway) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-examplecn-hangzhounatgateway41205"` | no |
| <a name="input_name_var"></a> [name\_var](#input\_name\_var) | n/a | `string` | `"tf-examplecn-hangzhounatgateway412051"` | no |
| <a name="input_nat_type_var"></a> [nat\_type\_var](#input\_nat\_type\_var) | n/a | `string` | `"Enhanced"` | no |
| <a name="input_network_type_var"></a> [network\_type\_var](#input\_network\_type\_var) | n/a | `string` | `"internet"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"12"` | no |
| <a name="input_specification_var"></a> [specification\_var](#input\_specification\_var) | n/a | `string` | `"Middle"` | no |
<!-- END_TF_DOCS -->    