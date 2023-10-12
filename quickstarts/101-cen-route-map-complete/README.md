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
| [alicloud_cen_transit_router.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_transit_router) | resource |
| [alicloud_cen_transit_router_route_table.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_transit_router_route_table) | resource |
| [alicloud_vpcs.vpc](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vpcs.vpc00](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vpcs.vpc01](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_as_path_match_mode_var"></a> [as\_path\_match\_mode\_var](#input\_as\_path\_match\_mode\_var) | n/a | `string` | `"Complete"` | no |
| <a name="input_cidr_match_mode_var"></a> [cidr\_match\_mode\_var](#input\_cidr\_match\_mode\_var) | n/a | `string` | `"Complete"` | no |
| <a name="input_community_match_mode_var"></a> [community\_match\_mode\_var](#input\_community\_match\_mode\_var) | n/a | `string` | `"Complete"` | no |
| <a name="input_community_operate_mode_var"></a> [community\_operate\_mode\_var](#input\_community\_operate\_mode\_var) | n/a | `string` | `"Replace"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-exampleresourceAlicloudCenRouteMap1132098"` | no |
| <a name="input_destination_instance_ids_reverse_match_var"></a> [destination\_instance\_ids\_reverse\_match\_var](#input\_destination\_instance\_ids\_reverse\_match\_var) | n/a | `string` | `"true"` | no |
| <a name="input_map_result_var"></a> [map\_result\_var](#input\_map\_result\_var) | n/a | `string` | `"Permit"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleresourceAlicloudCenRouteMap1132098"` | no |
| <a name="input_next_priority_var"></a> [next\_priority\_var](#input\_next\_priority\_var) | n/a | `string` | `"5"` | no |
| <a name="input_priority_var"></a> [priority\_var](#input\_priority\_var) | n/a | `string` | `"1"` | no |
| <a name="input_source_instance_ids_reverse_match_var"></a> [source\_instance\_ids\_reverse\_match\_var](#input\_source\_instance\_ids\_reverse\_match\_var) | n/a | `string` | `"true"` | no |
| <a name="input_vpc_region_00"></a> [vpc\_region\_00](#input\_vpc\_region\_00) | n/a | `string` | `"cn-hangzhou"` | no |
| <a name="input_vpc_region_01"></a> [vpc\_region\_01](#input\_vpc\_region\_01) | n/a | `string` | `"cn-shanghai"` | no |
<!-- END_TF_DOCS -->    