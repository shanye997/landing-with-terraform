<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ecs_hpc_cluster.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_hpc_cluster) | resource |
| [alicloud_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/instance) | resource |
| [alicloud_key_pair.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/key_pair) | resource |
| [alicloud_kms_key.key](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_key) | resource |
| [alicloud_ram_role.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vpc.vpc](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_release_time_var"></a> [auto\_release\_time\_var](#input\_auto\_release\_time\_var) | n/a | `string` | `""` | no |
| <a name="input_deletion_protection_var"></a> [deletion\_protection\_var](#input\_deletion\_protection\_var) | n/a | `string` | `"true"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-exampleEcsInstanceConfigBasic6584_description"` | no |
| <a name="input_force_delete_var"></a> [force\_delete\_var](#input\_force\_delete\_var) | n/a | `string` | `"true"` | no |
| <a name="input_host_name_var"></a> [host\_name\_var](#input\_host\_name\_var) | n/a | `string` | `"hostNameExample"` | no |
| <a name="input_http_endpoint_var"></a> [http\_endpoint\_var](#input\_http\_endpoint\_var) | n/a | `string` | `"enabled"` | no |
| <a name="input_http_tokens_var"></a> [http\_tokens\_var](#input\_http\_tokens\_var) | n/a | `string` | `"optional"` | no |
| <a name="input_instance_charge_type_var"></a> [instance\_charge\_type\_var](#input\_instance\_charge\_type\_var) | n/a | `string` | `"PostPaid"` | no |
| <a name="input_instance_name_var"></a> [instance\_name\_var](#input\_instance\_name\_var) | n/a | `string` | `"tf-exampleEcsInstanceConfigBasic6584_change"` | no |
| <a name="input_internet_charge_type_var"></a> [internet\_charge\_type\_var](#input\_internet\_charge\_type\_var) | n/a | `string` | `"PayByBandwidth"` | no |
| <a name="input_internet_max_bandwidth_out_var"></a> [internet\_max\_bandwidth\_out\_var](#input\_internet\_max\_bandwidth\_out\_var) | n/a | `string` | `"50"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleEcsInstanceConfigBasic6584"` | no |
| <a name="input_password_var"></a> [password\_var](#input\_password\_var) | n/a | `string` | `"Password123"` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | n/a | `string` | `""` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"Stopped"` | no |
| <a name="input_stopped_mode_var"></a> [stopped\_mode\_var](#input\_stopped\_mode\_var) | n/a | `string` | `"KeepCharging"` | no |
| <a name="input_system_disk_description_var"></a> [system\_disk\_description\_var](#input\_system\_disk\_description\_var) | n/a | `string` | `"tf-exampleEcsInstanceConfigBasic6584_system_disk_description"` | no |
| <a name="input_system_disk_name_var"></a> [system\_disk\_name\_var](#input\_system\_disk\_name\_var) | n/a | `string` | `"tf-exampleEcsInstanceConfigBasic6584_system_disk_name"` | no |
| <a name="input_system_disk_size_var"></a> [system\_disk\_size\_var](#input\_system\_disk\_size\_var) | n/a | `string` | `"60"` | no |
<!-- END_TF_DOCS -->    