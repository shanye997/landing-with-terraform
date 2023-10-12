<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_polardb_cluster.cluster](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/polardb_cluster) | resource |
| [alicloud_polardb_endpoint.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/polardb_endpoint) | resource |
| [alicloud_polardb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/polardb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_add_new_nodes_var"></a> [auto\_add\_new\_nodes\_var](#input\_auto\_add\_new\_nodes\_var) | n/a | `string` | `"Enable"` | no |
| <a name="input_db_endpoint_description_var"></a> [db\_endpoint\_description\_var](#input\_db\_endpoint\_description\_var) | n/a | `string` | `"polar_db_endpoint_test"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplePolarDBendpoint-dkrqzbgflm"` | no |
| <a name="input_net_type_var"></a> [net\_type\_var](#input\_net\_type\_var) | n/a | `string` | `"Private"` | no |
| <a name="input_read_write_mode_var"></a> [read\_write\_mode\_var](#input\_read\_write\_mode\_var) | n/a | `string` | `"ReadWrite"` | no |
| <a name="input_ssl_auto_rotate_var"></a> [ssl\_auto\_rotate\_var](#input\_ssl\_auto\_rotate\_var) | n/a | `string` | `"Enable"` | no |
| <a name="input_ssl_enabled_var"></a> [ssl\_enabled\_var](#input\_ssl\_enabled\_var) | n/a | `string` | `"Enable"` | no |
<!-- END_TF_DOCS -->    