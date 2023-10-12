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
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_slb_load_balancer.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_load_balancer) | resource |
| [alicloud_vpc_traffic_mirror_filter.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc_traffic_mirror_filter) | resource |
| [alicloud_vpc_traffic_mirror_session.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc_traffic_mirror_session) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example-vpctrafficmirrorsession-32189"` | no |
| <a name="input_priority_var"></a> [priority\_var](#input\_priority\_var) | n/a | `string` | `"2"` | no |
| <a name="input_traffic_mirror_target_type_var"></a> [traffic\_mirror\_target\_type\_var](#input\_traffic\_mirror\_target\_type\_var) | n/a | `string` | `"SLB"` | no |
<!-- END_TF_DOCS -->    