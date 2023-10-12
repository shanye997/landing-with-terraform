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
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env_type_var"></a> [env\_type\_var](#input\_env\_type\_var) | n/a | `string` | `"test"` | no |
| <a name="input_export_timeout_var"></a> [export\_timeout\_var](#input\_export\_timeout\_var) | n/a | `string` | `"2000"` | no |
| <a name="input_instance_source_var"></a> [instance\_source\_var](#input\_instance\_source\_var) | n/a | `string` | `"RDS"` | no |
| <a name="input_instance_type_var"></a> [instance\_type\_var](#input\_instance\_type\_var) | n/a | `string` | `"mysql"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleDmsEnterpriseInstance6769"` | no |
| <a name="input_query_timeout_var"></a> [query\_timeout\_var](#input\_query\_timeout\_var) | n/a | `string` | `"70"` | no |
<!-- END_TF_DOCS -->    