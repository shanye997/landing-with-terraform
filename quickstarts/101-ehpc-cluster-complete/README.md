<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ehpc_cluster.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ehpc_cluster) | resource |
| [alicloud_nas_file_system.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_file_system) | resource |
| [alicloud_nas_file_system.default1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_file_system) | resource |
| [alicloud_nas_mount_target.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_mount_target) | resource |
| [alicloud_nas_mount_target.default1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_mount_target) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_version_var"></a> [cluster\_version\_var](#input\_cluster\_version\_var) | n/a | `string` | `"1.0"` | no |
| <a name="input_ehpc_version_var"></a> [ehpc\_version\_var](#input\_ehpc\_version\_var) | n/a | `string` | `"1.0.0"` | no |
| <a name="input_image_owner_alias_var"></a> [image\_owner\_alias\_var](#input\_image\_owner\_alias\_var) | n/a | `string` | `"system"` | no |
| <a name="input_is_compute_ess_var"></a> [is\_compute\_ess\_var](#input\_is\_compute\_ess\_var) | n/a | `string` | `"false"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouehpccluster34574"` | no |
| <a name="input_remote_vis_enable_var"></a> [remote\_vis\_enable\_var](#input\_remote\_vis\_enable\_var) | n/a | `string` | `"false"` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | n/a | `string` | `"Capacity"` | no |
| <a name="input_system_disk_level_var"></a> [system\_disk\_level\_var](#input\_system\_disk\_level\_var) | n/a | `string` | `"PL0"` | no |
| <a name="input_system_disk_size_var"></a> [system\_disk\_size\_var](#input\_system\_disk\_size\_var) | n/a | `string` | `"40"` | no |
| <a name="input_system_disk_type_var"></a> [system\_disk\_type\_var](#input\_system\_disk\_type\_var) | n/a | `string` | `"cloud_essd"` | no |
| <a name="input_volume_mount_option_var"></a> [volume\_mount\_option\_var](#input\_volume\_mount\_option\_var) | n/a | `string` | `"-t nfs -o vers=4.0"` | no |
| <a name="input_without_agent_var"></a> [without\_agent\_var](#input\_without\_agent\_var) | n/a | `string` | `"false"` | no |
| <a name="input_without_elastic_ip_var"></a> [without\_elastic\_ip\_var](#input\_without\_elastic\_ip\_var) | n/a | `string` | `"false"` | no |
<!-- END_TF_DOCS -->    