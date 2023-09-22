<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_hbr_ots_backup_plan.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_ots_backup_plan) | resource |
| [alicloud_hbr_vault.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_vault) | resource |
| [alicloud_ots_instance.foo](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ots_instance) | resource |
| [alicloud_ots_table.basic](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ots_table) | resource |
| [alicloud_ram_role.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role) | resource |
| [alicloud_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_type_var"></a> [backup\_type\_var](#input\_backup\_type\_var) | n/a | `string` | `"COMPLETE"` | no |
| <a name="input_disabled_var"></a> [disabled\_var](#input\_disabled\_var) | n/a | `string` | `"false"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"example3829"` | no |
| <a name="input_ots_backup_plan_name_var"></a> [ots\_backup\_plan\_name\_var](#input\_ots\_backup\_plan\_name\_var) | n/a | `string` | `"example3829"` | no |
| <a name="input_retention_var"></a> [retention\_var](#input\_retention\_var) | n/a | `string` | `"2"` | no |
<!-- END_TF_DOCS -->    