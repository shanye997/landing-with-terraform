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
| <a name="input_auto_renew_duration_var"></a> [auto\_renew\_duration\_var](#input\_auto\_renew\_duration\_var) | n/a | `string` | `"3"` | no |
| <a name="input_client_node_amount_var"></a> [client\_node\_amount\_var](#input\_client\_node\_amount\_var) | n/a | `string` | `"2"` | no |
| <a name="input_client_node_spec_var"></a> [client\_node\_spec\_var](#input\_client\_node\_spec\_var) | n/a | `string` | `"elasticsearch.sn1ne.large"` | no |
| <a name="input_data_node_amount_var"></a> [data\_node\_amount\_var](#input\_data\_node\_amount\_var) | n/a | `string` | `"2"` | no |
| <a name="input_data_node_disk_performance_level_var"></a> [data\_node\_disk\_performance\_level\_var](#input\_data\_node\_disk\_performance\_level\_var) | n/a | `string` | `"PL1"` | no |
| <a name="input_data_node_disk_size_var"></a> [data\_node\_disk\_size\_var](#input\_data\_node\_disk\_size\_var) | n/a | `string` | `"20"` | no |
| <a name="input_data_node_disk_type_var"></a> [data\_node\_disk\_type\_var](#input\_data\_node\_disk\_type\_var) | n/a | `string` | `"cloud_essd"` | no |
| <a name="input_data_node_spec_var"></a> [data\_node\_spec\_var](#input\_data\_node\_spec\_var) | n/a | `string` | `"elasticsearch.sn1ne.large"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-exampleEScn-hangzhou3358700"` | no |
| <a name="input_enable_kibana_private_network_var"></a> [enable\_kibana\_private\_network\_var](#input\_enable\_kibana\_private\_network\_var) | n/a | `string` | `"true"` | no |
| <a name="input_enable_public_var"></a> [enable\_public\_var](#input\_enable\_public\_var) | n/a | `string` | `"true"` | no |
| <a name="input_instance_charge_type_var"></a> [instance\_charge\_type\_var](#input\_instance\_charge\_type\_var) | n/a | `string` | `"PostPaid"` | no |
| <a name="input_kibana_node_spec_var"></a> [kibana\_node\_spec\_var](#input\_kibana\_node\_spec\_var) | n/a | `string` | `"elasticsearch.sn1ne.large"` | no |
| <a name="input_master_node_disk_type_var"></a> [master\_node\_disk\_type\_var](#input\_master\_node\_disk\_type\_var) | n/a | `string` | `"cloud_essd"` | no |
| <a name="input_master_node_spec_var"></a> [master\_node\_spec\_var](#input\_master\_node\_spec\_var) | n/a | `string` | `"elasticsearch.sn1ne.large"` | no |
| <a name="input_password_var"></a> [password\_var](#input\_password\_var) | n/a | `string` | `"Yourpassword1234"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"1"` | no |
| <a name="input_protocol_var"></a> [protocol\_var](#input\_protocol\_var) | n/a | `string` | `"HTTP"` | no |
| <a name="input_renew_status_var"></a> [renew\_status\_var](#input\_renew\_status\_var) | n/a | `string` | `"NotRenewal"` | no |
| <a name="input_renewal_duration_unit_var"></a> [renewal\_duration\_unit\_var](#input\_renewal\_duration\_unit\_var) | n/a | `string` | `"M"` | no |
<!-- END_TF_DOCS -->    