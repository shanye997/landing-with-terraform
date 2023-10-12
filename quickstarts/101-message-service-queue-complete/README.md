<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_message_service_queue.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/message_service_queue) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delay_seconds_var"></a> [delay\_seconds\_var](#input\_delay\_seconds\_var) | n/a | `string` | `"0"` | no |
| <a name="input_logging_enabled_var"></a> [logging\_enabled\_var](#input\_logging\_enabled\_var) | n/a | `string` | `"false"` | no |
| <a name="input_maximum_message_size_var"></a> [maximum\_message\_size\_var](#input\_maximum\_message\_size\_var) | n/a | `string` | `"65536"` | no |
| <a name="input_message_retention_period_var"></a> [message\_retention\_period\_var](#input\_message\_retention\_period\_var) | n/a | `string` | `"345600"` | no |
| <a name="input_polling_wait_seconds_var"></a> [polling\_wait\_seconds\_var](#input\_polling\_wait\_seconds\_var) | n/a | `string` | `"0"` | no |
| <a name="input_visibility_timeout_var"></a> [visibility\_timeout\_var](#input\_visibility\_timeout\_var) | n/a | `string` | `"30"` | no |
<!-- END_TF_DOCS -->    