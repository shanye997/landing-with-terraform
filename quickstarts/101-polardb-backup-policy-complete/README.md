<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_polardb_backup_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/polardb_backup_policy) | resource |
| [alicloud_polardb_cluster.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/polardb_cluster) | resource |
| [alicloud_vswitch.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_polardb_node_classes.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/polardb_node_classes) | data source |
| [alicloud_polardb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/polardb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_frequency_var"></a> [backup\_frequency\_var](#input\_backup\_frequency\_var) | n/a | `string` | `"Normal"` | no |
| <a name="input_backup_retention_policy_on_cluster_deletion_var"></a> [backup\_retention\_policy\_on\_cluster\_deletion\_var](#input\_backup\_retention\_policy\_on\_cluster\_deletion\_var) | n/a | `string` | `"LATEST"` | no |
| <a name="input_data_level1_backup_frequency_var"></a> [data\_level1\_backup\_frequency\_var](#input\_data\_level1\_backup\_frequency\_var) | n/a | `string` | `"Normal"` | no |
| <a name="input_data_level1_backup_retention_period_var"></a> [data\_level1\_backup\_retention\_period\_var](#input\_data\_level1\_backup\_retention\_period\_var) | n/a | `string` | `"7"` | no |
| <a name="input_data_level1_backup_time_var"></a> [data\_level1\_backup\_time\_var](#input\_data\_level1\_backup\_time\_var) | n/a | `string` | `"10:00Z-11:00Z"` | no |
| <a name="input_data_level2_backup_another_region_region_var"></a> [data\_level2\_backup\_another\_region\_region\_var](#input\_data\_level2\_backup\_another\_region\_region\_var) | n/a | `string` | `"cn-beijing"` | no |
| <a name="input_data_level2_backup_another_region_retention_period_var"></a> [data\_level2\_backup\_another\_region\_retention\_period\_var](#input\_data\_level2\_backup\_another\_region\_retention\_period\_var) | n/a | `string` | `"30"` | no |
| <a name="input_data_level2_backup_retention_period_var"></a> [data\_level2\_backup\_retention\_period\_var](#input\_data\_level2\_backup\_retention\_period\_var) | n/a | `string` | `"30"` | no |
| <a name="input_log_backup_another_region_region_var"></a> [log\_backup\_another\_region\_region\_var](#input\_log\_backup\_another\_region\_region\_var) | n/a | `string` | `"cn-beijing"` | no |
| <a name="input_log_backup_another_region_retention_period_var"></a> [log\_backup\_another\_region\_retention\_period\_var](#input\_log\_backup\_another\_region\_retention\_period\_var) | n/a | `string` | `"32"` | no |
| <a name="input_log_backup_retention_period_var"></a> [log\_backup\_retention\_period\_var](#input\_log\_backup\_retention\_period\_var) | n/a | `string` | `"4"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplePolarDBNewBackupPolicy"` | no |
| <a name="input_preferred_backup_time_var"></a> [preferred\_backup\_time\_var](#input\_preferred\_backup\_time\_var) | n/a | `string` | `"10:00Z-11:00Z"` | no |
<!-- END_TF_DOCS -->    