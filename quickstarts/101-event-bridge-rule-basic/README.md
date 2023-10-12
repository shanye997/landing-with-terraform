<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_event_bridge_event_bus.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/event_bridge_event_bus) | resource |
| [alicloud_event_bridge_rule.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/event_bridge_rule) | resource |
| [alicloud_mns_queue.queue2](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/mns_queue) | resource |
| [alicloud_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_filter_pattern_var"></a> [filter\_pattern\_var](#input\_filter\_pattern\_var) | n/a | `string` | `"{\\\"source\\\":[\\\"crmabc.newsletter\\\"],\\\"type\\\":[\\\"UserSignUp\\\"]}"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhoueventbridgerule41225"` | no |
<!-- END_TF_DOCS -->    