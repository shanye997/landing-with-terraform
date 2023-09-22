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
| <a name="input_db_proxy_instance_num_var"></a> [db\_proxy\_instance\_num\_var](#input\_db\_proxy\_instance\_num\_var) | n/a | `string` | `"3"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleDBProxysc3t9"` | no |
<!-- END_TF_DOCS -->    