<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_lindorm_instance.default_0](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/lindorm_instance) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_file_engine_node_count_var"></a> [file\_engine\_node\_count\_var](#input\_file\_engine\_node\_count\_var) | n/a | `string` | `"2"` | no |
| <a name="input_file_engine_specification_var"></a> [file\_engine\_specification\_var](#input\_file\_engine\_specification\_var) | n/a | `string` | `"lindorm.c.xlarge"` | no |
| <a name="input_instance_storage_var"></a> [instance\_storage\_var](#input\_instance\_storage\_var) | n/a | `string` | `"1920"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleLindorminstance14340"` | no |
<!-- END_TF_DOCS -->    