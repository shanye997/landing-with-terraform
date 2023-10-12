<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_dts_synchronization_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dts_synchronization_instance) | resource |
| [alicloud_dts_synchronization_job.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dts_synchronization_job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_list_var"></a> [db\_list\_var](#input\_db\_list\_var) | n/a | `string` | `"{\\\"tfaccountpri_0\\\":{\\\"name\\\":\\\"tfaccountpri_0\\\",\\\"all\\\":true,\\\"state\\\":\\\"normal\\\"}}"` | no |
| <a name="input_dts_job_name_var"></a> [dts\_job\_name\_var](#input\_dts\_job\_name\_var) | n/a | `string` | `"tf-exampleCase"` | no |
| <a name="input_region_id"></a> [region\_id](#input\_region\_id) | n/a | `string` | `"cn-hangzhou"` | no |
<!-- END_TF_DOCS -->    