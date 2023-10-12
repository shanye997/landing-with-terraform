<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cen_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_instance) | resource |
| [alicloud_cen_transit_router.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_transit_router) | resource |
| [alicloud_cen_transit_router_vbr_attachment.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_transit_router_vbr_attachment) | resource |
| [alicloud_express_connect_virtual_border_router.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/express_connect_virtual_border_router) | resource |
| [alicloud_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |
| [alicloud_express_connect_physical_connections.nameRegex](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/express_connect_physical_connections) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_publish_route_enabled_var"></a> [auto\_publish\_route\_enabled\_var](#input\_auto\_publish\_route\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_dry_run_var"></a> [dry\_run\_var](#input\_dry\_run\_var) | n/a | `string` | `"false"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleCenTransitRouterVbrAttachment8900804"` | no |
| <a name="input_resource_type_var"></a> [resource\_type\_var](#input\_resource\_type\_var) | n/a | `string` | `"VBR"` | no |
| <a name="input_transit_router_attachment_description_var"></a> [transit\_router\_attachment\_description\_var](#input\_transit\_router\_attachment\_description\_var) | n/a | `string` | `"desp"` | no |
| <a name="input_transit_router_attachment_name_var"></a> [transit\_router\_attachment\_name\_var](#input\_transit\_router\_attachment\_name\_var) | n/a | `string` | `"tf-exampleCenTransitRouterVbrAttachment7652123"` | no |
<!-- END_TF_DOCS -->    