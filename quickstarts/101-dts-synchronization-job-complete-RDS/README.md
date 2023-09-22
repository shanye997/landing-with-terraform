<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_db_instance.source](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_db_instance.target](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_dts_synchronization_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dts_synchronization_instance) | resource |
| [alicloud_dts_synchronization_job.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dts_synchronization_job) | resource |
| [alicloud_rds_account.source_account](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/rds_account) | resource |
| [alicloud_rds_account.target_account](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/rds_account) | resource |
| [alicloud_db_instance_classes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_instance_classes) | data source |
| [alicloud_db_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_list_var"></a> [db\_list\_var](#input\_db\_list\_var) | n/a | `string` | `"{\\\"test_database\\\":{\\\"name\\\":\\\"test_database\\\",\\\"all\\\":true,\\\"state\\\":\\\"normal\\\"}}"` | no |
| <a name="input_dts_job_name_var"></a> [dts\_job\_name\_var](#input\_dts\_job\_name\_var) | n/a | `string` | `"tf-exampleCase"` | no |
| <a name="input_region_id"></a> [region\_id](#input\_region\_id) | n/a | `string` | `"cn-hangzhou"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"Synchronizing"` | no |
<!-- END_TF_DOCS -->    