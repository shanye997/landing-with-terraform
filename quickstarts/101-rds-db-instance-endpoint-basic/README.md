<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_db_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_rds_db_instance_endpoint.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/rds_db_instance_endpoint) | resource |
| [alicloud_rds_db_node.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/rds_db_node) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_db_instance_classes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_instance_classes) | data source |
| [alicloud_db_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_connection_string_prefix_var"></a> [connection\_string\_prefix\_var](#input\_connection\_string\_prefix\_var) | n/a | `string` | `"zcctest001"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleRdsDBInstanceEndpoint"` | no |
| <a name="input_port_var"></a> [port\_var](#input\_port\_var) | n/a | `string` | `"3308"` | no |
<!-- END_TF_DOCS -->    