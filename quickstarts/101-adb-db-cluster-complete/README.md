<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_adb_db_cluster.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/adb_db_cluster) | resource |
| [alicloud_adb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/adb_zones) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compute_resource_var"></a> [compute\_resource\_var](#input\_compute\_resource\_var) | n/a | `string` | `"32Core128GB"` | no |
| <a name="input_db_cluster_category_var"></a> [db\_cluster\_category\_var](#input\_db\_cluster\_category\_var) | n/a | `string` | `"MixedStorage"` | no |
| <a name="input_db_node_class_var"></a> [db\_node\_class\_var](#input\_db\_node\_class\_var) | n/a | `string` | `"C8"` | no |
| <a name="input_db_node_count_var"></a> [db\_node\_count\_var](#input\_db\_node\_count\_var) | n/a | `string` | `"1"` | no |
| <a name="input_db_node_storage_var"></a> [db\_node\_storage\_var](#input\_db\_node\_storage\_var) | n/a | `string` | `"100"` | no |
| <a name="input_elastic_io_resource_var"></a> [elastic\_io\_resource\_var](#input\_elastic\_io\_resource\_var) | n/a | `string` | `"1"` | no |
| <a name="input_maintain_time_var"></a> [maintain\_time\_var](#input\_maintain\_time\_var) | n/a | `string` | `"01:00Z-02:00Z"` | no |
| <a name="input_mode_var"></a> [mode\_var](#input\_mode\_var) | n/a | `string` | `"flexible"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouadbCluster16550"` | no |
| <a name="input_payment_type_var"></a> [payment\_type\_var](#input\_payment\_type\_var) | n/a | `string` | `"PayAsYouGo"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"1"` | no |
<!-- END_TF_DOCS -->    