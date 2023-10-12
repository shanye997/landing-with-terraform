<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_db_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_db_readonly_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_readonly_instance) | resource |
| [alicloud_rds_db_proxy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/rds_db_proxy) | resource |
| [alicloud_vswitch.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_db_instance_classes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_instance_classes) | data source |
| [alicloud_db_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_proxy_connect_string_port_var"></a> [db\_proxy\_connect\_string\_port\_var](#input\_db\_proxy\_connect\_string\_port\_var) | n/a | `string` | `"3306"` | no |
| <a name="input_db_proxy_connection_prefix_var"></a> [db\_proxy\_connection\_prefix\_var](#input\_db\_proxy\_connection\_prefix\_var) | n/a | `string` | `"tf-examplesc3t9"` | no |
| <a name="input_db_proxy_endpoint_read_write_mode_var"></a> [db\_proxy\_endpoint\_read\_write\_mode\_var](#input\_db\_proxy\_endpoint\_read\_write\_mode\_var) | n/a | `string` | `"ReadWrite"` | no |
| <a name="input_db_proxy_features_var"></a> [db\_proxy\_features\_var](#input\_db\_proxy\_features\_var) | n/a | `string` | `"TransactionReadSqlRouteOptimizeStatus:1;ConnectionPersist:1;ReadWriteSpliting:1"` | no |
| <a name="input_db_proxy_instance_num_var"></a> [db\_proxy\_instance\_num\_var](#input\_db\_proxy\_instance\_num\_var) | n/a | `string` | `"3"` | no |
| <a name="input_db_proxy_ssl_enabled_var"></a> [db\_proxy\_ssl\_enabled\_var](#input\_db\_proxy\_ssl\_enabled\_var) | n/a | `string` | `"Open"` | no |
| <a name="input_effective_time_var"></a> [effective\_time\_var](#input\_effective\_time\_var) | n/a | `string` | `"Immediate"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleDBProxysc3t9"` | no |
| <a name="input_read_only_instance_distribution_type_var"></a> [read\_only\_instance\_distribution\_type\_var](#input\_read\_only\_instance\_distribution\_type\_var) | n/a | `string` | `"Custom"` | no |
| <a name="input_read_only_instance_max_delay_time_var"></a> [read\_only\_instance\_max\_delay\_time\_var](#input\_read\_only\_instance\_max\_delay\_time\_var) | n/a | `string` | `"90"` | no |
| <a name="input_upgrade_time_var"></a> [upgrade\_time\_var](#input\_upgrade\_time\_var) | n/a | `string` | `"Immediate"` | no |
<!-- END_TF_DOCS -->    