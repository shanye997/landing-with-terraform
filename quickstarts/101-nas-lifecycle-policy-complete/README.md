<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_nas_file_system.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_file_system) | resource |
| [alicloud_nas_lifecycle_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_lifecycle_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lifecycle_rule_name_var"></a> [lifecycle\_rule\_name\_var](#input\_lifecycle\_rule\_name\_var) | n/a | `string` | `"DEFAULT_ATIME_30"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhounaslifecyclepolicy44135"` | no |
<!-- END_TF_DOCS -->    