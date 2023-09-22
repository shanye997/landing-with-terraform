<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cs_kubernetes_node_pool.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cs_kubernetes_node_pool) | resource |
| [alicloud_cs_managed_kubernetes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cs_managed_kubernetes) | resource |
| [alicloud_ecs_deployment_set.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_deployment_set) | resource |
| [alicloud_key_pair.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/key_pair) | resource |
| [alicloud_security_group.group](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_security_group.group1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_kms_keys.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/kms_keys) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cis_enabled_var"></a> [cis\_enabled\_var](#input\_cis\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_cpu_policy_var"></a> [cpu\_policy\_var](#input\_cpu\_policy\_var) | n/a | `string` | `"none"` | no |
| <a name="input_desired_size_var"></a> [desired\_size\_var](#input\_desired\_size\_var) | n/a | `string` | `"0"` | no |
| <a name="input_image_type_var"></a> [image\_type\_var](#input\_image\_type\_var) | n/a | `string` | `"AliyunLinux"` | no |
| <a name="input_install_cloud_monitor_var"></a> [install\_cloud\_monitor\_var](#input\_install\_cloud\_monitor\_var) | n/a | `string` | `"false"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleNodePool-1109413"` | no |
| <a name="input_name_var"></a> [name\_var](#input\_name\_var) | n/a | `string` | `"tf-exampleNodePool-1109413"` | no |
| <a name="input_scaling_policy_var"></a> [scaling\_policy\_var](#input\_scaling\_policy\_var) | n/a | `string` | `"release"` | no |
| <a name="input_spot_strategy_var"></a> [spot\_strategy\_var](#input\_spot\_strategy\_var) | n/a | `string` | `"NoSpot"` | no |
| <a name="input_system_disk_category_var"></a> [system\_disk\_category\_var](#input\_system\_disk\_category\_var) | n/a | `string` | `"cloud_efficiency"` | no |
| <a name="input_system_disk_encrypt_algorithm_var"></a> [system\_disk\_encrypt\_algorithm\_var](#input\_system\_disk\_encrypt\_algorithm\_var) | n/a | `string` | `"aes-256"` | no |
| <a name="input_system_disk_encrypted_var"></a> [system\_disk\_encrypted\_var](#input\_system\_disk\_encrypted\_var) | n/a | `string` | `"true"` | no |
| <a name="input_system_disk_size_var"></a> [system\_disk\_size\_var](#input\_system\_disk\_size\_var) | n/a | `string` | `"40"` | no |
<!-- END_TF_DOCS -->    