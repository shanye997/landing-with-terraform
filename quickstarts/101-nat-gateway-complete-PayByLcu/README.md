<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_nat_gateway.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nat_gateway) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deletion_protection_var"></a> [deletion\_protection\_var](#input\_deletion\_protection\_var) | n/a | `string` | `"false"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-examplecn-hangzhounatgateway45309"` | no |
| <a name="input_eip_bind_mode_var"></a> [eip\_bind\_mode\_var](#input\_eip\_bind\_mode\_var) | n/a | `string` | `"NAT"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhounatgateway36690"` | no |
| <a name="input_nat_type_var"></a> [nat\_type\_var](#input\_nat\_type\_var) | n/a | `string` | `"Enhanced"` | no |
| <a name="input_network_type_var"></a> [network\_type\_var](#input\_network\_type\_var) | n/a | `string` | `"intranet"` | no |
| <a name="input_specification_var"></a> [specification\_var](#input\_specification\_var) | n/a | `string` | `"Middle"` | no |
<!-- END_TF_DOCS -->    