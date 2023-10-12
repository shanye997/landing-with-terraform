<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_resource_manager_control_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/resource_manager_control_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouresourcemanagercontrolpolicy16155"` | no |
| <a name="input_policy_document_var"></a> [policy\_document\_var](#input\_policy\_document\_var) | n/a | `string` | `"{\\\"Version\\\":\\\"1\\\",\\\"Statement\\\":[{\\\"Effect\\\":\\\"Deny\\\",\\\"Action\\\":[\\\"ram:UpdateRole\\\",\\\"ram:DeleteRole\\\",\\\"ram:AttachPolicyToRole\\\",\\\"ram:DetachPolicyFromRole\\\"],\\\"Resource\\\":\\\"acs:ram:*:*:role/ResourceDirectoryAccountAccessRole\\\"}]}"` | no |
<!-- END_TF_DOCS -->    