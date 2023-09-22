<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cloud_storage_gateway_gateway.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cloud_storage_gateway_gateway) | resource |
| [alicloud_cloud_storage_gateway_gateway_cache_disk.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cloud_storage_gateway_gateway_cache_disk) | resource |
| [alicloud_cloud_storage_gateway_gateway_file_share.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cloud_storage_gateway_gateway_file_share) | resource |
| [alicloud_cloud_storage_gateway_storage_bundle.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cloud_storage_gateway_storage_bundle) | resource |
| [alicloud_oss_bucket.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/oss_bucket) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_cloud_storage_gateway_stocks.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/cloud_storage_gateway_stocks) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_based_enumeration_var"></a> [access\_based\_enumeration\_var](#input\_access\_based\_enumeration\_var) | n/a | `string` | `"false"` | no |
| <a name="input_backend_limit_var"></a> [backend\_limit\_var](#input\_backend\_limit\_var) | n/a | `string` | `"0"` | no |
| <a name="input_browsable_var"></a> [browsable\_var](#input\_browsable\_var) | n/a | `string` | `"false"` | no |
| <a name="input_download_limit_var"></a> [download\_limit\_var](#input\_download\_limit\_var) | n/a | `string` | `"0"` | no |
| <a name="input_fast_reclaim_var"></a> [fast\_reclaim\_var](#input\_fast\_reclaim\_var) | n/a | `string` | `"false"` | no |
| <a name="input_fe_limit_var"></a> [fe\_limit\_var](#input\_fe\_limit\_var) | n/a | `string` | `"0"` | no |
| <a name="input_ignore_delete_var"></a> [ignore\_delete\_var](#input\_ignore\_delete\_var) | n/a | `string` | `"false"` | no |
| <a name="input_lag_period_var"></a> [lag\_period\_var](#input\_lag\_period\_var) | n/a | `string` | `"5"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example-cloudstoragegatewaygatewayfileshare4426"` | no |
| <a name="input_polling_interval_var"></a> [polling\_interval\_var](#input\_polling\_interval\_var) | n/a | `string` | `"4500"` | no |
| <a name="input_remote_sync_download_var"></a> [remote\_sync\_download\_var](#input\_remote\_sync\_download\_var) | n/a | `string` | `"false"` | no |
| <a name="input_remote_sync_var"></a> [remote\_sync\_var](#input\_remote\_sync\_var) | n/a | `string` | `"true"` | no |
| <a name="input_ro_user_list_var"></a> [ro\_user\_list\_var](#input\_ro\_user\_list\_var) | n/a | `string` | `"user1"` | no |
| <a name="input_rw_user_list_var"></a> [rw\_user\_list\_var](#input\_rw\_user\_list\_var) | n/a | `string` | `"user1"` | no |
| <a name="input_transfer_acceleration_var"></a> [transfer\_acceleration\_var](#input\_transfer\_acceleration\_var) | n/a | `string` | `"false"` | no |
| <a name="input_windows_acl_var"></a> [windows\_acl\_var](#input\_windows\_acl\_var) | n/a | `string` | `"false"` | no |
<!-- END_TF_DOCS -->    