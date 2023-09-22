<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_graph_database_db_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/graph_database_db_instance) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_node_class_var"></a> [db\_node\_class\_var](#input\_db\_node\_class\_var) | n/a | `string` | `"gdb.r.xlarge_basic"` | no |
| <a name="input_db_node_storage_var"></a> [db\_node\_storage\_var](#input\_db\_node\_storage\_var) | n/a | `string` | `"50"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhougraphdatabasedbinstance55743"` | no |
<!-- END_TF_DOCS -->    