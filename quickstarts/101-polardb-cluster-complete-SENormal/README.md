<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_polardb_cluster.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/polardb_cluster) | resource |
| [alicloud_polardb_node_classes.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/polardb_node_classes) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_node_class_var"></a> [db\_node\_class\_var](#input\_db\_node\_class\_var) | n/a | `string` | `"polar.mysql.x2.large.c"` | no |
| <a name="input_db_node_num_var"></a> [db\_node\_num\_var](#input\_db\_node\_num\_var) | n/a | `string` | `"2"` | no |
| <a name="input_hot_standby_cluster_var"></a> [hot\_standby\_cluster\_var](#input\_hot\_standby\_cluster\_var) | n/a | `string` | `"ON"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplePolarDBClusterMult"` | no |
| <a name="input_pay_type_var"></a> [pay\_type\_var](#input\_pay\_type\_var) | n/a | `string` | `"PostPaid"` | no |
| <a name="input_proxy_class_var"></a> [proxy\_class\_var](#input\_proxy\_class\_var) | n/a | `string` | `"polar.maxscale.g2.medium.c"` | no |
| <a name="input_proxy_type_var"></a> [proxy\_type\_var](#input\_proxy\_type\_var) | n/a | `string` | `"EXCLUSIVE"` | no |
| <a name="input_storage_space_var"></a> [storage\_space\_var](#input\_storage\_space\_var) | n/a | `string` | `"30"` | no |
<!-- END_TF_DOCS -->    