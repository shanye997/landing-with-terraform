<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_adb_backup_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/adb_backup_policy) | resource |
| [alicloud_adb_db_cluster.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/adb_db_cluster) | resource |
| [alicloud_adb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/adb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleAdbBackupPolicy"` | no |
| <a name="input_preferred_backup_time_var"></a> [preferred\_backup\_time\_var](#input\_preferred\_backup\_time\_var) | n/a | `string` | `"17:00Z-18:00Z"` | no |
<!-- END_TF_DOCS -->    