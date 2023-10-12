<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ros_template_scratch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ros_template_scratch) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_execution_mode_var"></a> [execution\_mode\_var](#input\_execution\_mode\_var) | n/a | `string` | `"Sync"` | no |
| <a name="input_logical_id_strategy_var"></a> [logical\_id\_strategy\_var](#input\_logical\_id\_strategy\_var) | n/a | `string` | `"LongTypePrefixAndHashSuffix"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhourostemplatescratch14690"` | no |
<!-- END_TF_DOCS -->    