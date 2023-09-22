<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_db_instance.instance](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_dts_subscription_job.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dts_subscription_job) | resource |
| [alicloud_db_instance_classes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_instance_classes) | data source |
| [alicloud_db_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_list_var"></a> [db\_list\_var](#input\_db\_list\_var) | n/a | `string` | `"{\\\"tfaccountpri_0\\\":{\\\"name\\\":\\\"tfaccountpri_0\\\",\\\"all\\\":true,\\\"state\\\":\\\"normal\\\"}}"` | no |
| <a name="input_dts_job_name_var"></a> [dts\_job\_name\_var](#input\_dts\_job\_name\_var) | n/a | `string` | `"tf-exampleCase"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampledtstf-examplecn-hangzhoudtssubscriptionjob41012"` | no |
| <a name="input_payment_duration_unit_var"></a> [payment\_duration\_unit\_var](#input\_payment\_duration\_unit\_var) | n/a | `string` | `"Month"` | no |
| <a name="input_payment_duration_var"></a> [payment\_duration\_var](#input\_payment\_duration\_var) | n/a | `string` | `"1"` | no |
| <a name="input_source_endpoint_database_name_var"></a> [source\_endpoint\_database\_name\_var](#input\_source\_endpoint\_database\_name\_var) | n/a | `string` | `"tfaccountpri_0"` | no |
| <a name="input_source_endpoint_engine_name_var"></a> [source\_endpoint\_engine\_name\_var](#input\_source\_endpoint\_engine\_name\_var) | n/a | `string` | `"MySQL"` | no |
| <a name="input_source_endpoint_instance_type_var"></a> [source\_endpoint\_instance\_type\_var](#input\_source\_endpoint\_instance\_type\_var) | n/a | `string` | `"RDS"` | no |
| <a name="input_source_endpoint_password_var"></a> [source\_endpoint\_password\_var](#input\_source\_endpoint\_password\_var) | n/a | `string` | `"Test12345"` | no |
| <a name="input_source_endpoint_region_var"></a> [source\_endpoint\_region\_var](#input\_source\_endpoint\_region\_var) | n/a | `string` | `"cn-hangzhou"` | no |
| <a name="input_source_endpoint_user_name_var"></a> [source\_endpoint\_user\_name\_var](#input\_source\_endpoint\_user\_name\_var) | n/a | `string` | `"tftestprivilege"` | no |
<!-- END_TF_DOCS -->    