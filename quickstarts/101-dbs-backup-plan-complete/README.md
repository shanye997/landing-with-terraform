<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_db_account_privilege.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_account_privilege) | resource |
| [alicloud_db_database.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_database) | resource |
| [alicloud_db_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_dbs_backup_plan.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dbs_backup_plan) | resource |
| [alicloud_rds_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/rds_account) | resource |
| [alicloud_vswitch.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_db_instance_classes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_instance_classes) | data source |
| [alicloud_db_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_zones) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_region"></a> [database\_region](#input\_database\_region) | n/a | `string` | `"cn-hangzhou"` | no |
| <a name="input_instance_type_var"></a> [instance\_type\_var](#input\_instance\_type\_var) | n/a | `string` | `"RDS"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhoudbsbackupplan33075"` | no |
| <a name="input_source_endpoint_region"></a> [source\_endpoint\_region](#input\_source\_endpoint\_region) | n/a | `string` | `"cn-hangzhou"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"running"` | no |
| <a name="input_storage_region"></a> [storage\_region](#input\_storage\_region) | n/a | `string` | `"cn-hangzhou"` | no |
<!-- END_TF_DOCS -->    