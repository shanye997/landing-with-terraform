<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_message_service_subscription.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/message_service_subscription) | resource |
| [alicloud_message_service_topic.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/message_service_topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleMessageServiceSubscription-name24211"` | no |
| <a name="input_notify_strategy_var"></a> [notify\_strategy\_var](#input\_notify\_strategy\_var) | n/a | `string` | `"BACKOFF_RETRY"` | no |
<!-- END_TF_DOCS -->    