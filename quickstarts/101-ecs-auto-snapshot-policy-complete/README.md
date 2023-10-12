<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ecs_auto_snapshot_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_auto_snapshot_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_copied_snapshots_retention_days_var"></a> [copied\_snapshots\_retention\_days\_var](#input\_copied\_snapshots\_retention\_days\_var) | n/a | `string` | `"2"` | no |
| <a name="input_enable_cross_region_copy_var"></a> [enable\_cross\_region\_copy\_var](#input\_enable\_cross\_region\_copy\_var) | n/a | `string` | `"true"` | no |
| <a name="input_name_var"></a> [name\_var](#input\_name\_var) | n/a | `string` | `"tf-exampleSnapshotPolicyBasic11653"` | no |
| <a name="input_retention_days_var"></a> [retention\_days\_var](#input\_retention\_days\_var) | n/a | `string` | `"-1"` | no |
<!-- END_TF_DOCS -->    