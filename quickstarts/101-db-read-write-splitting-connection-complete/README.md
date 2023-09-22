<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_db_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_db_read_write_splitting_connection.create](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_read_write_splitting_connection) | resource |
| [alicloud_db_readonly_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_readonly_instance) | resource |
| [alicloud_db_instance_classes.master](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_instance_classes) | data source |
| [alicloud_db_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_zones) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_distribution_type_var"></a> [distribution\_type\_var](#input\_distribution\_type\_var) | n/a | `string` | `"Custom"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleDBRwSplitConnMssql_create"` | no |
<!-- END_TF_DOCS -->    