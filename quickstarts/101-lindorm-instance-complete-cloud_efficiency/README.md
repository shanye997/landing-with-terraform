<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_lindorm_instance.default_2](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/lindorm_instance) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.arbitervswitchid](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_vswitches.standbyvswitchid](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_arch_version_var"></a> [arch\_version\_var](#input\_arch\_version\_var) | n/a | `string` | `"2.0"` | no |
| <a name="input_core_single_storage_var"></a> [core\_single\_storage\_var](#input\_core\_single\_storage\_var) | n/a | `string` | `"440"` | no |
| <a name="input_deletion_proection_var"></a> [deletion\_proection\_var](#input\_deletion\_proection\_var) | n/a | `string` | `"false"` | no |
| <a name="input_file_engine_node_count_var"></a> [file\_engine\_node\_count\_var](#input\_file\_engine\_node\_count\_var) | n/a | `string` | `"2"` | no |
| <a name="input_file_engine_specification_var"></a> [file\_engine\_specification\_var](#input\_file\_engine\_specification\_var) | n/a | `string` | `"lindorm.c.xlarge"` | no |
| <a name="input_instance_storage_var"></a> [instance\_storage\_var](#input\_instance\_storage\_var) | n/a | `string` | `"3200"` | no |
| <a name="input_log_num_var"></a> [log\_num\_var](#input\_log\_num\_var) | n/a | `string` | `"8"` | no |
| <a name="input_log_single_storage_var"></a> [log\_single\_storage\_var](#input\_log\_single\_storage\_var) | n/a | `string` | `"440"` | no |
| <a name="input_log_spec_var"></a> [log\_spec\_var](#input\_log\_spec\_var) | n/a | `string` | `"lindorm.sn1.2xlarge"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleLindorminstance68217"` | no |
| <a name="input_search_engine_node_count_var"></a> [search\_engine\_node\_count\_var](#input\_search\_engine\_node\_count\_var) | n/a | `string` | `"3"` | no |
| <a name="input_search_engine_specification_var"></a> [search\_engine\_specification\_var](#input\_search\_engine\_specification\_var) | n/a | `string` | `"lindorm.g.4xlarge"` | no |
| <a name="input_table_engine_node_count_var"></a> [table\_engine\_node\_count\_var](#input\_table\_engine\_node\_count\_var) | n/a | `string` | `"3"` | no |
| <a name="input_table_engine_specification_var"></a> [table\_engine\_specification\_var](#input\_table\_engine\_specification\_var) | n/a | `string` | `"lindorm.c.8xlarge"` | no |
| <a name="input_time_series_engine_node_count_var"></a> [time\_series\_engine\_node\_count\_var](#input\_time\_series\_engine\_node\_count\_var) | n/a | `string` | `"3"` | no |
| <a name="input_time_series_engine_specification_var"></a> [time\_series\_engine\_specification\_var](#input\_time\_series\_engine\_specification\_var) | n/a | `string` | `"lindorm.g.4xlarge"` | no |
<!-- END_TF_DOCS -->    