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
| <a name="input_db_cluster_description_var"></a> [db\_cluster\_description\_var](#input\_db\_cluster\_description\_var) | n/a | `string` | `"update-tf-db-cluster-description"` | no |
| <a name="input_enable_default_resource_group_var"></a> [enable\_default\_resource\_group\_var](#input\_enable\_default\_resource\_group\_var) | n/a | `string` | `"false"` | no |
| <a name="input_security_ips_var"></a> [security\_ips\_var](#input\_security\_ips\_var) | n/a | `string` | `"10.23.1.2"` | no |
| <a name="input_storage_resource_var"></a> [storage\_resource\_var](#input\_storage\_resource\_var) | n/a | `string` | `"0ACU"` | no |
<!-- END_TF_DOCS -->    