<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_oos_state_configuration.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/oos_state_configuration) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_configure_mode_var"></a> [configure\_mode\_var](#input\_configure\_mode\_var) | n/a | `string` | `"ApplyOnly"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-examplecn-hangzhouoosstateconfiguration14384"` | no |
| <a name="input_parameters_var"></a> [parameters\_var](#input\_parameters\_var) | n/a | `string` | `"{\\\"policy\\\": {\\\"ACS:Application\\\": {\\\"Collection\\\": \\\"Enabled\\\"}}}"` | no |
| <a name="input_schedule_expression_var"></a> [schedule\_expression\_var](#input\_schedule\_expression\_var) | n/a | `string` | `"1 hour"` | no |
| <a name="input_schedule_type_var"></a> [schedule\_type\_var](#input\_schedule\_type\_var) | n/a | `string` | `"rate"` | no |
| <a name="input_targets_var"></a> [targets\_var](#input\_targets\_var) | n/a | `string` | `"{\\\"Filters\\\": [{\\\"Type\\\": \\\"All\\\", \\\"Parameters\\\": {\\\"InstanceChargeType\\\": \\\"PrePaid\\\"}}], \\\"ResourceType\\\": \\\"ALIYUN::ECS::Instance\\\"}"` | no |
<!-- END_TF_DOCS -->    