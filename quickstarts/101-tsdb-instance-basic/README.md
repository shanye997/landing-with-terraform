<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_tsdb_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/tsdb_instance) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_tsdb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/tsdb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_class_var"></a> [instance\_class\_var](#input\_instance\_class\_var) | n/a | `string` | `"tsdb.1x.basic"` | no |
| <a name="input_instance_storage_var"></a> [instance\_storage\_var](#input\_instance\_storage\_var) | n/a | `string` | `"150"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleTsdbInstance-7591141"` | no |
<!-- END_TF_DOCS -->    