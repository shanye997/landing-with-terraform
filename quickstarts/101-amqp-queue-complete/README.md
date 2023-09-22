<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_amqp_queue.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/amqp_queue) | resource |
| [alicloud_amqp_virtual_host.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/amqp_virtual_host) | resource |
| [alicloud_amqp_instances.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/amqp_instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_expire_state_var"></a> [auto\_expire\_state\_var](#input\_auto\_expire\_state\_var) | n/a | `string` | `"10000"` | no |
| <a name="input_dead_letter_exchange_var"></a> [dead\_letter\_exchange\_var](#input\_dead\_letter\_exchange\_var) | n/a | `string` | `""` | no |
| <a name="input_dead_letter_routing_key_var"></a> [dead\_letter\_routing\_key\_var](#input\_dead\_letter\_routing\_key\_var) | n/a | `string` | `""` | no |
| <a name="input_max_length_var"></a> [max\_length\_var](#input\_max\_length\_var) | n/a | `string` | `"100"` | no |
| <a name="input_maximum_priority_var"></a> [maximum\_priority\_var](#input\_maximum\_priority\_var) | n/a | `string` | `"10"` | no |
| <a name="input_message_ttl_var"></a> [message\_ttl\_var](#input\_message\_ttl\_var) | n/a | `string` | `"100"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example-AmqpQueuebasic4495924233947507507"` | no |
<!-- END_TF_DOCS -->    