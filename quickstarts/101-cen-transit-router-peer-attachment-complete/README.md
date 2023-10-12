<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud.bj"></a> [alicloud.bj](#provider\_alicloud.bj) | n/a |
| <a name="provider_alicloud.cn"></a> [alicloud.cn](#provider\_alicloud.cn) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cen_bandwidth_package.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_bandwidth_package) | resource |
| [alicloud_cen_bandwidth_package_attachment.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_bandwidth_package_attachment) | resource |
| [alicloud_cen_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_instance) | resource |
| [alicloud_cen_transit_router.default_0](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_transit_router) | resource |
| [alicloud_cen_transit_router.default_1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_transit_router) | resource |
| [alicloud_cen_transit_router_peer_attachment.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_transit_router_peer_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_publish_route_enabled_var"></a> [auto\_publish\_route\_enabled\_var](#input\_auto\_publish\_route\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_bandwidth_type_var"></a> [bandwidth\_type\_var](#input\_bandwidth\_type\_var) | n/a | `string` | `"BandwidthPackage"` | no |
| <a name="input_bandwidth_var"></a> [bandwidth\_var](#input\_bandwidth\_var) | n/a | `string` | `"5"` | no |
| <a name="input_dry_run_var"></a> [dry\_run\_var](#input\_dry\_run\_var) | n/a | `string` | `"false"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleCenTransitRouterPeerAttachment1245518"` | no |
| <a name="input_transit_router_attachment_description_var"></a> [transit\_router\_attachment\_description\_var](#input\_transit\_router\_attachment\_description\_var) | n/a | `string` | `"desp"` | no |
| <a name="input_transit_router_attachment_name_var"></a> [transit\_router\_attachment\_name\_var](#input\_transit\_router\_attachment\_name\_var) | n/a | `string` | `"tf-exampleCenTransitRouterPeerAttachment1245518"` | no |
<!-- END_TF_DOCS -->    