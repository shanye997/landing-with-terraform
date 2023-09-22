<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ecs_network_interface.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_network_interface) | resource |
| [alicloud_ecs_network_interface_attachment.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_network_interface_attachment) | resource |
| [alicloud_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/instance) | resource |
| [alicloud_instance.new](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/instance) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_slb_attachment.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_attachment) | resource |
| [alicloud_slb_load_balancer.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_load_balancer) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_instance_types.new](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_slb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/slb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleSlbAttachment"` | no |
| <a name="input_server_type_var"></a> [server\_type\_var](#input\_server\_type\_var) | n/a | `string` | `"ecs"` | no |
| <a name="input_weight_var"></a> [weight\_var](#input\_weight\_var) | n/a | `string` | `"90"` | no |
<!-- END_TF_DOCS -->    