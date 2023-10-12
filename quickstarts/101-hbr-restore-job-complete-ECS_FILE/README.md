<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_hbr_restore_job.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_restore_job) | resource |
| [alicloud_hbr_ecs_backup_plans.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/hbr_ecs_backup_plans) | data source |
| [alicloud_hbr_snapshots.ecs_snapshots](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/hbr_snapshots) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_exclude_var"></a> [exclude\_var](#input\_exclude\_var) | n/a | `string` | `"[\\\"/home\\\", \\\"/var/\\\"]"` | no |
| <a name="input_include_var"></a> [include\_var](#input\_include\_var) | n/a | `string` | `"[\\\"/proc\\\"]"` | no |
<!-- END_TF_DOCS -->    