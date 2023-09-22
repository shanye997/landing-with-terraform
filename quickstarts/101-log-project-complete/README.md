<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_log_project.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf unit test "` | no |
| <a name="input_policy_var"></a> [policy\_var](#input\_policy\_var) | n/a | `string` | `"{\\\"Version\\\":\\\"1\\\",\\\"Statement\\\":[{\\\"Resource\\\":\\\"acs:log:*:*:project/exampleproject/*\\\",\\\"Effect\\\":\\\"Deny\\\",\\\"Action\\\":[\\\"log:PostLogStoreLogs\\\"],\\\"Condition\\\":{\\\"StringNotLike\\\":{\\\"acs:SourceVpc\\\":[\\\"vpc-*\\\"]}}}]}"` | no |
<!-- END_TF_DOCS -->    