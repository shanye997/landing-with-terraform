<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_auto_provisioning_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/auto_provisioning_group) | resource |
| [alicloud_launch_template.template](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/launch_template) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_provisioning_group_name_var"></a> [auto\_provisioning\_group\_name\_var](#input\_auto\_provisioning\_group\_name\_var) | n/a | `string` | `"auto_provisioning_group"` | no |
| <a name="input_default_target_capacity_type_var"></a> [default\_target\_capacity\_type\_var](#input\_default\_target\_capacity\_type\_var) | n/a | `string` | `"Spot"` | no |
| <a name="input_excess_capacity_termination_policy_var"></a> [excess\_capacity\_termination\_policy\_var](#input\_excess\_capacity\_termination\_policy\_var) | n/a | `string` | `"no-termination"` | no |
| <a name="input_max_spot_price_var"></a> [max\_spot\_price\_var](#input\_max\_spot\_price\_var) | n/a | `string` | `"2"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleautoprovisioninggroup-126378"` | no |
| <a name="input_pay_as_you_go_target_capacity_var"></a> [pay\_as\_you\_go\_target\_capacity\_var](#input\_pay\_as\_you\_go\_target\_capacity\_var) | n/a | `string` | `"1"` | no |
| <a name="input_spot_target_capacity_var"></a> [spot\_target\_capacity\_var](#input\_spot\_target\_capacity\_var) | n/a | `string` | `"2"` | no |
| <a name="input_terminate_instances_with_expiration_var"></a> [terminate\_instances\_with\_expiration\_var](#input\_terminate\_instances\_with\_expiration\_var) | n/a | `string` | `"false"` | no |
| <a name="input_total_target_capacity_var"></a> [total\_target\_capacity\_var](#input\_total\_target\_capacity\_var) | n/a | `string` | `"4"` | no |
<!-- END_TF_DOCS -->    