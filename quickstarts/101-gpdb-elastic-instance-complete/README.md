<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_gpdb_elastic_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/gpdb_elastic_instance) | resource |
| [alicloud_kms_key.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_key) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_gpdb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/gpdb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_instance_description_var"></a> [db\_instance\_description\_var](#input\_db\_instance\_description\_var) | n/a | `string` | `"tf-exampleGpdbInstance_elastic_6.0"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleGpdbInstance_vpc"` | no |
<!-- END_TF_DOCS -->    