<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_lindorm_instance.default_0](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/lindorm_instance) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_core_spec_var"></a> [core\_spec\_var](#input\_core\_spec\_var) | n/a | `string` | `"lindorm.i2.4xlarge"` | no |
| <a name="input_deletion_proection_var"></a> [deletion\_proection\_var](#input\_deletion\_proection\_var) | n/a | `string` | `"false"` | no |
| <a name="input_instance_name_var"></a> [instance\_name\_var](#input\_instance\_name\_var) | n/a | `string` | `"tf-exampleLindorminstance17757"` | no |
| <a name="input_table_engine_node_count_var"></a> [table\_engine\_node\_count\_var](#input\_table\_engine\_node\_count\_var) | n/a | `string` | `"40"` | no |
<!-- END_TF_DOCS -->    