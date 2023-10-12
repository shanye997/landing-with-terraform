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
| <a name="input_backend_limit_var"></a> [backend\_limit\_var](#input\_backend\_limit\_var) | n/a | `string` | `"0"` | no |
| <a name="input_bypass_cache_read_var"></a> [bypass\_cache\_read\_var](#input\_bypass\_cache\_read\_var) | n/a | `string` | `"true"` | no |
| <a name="input_fast_reclaim_var"></a> [fast\_reclaim\_var](#input\_fast\_reclaim\_var) | n/a | `string` | `"false"` | no |
| <a name="input_fe_limit_var"></a> [fe\_limit\_var](#input\_fe\_limit\_var) | n/a | `string` | `"0"` | no |
| <a name="input_ignore_delete_var"></a> [ignore\_delete\_var](#input\_ignore\_delete\_var) | n/a | `string` | `"false"` | no |
| <a name="input_lag_period_var"></a> [lag\_period\_var](#input\_lag\_period\_var) | n/a | `string` | `"5"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example-cloudstoragegatewaygatewayfileshare55349"` | no |
| <a name="input_nfs_v4_optimization_var"></a> [nfs\_v4\_optimization\_var](#input\_nfs\_v4\_optimization\_var) | n/a | `string` | `"true"` | no |
| <a name="input_polling_interval_var"></a> [polling\_interval\_var](#input\_polling\_interval\_var) | n/a | `string` | `"4500"` | no |
| <a name="input_remote_sync_var"></a> [remote\_sync\_var](#input\_remote\_sync\_var) | n/a | `string` | `"true"` | no |
| <a name="input_ro_client_list_var"></a> [ro\_client\_list\_var](#input\_ro\_client\_list\_var) | n/a | `string` | `"12.12.12.12"` | no |
| <a name="input_rw_client_list_var"></a> [rw\_client\_list\_var](#input\_rw\_client\_list\_var) | n/a | `string` | `"12.12.12.12"` | no |
| <a name="input_squash_var"></a> [squash\_var](#input\_squash\_var) | n/a | `string` | `"none"` | no |
| <a name="input_transfer_acceleration_var"></a> [transfer\_acceleration\_var](#input\_transfer\_acceleration\_var) | n/a | `string` | `"true"` | no |
<!-- END_TF_DOCS -->    