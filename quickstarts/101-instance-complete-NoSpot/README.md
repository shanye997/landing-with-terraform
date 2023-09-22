<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/instance) | resource |
| [alicloud_key_pair.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/key_pair) | resource |
| [alicloud_ram_role.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vpc.vpc](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_renew_period_var"></a> [auto\_renew\_period\_var](#input\_auto\_renew\_period\_var) | n/a | `string` | `"2"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-examplecn-hangzhouEcsInstanceConfigPrePaid8932_description"` | no |
| <a name="input_dry_run_var"></a> [dry\_run\_var](#input\_dry\_run\_var) | n/a | `string` | `"true"` | no |
| <a name="input_force_delete_var"></a> [force\_delete\_var](#input\_force\_delete\_var) | n/a | `string` | `"true"` | no |
| <a name="input_host_name_var"></a> [host\_name\_var](#input\_host\_name\_var) | n/a | `string` | `"hostNameExample"` | no |
| <a name="input_include_data_disks_var"></a> [include\_data\_disks\_var](#input\_include\_data\_disks\_var) | n/a | `string` | `"false"` | no |
| <a name="input_instance_charge_type_var"></a> [instance\_charge\_type\_var](#input\_instance\_charge\_type\_var) | n/a | `string` | `"PrePaid"` | no |
| <a name="input_internet_charge_type_var"></a> [internet\_charge\_type\_var](#input\_internet\_charge\_type\_var) | n/a | `string` | `"PayByBandwidth"` | no |
| <a name="input_internet_max_bandwidth_out_var"></a> [internet\_max\_bandwidth\_out\_var](#input\_internet\_max\_bandwidth\_out\_var) | n/a | `string` | `"50"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouEcsInstance4516"` | no |
| <a name="input_operator_type_var"></a> [operator\_type\_var](#input\_operator\_type\_var) | n/a | `string` | `"upgrade"` | no |
| <a name="input_password_var"></a> [password\_var](#input\_password\_var) | n/a | `string` | `"Password123"` | no |
| <a name="input_period_unit_var"></a> [period\_unit\_var](#input\_period\_unit\_var) | n/a | `string` | `"Week"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"2"` | no |
| <a name="input_renewal_status_var"></a> [renewal\_status\_var](#input\_renewal\_status\_var) | n/a | `string` | `"AutoRenewal"` | no |
| <a name="input_system_disk_size_var"></a> [system\_disk\_size\_var](#input\_system\_disk\_size\_var) | n/a | `string` | `"50"` | no |
<!-- END_TF_DOCS -->    