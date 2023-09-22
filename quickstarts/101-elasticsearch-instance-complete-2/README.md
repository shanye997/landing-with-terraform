<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_elasticsearch_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/elasticsearch_instance) | resource |
| [alicloud_elasticsearch_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/elasticsearch_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_node_amount_var"></a> [data\_node\_amount\_var](#input\_data\_node\_amount\_var) | n/a | `string` | `"4"` | no |
| <a name="input_data_node_disk_performance_level_var"></a> [data\_node\_disk\_performance\_level\_var](#input\_data\_node\_disk\_performance\_level\_var) | n/a | `string` | `"PL1"` | no |
| <a name="input_data_node_disk_size_var"></a> [data\_node\_disk\_size\_var](#input\_data\_node\_disk\_size\_var) | n/a | `string` | `"20"` | no |
| <a name="input_data_node_disk_type_var"></a> [data\_node\_disk\_type\_var](#input\_data\_node\_disk\_type\_var) | n/a | `string` | `"cloud_essd"` | no |
| <a name="input_data_node_spec_var"></a> [data\_node\_spec\_var](#input\_data\_node\_spec\_var) | n/a | `string` | `"elasticsearch.sn1ne.large"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-exampleEScn-hangzhou4563653"` | no |
| <a name="input_instance_charge_type_var"></a> [instance\_charge\_type\_var](#input\_instance\_charge\_type\_var) | n/a | `string` | `"PostPaid"` | no |
| <a name="input_master_node_disk_type_var"></a> [master\_node\_disk\_type\_var](#input\_master\_node\_disk\_type\_var) | n/a | `string` | `"cloud_essd"` | no |
| <a name="input_master_node_spec_var"></a> [master\_node\_spec\_var](#input\_master\_node\_spec\_var) | n/a | `string` | `"elasticsearch.sn1ne.large"` | no |
| <a name="input_password_var"></a> [password\_var](#input\_password\_var) | n/a | `string` | `"Yourpassword1234"` | no |
<!-- END_TF_DOCS -->    