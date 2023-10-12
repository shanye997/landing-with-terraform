<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_log_resource_record.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_resource_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_name_var"></a> [resource\_name\_var](#input\_resource\_name\_var) | n/a | `string` | `"sls.common.user"` | no |
| <a name="input_tag_var"></a> [tag\_var](#input\_tag\_var) | n/a | `string` | `"tag name new"` | no |
| <a name="input_value_var"></a> [value\_var](#input\_value\_var) | n/a | `string` | `"{\\\"email\\\": [\\\"bbb@xxx.com\\\"], \\\"phone\\\": \\\"18888888888\\\", \\\"enabled\\\": true, \\\"user_id\\\": \\\"test_214958\\\", \\\"user_name\\\": \\\"test_name\\\", \\\"sms_enabled\\\": true, \\\"country_code\\\": \\\"86\\\", \\\"voice_enabled\\\": false}"` | no |
<!-- END_TF_DOCS -->    