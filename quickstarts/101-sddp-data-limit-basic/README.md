<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_db_account_privilege.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_account_privilege) | resource |
| [alicloud_db_database.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_database) | resource |
| [alicloud_db_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_rds_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/rds_account) | resource |
| [alicloud_sddp_data_limit.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/sddp_data_limit) | resource |
| [alicloud_db_instance_classes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_instance_classes) | data source |
| [alicloud_db_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | n/a | `string` | `"tftestdatabase"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhousddpdatalimit40781"` | no |
| <a name="input_password"></a> [password](#input\_password) | n/a | `string` | `"Test12345"` | no |
<!-- END_TF_DOCS -->    