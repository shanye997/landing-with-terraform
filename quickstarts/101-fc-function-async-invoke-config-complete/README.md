<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_fc_function.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/fc_function) | resource |
| [alicloud_fc_function_async_invoke_config.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/fc_function_async_invoke_config) | resource |
| [alicloud_fc_service.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/fc_service) | resource |
| [alicloud_mns_queue.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/mns_queue) | resource |
| [alicloud_mns_topic.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/mns_topic) | resource |
| [alicloud_oss_bucket.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/oss_bucket) | resource |
| [alicloud_oss_bucket_object.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/oss_bucket_object) | resource |
| [alicloud_ram_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_policy) | resource |
| [alicloud_ram_role.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role) | resource |
| [alicloud_ram_role_policy_attachment.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_maximum_event_age_in_seconds_var"></a> [maximum\_event\_age\_in\_seconds\_var](#input\_maximum\_event\_age\_in\_seconds\_var) | n/a | `string` | `"200"` | no |
| <a name="input_maximum_retry_attempts_var"></a> [maximum\_retry\_attempts\_var](#input\_maximum\_retry\_attempts\_var) | n/a | `string` | `"1"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplealicloudfcasyncinvoke-492042"` | no |
| <a name="input_stateful_invocation_var"></a> [stateful\_invocation\_var](#input\_stateful\_invocation\_var) | n/a | `string` | `"true"` | no |
<!-- END_TF_DOCS -->    