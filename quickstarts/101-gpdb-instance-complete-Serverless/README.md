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
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_sample_data_var"></a> [create\_sample\_data\_var](#input\_create\_sample\_data\_var) | n/a | `string` | `"false"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-exampleap-southeast-1gpdbdbinstance63185"` | no |
| <a name="input_instance_spec_var"></a> [instance\_spec\_var](#input\_instance\_spec\_var) | n/a | `string` | `"4C16G"` | no |
| <a name="input_master_node_num_var"></a> [master\_node\_num\_var](#input\_master\_node\_num\_var) | n/a | `string` | `"1"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleap-southeast-1gpdbdbinstance63185"` | no |
| <a name="input_private_ip_address_var"></a> [private\_ip\_address\_var](#input\_private\_ip\_address\_var) | n/a | `string` | `"1.1.1.1"` | no |
| <a name="input_seg_node_num_var"></a> [seg\_node\_num\_var](#input\_seg\_node\_num\_var) | n/a | `string` | `"2"` | no |
<!-- END_TF_DOCS -->    