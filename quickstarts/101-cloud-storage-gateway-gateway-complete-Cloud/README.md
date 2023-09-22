<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cloud_storage_gateway_gateway.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cloud_storage_gateway_gateway) | resource |
| [alicloud_cloud_storage_gateway_storage_bundle.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cloud_storage_gateway_storage_bundle) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"DescriptionAll"` | no |
| <a name="input_gateway_class_var"></a> [gateway\_class\_var](#input\_gateway\_class\_var) | n/a | `string` | `"Basic"` | no |
| <a name="input_gateway_name_var"></a> [gateway\_name\_var](#input\_gateway\_name\_var) | n/a | `string` | `"gateway_nameAll"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhoucloudstoragegatewaygateway11672"` | no |
| <a name="input_public_network_bandwidth_var"></a> [public\_network\_bandwidth\_var](#input\_public\_network\_bandwidth\_var) | n/a | `string` | `"20"` | no |
<!-- END_TF_DOCS -->    