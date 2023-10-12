<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_oos_patch_baseline.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/oos_patch_baseline) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_approval_rules_var"></a> [approval\_rules\_var](#input\_approval\_rules\_var) | n/a | `string` | `"{\\\"PatchRules\\\":[{\\\"PatchFilterGroup\\\":[{\\\"Key\\\":\\\"PatchSet\\\",\\\"Values\\\":[\\\"OS\\\"]},{\\\"Key\\\":\\\"ProductFamily\\\",\\\"Values\\\":[\\\"Windows\\\"]},{\\\"Key\\\":\\\"Product\\\",\\\"Values\\\":[\\\"Windows 10\\\",\\\"Windows 7\\\"]},{\\\"Key\\\":\\\"Classification\\\",\\\"Values\\\":[\\\"Security Updates\\\",\\\"Updates\\\",\\\"Update Rollups\\\",\\\"Critical Updates\\\"]},{\\\"Key\\\":\\\"Severity\\\",\\\"Values\\\":[\\\"Critical\\\",\\\"Important\\\",\\\"Moderate\\\"]}],\\\"ApproveAfterDays\\\":7,\\\"EnableNonSecurity\\\":true,\\\"ComplianceLevel\\\":\\\"Medium\\\"}]}"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouoospatchbaseline31576"` | no |
| <a name="input_rejected_patches_action_var"></a> [rejected\_patches\_action\_var](#input\_rejected\_patches\_action\_var) | n/a | `string` | `"BLOCK"` | no |
<!-- END_TF_DOCS -->    