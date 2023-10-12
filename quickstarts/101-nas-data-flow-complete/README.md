<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_nas_data_flow.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_data_flow) | resource |
| [alicloud_nas_file_system.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_file_system) | resource |
| [alicloud_nas_fileset.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_fileset) | resource |
| [alicloud_nas_mount_target.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_mount_target) | resource |
| [alicloud_oss_bucket.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/oss_bucket) | resource |
| [alicloud_nas_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/nas_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dry_run_var"></a> [dry\_run\_var](#input\_dry\_run\_var) | n/a | `string` | `"false"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhounasdataflow2488"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"Running"` | no |
| <a name="input_throughput_var"></a> [throughput\_var](#input\_throughput\_var) | n/a | `string` | `"600"` | no |
<!-- END_TF_DOCS -->    