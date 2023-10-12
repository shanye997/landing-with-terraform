<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ecs_deployment_set.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_deployment_set) | resource |
| [alicloud_ecs_launch_template.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_launch_template) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_release_time_var"></a> [auto\_release\_time\_var](#input\_auto\_release\_time\_var) | n/a | `string` | `"22229-922-10T922:21:21Z"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-exampleLaunchTemplateBasic3401562032205884011"` | no |
| <a name="input_enable_vm_os_config_var"></a> [enable\_vm\_os\_config\_var](#input\_enable\_vm\_os\_config\_var) | n/a | `string` | `"false"` | no |
| <a name="input_host_name_var"></a> [host\_name\_var](#input\_host\_name\_var) | n/a | `string` | `"tf-exampleLaunchTemplateBasic3401562032205884011"` | no |
| <a name="input_image_owner_alias_var"></a> [image\_owner\_alias\_var](#input\_image\_owner\_alias\_var) | n/a | `string` | `"system"` | no |
| <a name="input_instance_charge_type_var"></a> [instance\_charge\_type\_var](#input\_instance\_charge\_type\_var) | n/a | `string` | `"PrePaid"` | no |
| <a name="input_instance_name_var"></a> [instance\_name\_var](#input\_instance\_name\_var) | n/a | `string` | `"tf-exampleLaunchTemplateBasic3401562032205884011"` | no |
| <a name="input_internet_charge_type_var"></a> [internet\_charge\_type\_var](#input\_internet\_charge\_type\_var) | n/a | `string` | `"PayByBandwidth"` | no |
| <a name="input_internet_max_bandwidth_in_var"></a> [internet\_max\_bandwidth\_in\_var](#input\_internet\_max\_bandwidth\_in\_var) | n/a | `string` | `"5"` | no |
| <a name="input_internet_max_bandwidth_out_var"></a> [internet\_max\_bandwidth\_out\_var](#input\_internet\_max\_bandwidth\_out\_var) | n/a | `string` | `"5"` | no |
| <a name="input_io_optimized_var"></a> [io\_optimized\_var](#input\_io\_optimized\_var) | n/a | `string` | `"optimized"` | no |
| <a name="input_key_pair_name_var"></a> [key\_pair\_name\_var](#input\_key\_pair\_name\_var) | n/a | `string` | `"tf-exampleLaunchTemplateBasic3401562032205884011"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleLaunchTemplateBasic3401562032205884011"` | no |
| <a name="input_network_type_var"></a> [network\_type\_var](#input\_network\_type\_var) | n/a | `string` | `"vpc"` | no |
| <a name="input_password_inherit_var"></a> [password\_inherit\_var](#input\_password\_inherit\_var) | n/a | `string` | `"false"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"1"` | no |
| <a name="input_private_ip_address_var"></a> [private\_ip\_address\_var](#input\_private\_ip\_address\_var) | n/a | `string` | `"172.16.0.10"` | no |
| <a name="input_ram_role_name_var"></a> [ram\_role\_name\_var](#input\_ram\_role\_name\_var) | n/a | `string` | `"tf-exampleLaunchTemplateBasic3401562032205884011"` | no |
| <a name="input_resource_group_id_var"></a> [resource\_group\_id\_var](#input\_resource\_group\_id\_var) | n/a | `string` | `"rg-zkdfjahg9zxncv0"` | no |
| <a name="input_security_enhancement_strategy_var"></a> [security\_enhancement\_strategy\_var](#input\_security\_enhancement\_strategy\_var) | n/a | `string` | `"Active"` | no |
| <a name="input_spot_price_limit_var"></a> [spot\_price\_limit\_var](#input\_spot\_price\_limit\_var) | n/a | `string` | `"5"` | no |
| <a name="input_spot_strategy_var"></a> [spot\_strategy\_var](#input\_spot\_strategy\_var) | n/a | `string` | `"SpotWithPriceLimit"` | no |
| <a name="input_user_data_var"></a> [user\_data\_var](#input\_user\_data\_var) | n/a | `string` | `"xxxxxxx"` | no |
| <a name="input_version_description_var"></a> [version\_description\_var](#input\_version\_description\_var) | n/a | `string` | `"tf-exampleLaunchTemplateBasic3401562032205884011"` | no |
| <a name="input_vpc_id_var"></a> [vpc\_id\_var](#input\_vpc\_id\_var) | n/a | `string` | `"vpc-asdfnbg0as8dfk1nb2"` | no |
| <a name="input_zone_id_var"></a> [zone\_id\_var](#input\_zone\_id\_var) | n/a | `string` | `"cn-hangzhou-i"` | no |
<!-- END_TF_DOCS -->    