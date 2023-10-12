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
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleautoprovisioninggroup-126378"` | no |
| <a name="input_total_target_capacity_var"></a> [total\_target\_capacity\_var](#input\_total\_target\_capacity\_var) | n/a | `string` | `"4"` | no |
<!-- END_TF_DOCS -->    