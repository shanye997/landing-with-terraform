<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_db_account.account](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_account) | resource |
| [alicloud_db_instance.instance](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_dms_enterprise_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dms_enterprise_instance) | resource |
| [alicloud_account.current](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |
| [alicloud_db_instance_classes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_instance_classes) | data source |
| [alicloud_db_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_zones) | data source |
| [alicloud_dms_user_tenants.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/dms_user_tenants) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_link_name_var"></a> [data\_link\_name\_var](#input\_data\_link\_name\_var) | n/a | `string` | `""` | no |
| <a name="input_ddl_online_var"></a> [ddl\_online\_var](#input\_ddl\_online\_var) | n/a | `string` | `"0"` | no |
| <a name="input_ecs_region_var"></a> [ecs\_region\_var](#input\_ecs\_region\_var) | n/a | `string` | `"cn-hangzhou"` | no |
| <a name="input_env_type_var"></a> [env\_type\_var](#input\_env\_type\_var) | n/a | `string` | `"test"` | no |
| <a name="input_export_timeout_var"></a> [export\_timeout\_var](#input\_export\_timeout\_var) | n/a | `string` | `"2000"` | no |
| <a name="input_instance_source_var"></a> [instance\_source\_var](#input\_instance\_source\_var) | n/a | `string` | `"RDS"` | no |
| <a name="input_instance_type_var"></a> [instance\_type\_var](#input\_instance\_type\_var) | n/a | `string` | `"mysql"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleDmsEnterpriseInstance6769"` | no |
| <a name="input_query_timeout_var"></a> [query\_timeout\_var](#input\_query\_timeout\_var) | n/a | `string` | `"70"` | no |
| <a name="input_use_dsql_var"></a> [use\_dsql\_var](#input\_use\_dsql\_var) | n/a | `string` | `"0"` | no |
<!-- END_TF_DOCS -->    