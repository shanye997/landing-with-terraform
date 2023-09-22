<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_db_instance.instance](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_dts_consumer_channel.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dts_consumer_channel) | resource |
| [alicloud_dts_subscription_job.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dts_subscription_job) | resource |
| [alicloud_db_instance_classes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_instance_classes) | data source |
| [alicloud_db_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_consumer_group_password_var"></a> [consumer\_group\_password\_var](#input\_consumer\_group\_password\_var) | n/a | `string` | `"tfexample123"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tftest470"` | no |
| <a name="input_region_id"></a> [region\_id](#input\_region\_id) | n/a | `string` | `"cn-hangzhou"` | no |
<!-- END_TF_DOCS -->    