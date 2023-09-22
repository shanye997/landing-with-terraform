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
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_password_var"></a> [account\_password\_var](#input\_account\_password\_var) | n/a | `string` | `"Abc12345"` | no |
| <a name="input_capacity_unit_var"></a> [capacity\_unit\_var](#input\_capacity\_unit\_var) | n/a | `string` | `"100"` | no |
| <a name="input_db_instance_storage_var"></a> [db\_instance\_storage\_var](#input\_db\_instance\_storage\_var) | n/a | `string` | `"5"` | no |
| <a name="input_engine_version_var"></a> [engine\_version\_var](#input\_engine\_version\_var) | n/a | `string` | `"4.2"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example-mongodbserverlessinstance-14404"` | no |
<!-- END_TF_DOCS -->    