<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_kvstore_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kvstore_instance) | resource |
| [alicloud_kvstore_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/kvstore_zones) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.update](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_renew_period_var"></a> [auto\_renew\_period\_var](#input\_auto\_renew\_period\_var) | n/a | `string` | `"2"` | no |
| <a name="input_auto_renew_var"></a> [auto\_renew\_var](#input\_auto\_renew\_var) | n/a | `string` | `"false"` | no |
| <a name="input_backup_time_var"></a> [backup\_time\_var](#input\_backup\_time\_var) | n/a | `string` | `"10:00Z-11:00Z"` | no |
| <a name="input_db_instance_name_var"></a> [db\_instance\_name\_var](#input\_db\_instance\_name\_var) | n/a | `string` | `"tf-exampleKvstoreRedisInstance6_0-1568192"` | no |
| <a name="input_engine_version_var"></a> [engine\_version\_var](#input\_engine\_version\_var) | n/a | `string` | `"6.0"` | no |
| <a name="input_instance_class_var"></a> [instance\_class\_var](#input\_instance\_class\_var) | n/a | `string` | `"redis.shard.mid.ce"` | no |
| <a name="input_instance_release_protection_var"></a> [instance\_release\_protection\_var](#input\_instance\_release\_protection\_var) | n/a | `string` | `"true"` | no |
| <a name="input_maintain_end_time_var"></a> [maintain\_end\_time\_var](#input\_maintain\_end\_time\_var) | n/a | `string` | `"03:00Z"` | no |
| <a name="input_maintain_start_time_var"></a> [maintain\_start\_time\_var](#input\_maintain\_start\_time\_var) | n/a | `string` | `"02:00Z"` | no |
| <a name="input_payment_type_var"></a> [payment\_type\_var](#input\_payment\_type\_var) | n/a | `string` | `"PrePaid"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"1"` | no |
| <a name="input_private_connection_port_var"></a> [private\_connection\_port\_var](#input\_private\_connection\_port\_var) | n/a | `string` | `"4010"` | no |
| <a name="input_private_connection_prefix_var"></a> [private\_connection\_prefix\_var](#input\_private\_connection\_prefix\_var) | n/a | `string` | `"privateprefix1568192"` | no |
| <a name="input_tde_status_var"></a> [tde\_status\_var](#input\_tde\_status\_var) | n/a | `string` | `"Enabled"` | no |
| <a name="input_vpc_auth_mode_var"></a> [vpc\_auth\_mode\_var](#input\_vpc\_auth\_mode\_var) | n/a | `string` | `"Open"` | no |
<!-- END_TF_DOCS -->    