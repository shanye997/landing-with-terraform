<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ros_stack_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ros_stack_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"test for tf"` | no |
| <a name="input_template_body_var"></a> [template\_body\_var](#input\_template\_body\_var) | n/a | `string` | `"{\\\"ROSTemplateFormatVersion\\\":\\\"2015-09-01\\\", \\\"Parameters\\\": {\\\"VpcName\\\": {\\\"Type\\\": \\\"String\\\"},\\\"InstanceType\\\": {\\\"Type\\\": \\\"String\\\"}}}"` | no |
<!-- END_TF_DOCS -->    