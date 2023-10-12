<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_redis_tair_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/redis_tair_instance) | resource |
| [alicloud_vswitch.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_kvstore_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/kvstore_zones) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_renew_var"></a> [auto\_renew\_var](#input\_auto\_renew\_var) | n/a | `string` | `"false"` | no |
| <a name="input_effective_time_var"></a> [effective\_time\_var](#input\_effective\_time\_var) | n/a | `string` | `"Immediately"` | no |
| <a name="input_engine_version_var"></a> [engine\_version\_var](#input\_engine\_version\_var) | n/a | `string` | `"5.0"` | no |
| <a name="input_instance_class_var"></a> [instance\_class\_var](#input\_instance\_class\_var) | n/a | `string` | `"tair.rdb.1g"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouredistairinstance12754"` | no |
| <a name="input_password_var"></a> [password\_var](#input\_password\_var) | n/a | `string` | `"Pass!123456!change"` | no |
| <a name="input_shard_count_var"></a> [shard\_count\_var](#input\_shard\_count\_var) | n/a | `string` | `"2"` | no |
| <a name="input_tair_instance_name_var"></a> [tair\_instance\_name\_var](#input\_tair\_instance\_name\_var) | n/a | `string` | `"tf-examplecn-hangzhouredistairinstance12754"` | no |
<!-- END_TF_DOCS -->    