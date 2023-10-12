<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ros_stack.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ros_stack) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_stack_policy_body_var"></a> [stack\_policy\_body\_var](#input\_stack\_policy\_body\_var) | n/a | `string` | `"{\\\"Statement\\\": [{\\\"Action\\\": \\\"Update:*\\\", \\\"Resource\\\": \\\"*\\\", \\\"Effect\\\": \\\"Allow\\\", \\\"Principal\\\": \\\"*\\\"}]}"` | no |
| <a name="input_template_body_var"></a> [template\_body\_var](#input\_template\_body\_var) | n/a | `string` | `"{\\\"ROSTemplateFormatVersion\\\":\\\"2015-09-01\\\", \\\"Description\\\" : \\\"模板描述信息，可用于说明模板的适用场景、架构说明等。\\\", \\\"Parameters\\\": {\\\"VpcName\\\": {\\\"Type\\\": \\\"String\\\"},\\\"InstanceType\\\": {\\\"Type\\\": \\\"String\\\"}}}"` | no |
| <a name="input_timeout_in_minutes_var"></a> [timeout\_in\_minutes\_var](#input\_timeout\_in\_minutes\_var) | n/a | `string` | `"60"` | no |
<!-- END_TF_DOCS -->    