<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_hbr_hana_backup_plan.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_hana_backup_plan) | resource |
| [alicloud_hbr_hana_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_hana_instance) | resource |
| [alicloud_hbr_vault.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_vault) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouhbrhanabackupplan37373"` | no |
| <a name="input_schedule_var"></a> [schedule\_var](#input\_schedule\_var) | n/a | `string` | `"I|1602673264|P1D"` | no |
<!-- END_TF_DOCS -->    