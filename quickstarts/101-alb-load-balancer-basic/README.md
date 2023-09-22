<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_alb_load_balancer.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alb_load_balancer) | resource |
| [alicloud_vswitch.vswitch_1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_vswitch.vswitch_2](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_alb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/alb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default_1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_vswitches.default_2](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_type_var"></a> [address\_type\_var](#input\_address\_type\_var) | n/a | `string` | `"Intranet"` | no |
| <a name="input_load_balancer_edition_var"></a> [load\_balancer\_edition\_var](#input\_load\_balancer\_edition\_var) | n/a | `string` | `"Basic"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhoualbloadbalancer22501"` | no |
<!-- END_TF_DOCS -->    