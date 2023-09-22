<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_adb_db_cluster_lake_version.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/adb_db_cluster_lake_version) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compute_resource_var"></a> [compute\_resource\_var](#input\_compute\_resource\_var) | n/a | `string` | `"16ACU"` | no |
| <a name="input_storage_resource_var"></a> [storage\_resource\_var](#input\_storage\_resource\_var) | n/a | `string` | `"0ACU"` | no |
<!-- END_TF_DOCS -->    