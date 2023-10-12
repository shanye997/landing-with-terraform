<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ros_template.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ros_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"test for ros template"` | no |
| <a name="input_template_body_var"></a> [template\_body\_var](#input\_template\_body\_var) | n/a | `string` | `"{\\\"ROSTemplateFormatVersion\\\":\\\"2015-09-01\\\", \\\"Parameters\\\": {\\\"VpcName\\\": {\\\"Type\\\": \\\"String\\\"},\\\"InstanceType\\\": {\\\"Type\\\": \\\"String\\\"}}}"` | no |
| <a name="input_template_name_var"></a> [template\_name\_var](#input\_template\_name\_var) | n/a | `string` | `"tf-examplecn-hangzhouAlicloudRosTemplate44195"` | no |
<!-- END_TF_DOCS -->    