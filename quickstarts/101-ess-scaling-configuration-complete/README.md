<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ess_scaling_configuration.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ess_scaling_configuration) | resource |
| [alicloud_ess_scaling_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ess_scaling_group) | resource |
| [alicloud_key_pair.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/key_pair) | resource |
| [alicloud_ram_role.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.t5](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_var"></a> [active\_var](#input\_active\_var) | n/a | `string` | `"true"` | no |
| <a name="input_credit_specification_var"></a> [credit\_specification\_var](#input\_credit\_specification\_var) | n/a | `string` | `"Standard"` | no |
| <a name="input_force_delete_var"></a> [force\_delete\_var](#input\_force\_delete\_var) | n/a | `string` | `"true"` | no |
| <a name="input_instance_name_var"></a> [instance\_name\_var](#input\_instance\_name\_var) | n/a | `string` | `"tf-exampleEssScalingConfiguration-820729"` | no |
| <a name="input_internet_charge_type_var"></a> [internet\_charge\_type\_var](#input\_internet\_charge\_type\_var) | n/a | `string` | `"PayByTraffic"` | no |
| <a name="input_internet_max_bandwidth_out_var"></a> [internet\_max\_bandwidth\_out\_var](#input\_internet\_max\_bandwidth\_out\_var) | n/a | `string` | `"5"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleEssScalingConfiguration-820729"` | no |
| <a name="input_password_inherit_var"></a> [password\_inherit\_var](#input\_password\_inherit\_var) | n/a | `string` | `"true"` | no |
| <a name="input_scaling_configuration_name_var"></a> [scaling\_configuration\_name\_var](#input\_scaling\_configuration\_name\_var) | n/a | `string` | `"tf-exampleEssScalingConfiguration-820729"` | no |
| <a name="input_system_disk_category_var"></a> [system\_disk\_category\_var](#input\_system\_disk\_category\_var) | n/a | `string` | `"cloud_ssd"` | no |
| <a name="input_system_disk_description_var"></a> [system\_disk\_description\_var](#input\_system\_disk\_description\_var) | n/a | `string` | `"kms"` | no |
| <a name="input_system_disk_encrypted_var"></a> [system\_disk\_encrypted\_var](#input\_system\_disk\_encrypted\_var) | n/a | `string` | `"true"` | no |
| <a name="input_system_disk_name_var"></a> [system\_disk\_name\_var](#input\_system\_disk\_name\_var) | n/a | `string` | `"kms"` | no |
| <a name="input_system_disk_size_var"></a> [system\_disk\_size\_var](#input\_system\_disk\_size\_var) | n/a | `string` | `"50"` | no |
| <a name="input_user_data_var"></a> [user\_data\_var](#input\_user\_data\_var) | n/a | `string` | `"#!/bin/bash\\necho \\\"hello\\\"\\n"` | no |
<!-- END_TF_DOCS -->    