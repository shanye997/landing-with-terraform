<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_kvstore_audit_log_config.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kvstore_audit_log_config) | resource |
| [alicloud_kvstore_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kvstore_instance) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_kvstore_instance_classes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/kvstore_instance_classes) | data source |
| [alicloud_kvstore_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/kvstore_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_audit_var"></a> [db\_audit\_var](#input\_db\_audit\_var) | n/a | `string` | `"false"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouKvstoreAuditLogConfigtftestnormal6217708"` | no |
| <a name="input_retention_var"></a> [retention\_var](#input\_retention\_var) | n/a | `string` | `"1"` | no |
<!-- END_TF_DOCS -->    