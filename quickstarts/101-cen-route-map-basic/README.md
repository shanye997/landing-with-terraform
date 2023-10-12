<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |
| <a name="provider_alicloud.vpc00_region"></a> [alicloud.vpc00\_region](#provider\_alicloud.vpc00\_region) | n/a |
| <a name="provider_alicloud.vpc01_region"></a> [alicloud.vpc01\_region](#provider\_alicloud.vpc01\_region) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cen_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_instance) | resource |
| [alicloud_cen_instance_attachment.default00](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_instance_attachment) | resource |
| [alicloud_cen_instance_attachment.default01](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_instance_attachment) | resource |
| [alicloud_cen_route_map.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_route_map) | resource |
| [alicloud_vpcs.vpc](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vpcs.vpc00](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vpcs.vpc01](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_map_result_var"></a> [map\_result\_var](#input\_map\_result\_var) | n/a | `string` | `"Permit"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleresourceAlicloudCenRouteMap1132098"` | no |
| <a name="input_priority_var"></a> [priority\_var](#input\_priority\_var) | n/a | `string` | `"1"` | no |
| <a name="input_vpc_region_00"></a> [vpc\_region\_00](#input\_vpc\_region\_00) | n/a | `string` | `"cn-hangzhou"` | no |
| <a name="input_vpc_region_01"></a> [vpc\_region\_01](#input\_vpc\_region\_01) | n/a | `string` | `"cn-shanghai"` | no |
<!-- END_TF_DOCS -->    