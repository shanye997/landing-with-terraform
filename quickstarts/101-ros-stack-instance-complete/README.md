<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ros_stack_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ros_stack_group) | resource |
| [alicloud_ros_stack_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ros_stack_instance) | resource |
| [alicloud_ros_regions.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/ros_regions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | n/a | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhourosstackinstance35143"` | no |
| <a name="input_operation_description_var"></a> [operation\_description\_var](#input\_operation\_description\_var) | n/a | `string` | `"tf-acctest"` | no |
| <a name="input_operation_preferences_var"></a> [operation\_preferences\_var](#input\_operation\_preferences\_var) | n/a | `string` | `"{\\\"FailureToleranceCount\\\": 1,\\\"MaxConcurrentCount\\\": 2}"` | no |
| <a name="input_retain_stacks_var"></a> [retain\_stacks\_var](#input\_retain\_stacks\_var) | n/a | `string` | `"true"` | no |
| <a name="input_timeout_in_minutes_var"></a> [timeout\_in\_minutes\_var](#input\_timeout\_in\_minutes\_var) | n/a | `string` | `"60"` | no |
<!-- END_TF_DOCS -->    