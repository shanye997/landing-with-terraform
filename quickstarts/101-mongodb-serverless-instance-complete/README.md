<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_mongodb_serverless_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/mongodb_serverless_instance) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_mongodb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/mongodb_zones) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_password_var"></a> [account\_password\_var](#input\_account\_password\_var) | n/a | `string` | `"Abc12345"` | no |
| <a name="input_auto_renew_var"></a> [auto\_renew\_var](#input\_auto\_renew\_var) | n/a | `string` | `"false"` | no |
| <a name="input_capacity_unit_var"></a> [capacity\_unit\_var](#input\_capacity\_unit\_var) | n/a | `string` | `"100"` | no |
| <a name="input_db_instance_storage_var"></a> [db\_instance\_storage\_var](#input\_db\_instance\_storage\_var) | n/a | `string` | `"5"` | no |
| <a name="input_engine_var"></a> [engine\_var](#input\_engine\_var) | n/a | `string` | `"MongoDB"` | no |
| <a name="input_engine_version_var"></a> [engine\_version\_var](#input\_engine\_version\_var) | n/a | `string` | `"4.2"` | no |
| <a name="input_maintain_end_time_var"></a> [maintain\_end\_time\_var](#input\_maintain\_end\_time\_var) | n/a | `string` | `"02:00Z"` | no |
| <a name="input_maintain_start_time_var"></a> [maintain\_start\_time\_var](#input\_maintain\_start\_time\_var) | n/a | `string` | `"01:00Z"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example-mongodbserverlessinstance-14404"` | no |
| <a name="input_period_price_type_var"></a> [period\_price\_type\_var](#input\_period\_price\_type\_var) | n/a | `string` | `"Day"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"1"` | no |
| <a name="input_storage_engine_var"></a> [storage\_engine\_var](#input\_storage\_engine\_var) | n/a | `string` | `"WiredTiger"` | no |
<!-- END_TF_DOCS -->    