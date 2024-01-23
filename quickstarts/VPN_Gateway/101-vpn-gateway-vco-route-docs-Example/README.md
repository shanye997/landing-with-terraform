<!-- BEGIN_TF_DOCS -->
## Introduction

This example is used to create a `alicloud_vpn_gateway_vco_route` resource.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cen_instance.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cen_instance) | resource |
| [alicloud_cen_transit_router.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cen_transit_router) | resource |
| [alicloud_cen_transit_router_vpn_attachment.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cen_transit_router_vpn_attachment) | resource |
| [alicloud_vpn_customer_gateway.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpn_customer_gateway) | resource |
| [alicloud_vpn_gateway_vco_route.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpn_gateway_vco_route) | resource |
| [alicloud_vpn_gateway_vpn_attachment.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpn_gateway_vpn_attachment) | resource |
| [alicloud_cen_transit_router_available_resources.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/cen_transit_router_available_resources) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"terraform-example"` | no |
<!-- END_TF_DOCS -->    