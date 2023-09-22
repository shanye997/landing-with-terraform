<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_kms_network_rule.networkRule1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_network_rule) | resource |
| [alicloud_kms_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_control_rules_var"></a> [access\_control\_rules\_var](#input\_access\_control\_rules\_var) | n/a | `string` | `"{\\\"NetworkRules\\\":[\\\"alicloud_kms_network_rule.networkRule1.network_rule_name\\\"]}"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhoukmspolicy50826"` | no |
<!-- END_TF_DOCS -->    