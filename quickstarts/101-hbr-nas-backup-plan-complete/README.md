<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_hbr_nas_backup_plan.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_nas_backup_plan) | resource |
| [alicloud_hbr_vault.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_vault) | resource |
| [alicloud_nas_file_system.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_file_system) | resource |
| [alicloud_ram_role.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role) | resource |
| [alicloud_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disabled_var"></a> [disabled\_var](#input\_disabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouhbrnasbackupplan25283"` | no |
| <a name="input_nas_backup_plan_name_var"></a> [nas\_backup\_plan\_name\_var](#input\_nas\_backup\_plan\_name\_var) | n/a | `string` | `"tf-exampleCase3"` | no |
| <a name="input_options_var"></a> [options\_var](#input\_options\_var) | n/a | `string` | `"{\\\"UseVSS\\\":true}"` | no |
| <a name="input_retention_var"></a> [retention\_var](#input\_retention\_var) | n/a | `string` | `"4"` | no |
| <a name="input_schedule_var"></a> [schedule\_var](#input\_schedule\_var) | n/a | `string` | `"I|1602673264|PT2H"` | no |
<!-- END_TF_DOCS -->    