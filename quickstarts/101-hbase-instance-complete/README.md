<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_hbase_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbase_instance) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_hbase_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/hbase_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_var"></a> [account\_var](#input\_account\_var) | n/a | `string` | `"adminu"` | no |
| <a name="input_cold_storage_size_var"></a> [cold\_storage\_size\_var](#input\_cold\_storage\_size\_var) | n/a | `string` | `"900"` | no |
| <a name="input_core_disk_size_var"></a> [core\_disk\_size\_var](#input\_core\_disk\_size\_var) | n/a | `string` | `"480"` | no |
| <a name="input_core_instance_type_var"></a> [core\_instance\_type\_var](#input\_core\_instance\_type\_var) | n/a | `string` | `"hbase.sn2.2xlarge"` | no |
| <a name="input_deletion_protection_var"></a> [deletion\_protection\_var](#input\_deletion\_protection\_var) | n/a | `string` | `"false"` | no |
| <a name="input_immediate_delete_flag_var"></a> [immediate\_delete\_flag\_var](#input\_immediate\_delete\_flag\_var) | n/a | `string` | `"true"` | no |
| <a name="input_ip_white_var"></a> [ip\_white\_var](#input\_ip\_white\_var) | n/a | `string` | `"192.168.1.2"` | no |
| <a name="input_maintain_end_time_var"></a> [maintain\_end\_time\_var](#input\_maintain\_end\_time\_var) | n/a | `string` | `"16:00Z"` | no |
| <a name="input_maintain_start_time_var"></a> [maintain\_start\_time\_var](#input\_maintain\_start\_time\_var) | n/a | `string` | `"14:00Z"` | no |
| <a name="input_master_instance_type_var"></a> [master\_instance\_type\_var](#input\_master\_instance\_type\_var) | n/a | `string` | `"hbase.sn2.2xlarge"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouVpc3295595"` | no |
| <a name="input_name_var"></a> [name\_var](#input\_name\_var) | n/a | `string` | `"tf-examplecn-hangzhouVpc3295595"` | no |
| <a name="input_password_var"></a> [password\_var](#input\_password\_var) | n/a | `string` | `"YourPassword@123u"` | no |
<!-- END_TF_DOCS -->    