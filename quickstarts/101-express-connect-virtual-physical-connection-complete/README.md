<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_express_connect_virtual_physical_connection.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/express_connect_virtual_physical_connection) | resource |
| [alicloud_express_connect_physical_connections.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/express_connect_physical_connections) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_expect_spec_var"></a> [expect\_spec\_var](#input\_expect\_spec\_var) | n/a | `string` | `"200M"` | no |
| <a name="input_vlan_id_var"></a> [vlan\_id\_var](#input\_vlan\_id\_var) | n/a | `string` | `"1124"` | no |
| <a name="input_vpconn_ali_uid"></a> [vpconn\_ali\_uid](#input\_vpconn\_ali\_uid) | n/a | `string` | `""` | no |
<!-- END_TF_DOCS -->    