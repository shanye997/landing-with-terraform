<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_gpdb_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/gpdb_instance) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_gpdb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/gpdb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_sample_data_var"></a> [create\_sample\_data\_var](#input\_create\_sample\_data\_var) | n/a | `string` | `"false"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-examplecn-hangzhougpdbdbinstance87482"` | no |
| <a name="input_instance_spec_var"></a> [instance\_spec\_var](#input\_instance\_spec\_var) | n/a | `string` | `"2C16G"` | no |
| <a name="input_master_node_num_var"></a> [master\_node\_num\_var](#input\_master\_node\_num\_var) | n/a | `string` | `"1"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhougpdbdbinstance87482"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"Month"` | no |
| <a name="input_private_ip_address_var"></a> [private\_ip\_address\_var](#input\_private\_ip\_address\_var) | n/a | `string` | `"1.1.1.1"` | no |
| <a name="input_seg_node_num_var"></a> [seg\_node\_num\_var](#input\_seg\_node\_num\_var) | n/a | `string` | `"4"` | no |
| <a name="input_seg_storage_type_var"></a> [seg\_storage\_type\_var](#input\_seg\_storage\_type\_var) | n/a | `string` | `"cloud_essd"` | no |
| <a name="input_storage_size_var"></a> [storage\_size\_var](#input\_storage\_size\_var) | n/a | `string` | `"50"` | no |
| <a name="input_used_time_var"></a> [used\_time\_var](#input\_used\_time\_var) | n/a | `string` | `"1"` | no |
<!-- END_TF_DOCS -->    