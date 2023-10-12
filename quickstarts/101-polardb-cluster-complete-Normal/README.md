<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_polardb_cluster.cluster](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/polardb_cluster) | resource |
| [alicloud_polardb_cluster.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/polardb_cluster) | resource |
| [alicloud_polardb_global_database_network.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/polardb_global_database_network) | resource |
| [alicloud_vswitch.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_polardb_node_classes.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/polardb_node_classes) | data source |
| [alicloud_polardb_parameter_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/polardb_parameter_groups) | data source |
| [alicloud_polardb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/polardb_zones) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_shut_down_var"></a> [allow\_shut\_down\_var](#input\_allow\_shut\_down\_var) | n/a | `string` | `"true"` | no |
| <a name="input_auto_renew_period_var"></a> [auto\_renew\_period\_var](#input\_auto\_renew\_period\_var) | n/a | `string` | `"2"` | no |
| <a name="input_backup_retention_policy_on_cluster_deletion_var"></a> [backup\_retention\_policy\_on\_cluster\_deletion\_var](#input\_backup\_retention\_policy\_on\_cluster\_deletion\_var) | n/a | `string` | `"NONE"` | no |
| <a name="input_clone_data_point_var"></a> [clone\_data\_point\_var](#input\_clone\_data\_point\_var) | n/a | `string` | `"LATEST"` | no |
| <a name="input_creation_option_var"></a> [creation\_option\_var](#input\_creation\_option\_var) | n/a | `string` | `"CloneFromPolarDB"` | no |
| <a name="input_db_node_count_var"></a> [db\_node\_count\_var](#input\_db\_node\_count\_var) | n/a | `string` | `"2"` | no |
| <a name="input_db_node_num_var"></a> [db\_node\_num\_var](#input\_db\_node\_num\_var) | n/a | `string` | `"2"` | no |
| <a name="input_default_time_zone_var"></a> [default\_time\_zone\_var](#input\_default\_time\_zone\_var) | n/a | `string` | `"+1:00"` | no |
| <a name="input_loose_polar_log_bin_var"></a> [loose\_polar\_log\_bin\_var](#input\_loose\_polar\_log\_bin\_var) | n/a | `string` | `"ON"` | no |
| <a name="input_lower_case_table_names_var"></a> [lower\_case\_table\_names\_var](#input\_lower\_case\_table\_names\_var) | n/a | `string` | `"1"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplePolarDBClusterCreate"` | no |
| <a name="input_pay_type_var"></a> [pay\_type\_var](#input\_pay\_type\_var) | n/a | `string` | `"PostPaid"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"1"` | no |
| <a name="input_renewal_status_var"></a> [renewal\_status\_var](#input\_renewal\_status\_var) | n/a | `string` | `"AutoRenewal"` | no |
| <a name="input_scale_max_var"></a> [scale\_max\_var](#input\_scale\_max\_var) | n/a | `string` | `"3"` | no |
| <a name="input_scale_min_var"></a> [scale\_min\_var](#input\_scale\_min\_var) | n/a | `string` | `"2"` | no |
| <a name="input_scale_ro_num_max_var"></a> [scale\_ro\_num\_max\_var](#input\_scale\_ro\_num\_max\_var) | n/a | `string` | `"3"` | no |
| <a name="input_scale_ro_num_min_var"></a> [scale\_ro\_num\_min\_var](#input\_scale\_ro\_num\_min\_var) | n/a | `string` | `"2"` | no |
| <a name="input_seconds_until_auto_pause_var"></a> [seconds\_until\_auto\_pause\_var](#input\_seconds\_until\_auto\_pause\_var) | n/a | `string` | `"3660"` | no |
<!-- END_TF_DOCS -->    