<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_kms_key.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_key) | resource |
| [alicloud_polardb_cluster.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/polardb_cluster) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_account.current](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |
| [alicloud_polardb_node_classes.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/polardb_node_classes) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_collector_status_var"></a> [collector\_status\_var](#input\_collector\_status\_var) | n/a | `string` | `"Enable"` | no |
| <a name="input_db_node_count_var"></a> [db\_node\_count\_var](#input\_db\_node\_count\_var) | n/a | `string` | `"2"` | no |
| <a name="input_deletion_lock_var"></a> [deletion\_lock\_var](#input\_deletion\_lock\_var) | n/a | `string` | `"1"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-examplePolarDBClusterUpdate"` | no |
| <a name="input_encrypt_new_tables_var"></a> [encrypt\_new\_tables\_var](#input\_encrypt\_new\_tables\_var) | n/a | `string` | `"ON"` | no |
| <a name="input_from_time_service_var"></a> [from\_time\_service\_var](#input\_from\_time\_service\_var) | n/a | `string` | `"false"` | no |
| <a name="input_imci_switch_var"></a> [imci\_switch\_var](#input\_imci\_switch\_var) | n/a | `string` | `"ON"` | no |
| <a name="input_maintain_time_var"></a> [maintain\_time\_var](#input\_maintain\_time\_var) | n/a | `string` | `"16:00Z-17:00Z"` | no |
| <a name="input_modify_type_var"></a> [modify\_type\_var](#input\_modify\_type\_var) | n/a | `string` | `"Upgrade"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplePolarDBClusterUpdate"` | no |
| <a name="input_pay_type_var"></a> [pay\_type\_var](#input\_pay\_type\_var) | n/a | `string` | `"PostPaid"` | no |
| <a name="input_planned_end_time_var"></a> [planned\_end\_time\_var](#input\_planned\_end\_time\_var) | n/a | `string` | `"2023-09-23T17:33:34Z"` | no |
| <a name="input_planned_start_time_var"></a> [planned\_start\_time\_var](#input\_planned\_start\_time\_var) | n/a | `string` | `"2023-09-21T17:33:34Z"` | no |
| <a name="input_role_arn_var"></a> [role\_arn\_var](#input\_role\_arn\_var) | n/a | `string` | `"acs:ram::${data.alicloud_account.current.id}:role/aliyunrdsinstanceencryptiondefaultrole"` | no |
| <a name="input_sub_category_var"></a> [sub\_category\_var](#input\_sub\_category\_var) | n/a | `string` | `"Exclusive"` | no |
| <a name="input_tde_status_var"></a> [tde\_status\_var](#input\_tde\_status\_var) | n/a | `string` | `"Enabled"` | no |
| <a name="input_upgrade_type_var"></a> [upgrade\_type\_var](#input\_upgrade\_type\_var) | n/a | `string` | `"ALL"` | no |
<!-- END_TF_DOCS -->    