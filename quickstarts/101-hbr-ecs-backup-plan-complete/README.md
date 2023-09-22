<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_hbr_ecs_backup_plan.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_ecs_backup_plan) | resource |
| [alicloud_hbr_vault.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_vault) | resource |
| [alicloud_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/instance) | resource |
| [alicloud_ram_role.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disabled_var"></a> [disabled\_var](#input\_disabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_ecs_backup_plan_name_var"></a> [ecs\_backup\_plan\_name\_var](#input\_ecs\_backup\_plan\_name\_var) | n/a | `string` | `"tf-example-hbr-backup-plan3"` | no |
| <a name="input_exclude_var"></a> [exclude\_var](#input\_exclude\_var) | n/a | `string` | `"[\\\"/home\\\", \\\"/var/\\\"]"` | no |
| <a name="input_include_var"></a> [include\_var](#input\_include\_var) | n/a | `string` | `"[\\\"/proc\\\"]"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouhbrecsbackupplan14519"` | no |
| <a name="input_options_var"></a> [options\_var](#input\_options\_var) | n/a | `string` | `"{\\\"UseVSS\\\":true}"` | no |
| <a name="input_retention_var"></a> [retention\_var](#input\_retention\_var) | n/a | `string` | `"4"` | no |
| <a name="input_schedule_var"></a> [schedule\_var](#input\_schedule\_var) | n/a | `string` | `"I|1602673264|PT2H"` | no |
| <a name="input_speed_limit_var"></a> [speed\_limit\_var](#input\_speed\_limit\_var) | n/a | `string` | `"0:24:1024"` | no |
<!-- END_TF_DOCS -->    