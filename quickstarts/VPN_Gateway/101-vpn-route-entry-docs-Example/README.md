## Introduction

This example is used to create a `alicloud_vpn_route_entry` resource.

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_vpn_connection.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpn_connection) | resource |
| [alicloud_vpn_customer_gateway.changeCustomerGateway](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpn_customer_gateway) | resource |
| [alicloud_vpn_customer_gateway.defaultCustomerGateway](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpn_customer_gateway) | resource |
| [alicloud_vpn_route_entry.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpn_route_entry) | resource |
| [alicloud_vpn_gateways.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/vpn_gateways) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"terraform-example"` | no |
<!-- END_TF_DOCS -->
