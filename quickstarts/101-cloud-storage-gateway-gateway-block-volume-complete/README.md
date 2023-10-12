<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cloud_storage_gateway_gateway.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cloud_storage_gateway_gateway) | resource |
| [alicloud_cloud_storage_gateway_gateway_block_volume.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cloud_storage_gateway_gateway_block_volume) | resource |
| [alicloud_cloud_storage_gateway_gateway_cache_disk.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cloud_storage_gateway_gateway_cache_disk) | resource |
| [alicloud_cloud_storage_gateway_storage_bundle.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cloud_storage_gateway_storage_bundle) | resource |
| [alicloud_oss_bucket.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/oss_bucket) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_cloud_storage_gateway_stocks.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/cloud_storage_gateway_stocks) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chap_enabled_var"></a> [chap\_enabled\_var](#input\_chap\_enabled\_var) | n/a | `string` | `"false"` | no |
| <a name="input_chap_in_password_var"></a> [chap\_in\_password\_var](#input\_chap\_in\_password\_var) | n/a | `string` | `"tfexamplenmSa456"` | no |
| <a name="input_chap_in_user_var"></a> [chap\_in\_user\_var](#input\_chap\_in\_user\_var) | n/a | `string` | `"tfexamplenmSa123"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tfexamplecsvolume2433"` | no |
| <a name="input_size_var"></a> [size\_var](#input\_size\_var) | n/a | `string` | `"200"` | no |
<!-- END_TF_DOCS -->    