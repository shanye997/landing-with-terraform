<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_msc_sub_webhook.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/msc_sub_webhook) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tftest"` | no |
| <a name="input_server_url_var"></a> [server\_url\_var](#input\_server\_url\_var) | n/a | `string` | `"https://oapi.dingtalk.com/robot/send?access_token=${var.token}"` | no |
| <a name="input_token"></a> [token](#input\_token) | n/a | `string` | `""` | no |
<!-- END_TF_DOCS -->    