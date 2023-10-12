<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_db_database.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_database) | resource |
| [alicloud_db_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_rds_backup.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/rds_backup) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_db_instance_classes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_instance_classes) | data source |
| [alicloud_db_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_method_var"></a> [backup\_method\_var](#input\_backup\_method\_var) | n/a | `string` | `"Physical"` | no |
| <a name="input_backup_strategy_var"></a> [backup\_strategy\_var](#input\_backup\_strategy\_var) | n/a | `string` | `"db"` | no |
| <a name="input_backup_type_var"></a> [backup\_type\_var](#input\_backup\_type\_var) | n/a | `string` | `"FullBackup"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhourdsbackup36002"` | no |
| <a name="input_remove_from_state_var"></a> [remove\_from\_state\_var](#input\_remove\_from\_state\_var) | n/a | `string` | `"true"` | no |
<!-- END_TF_DOCS -->    