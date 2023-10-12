<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_bastionhost_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/bastionhost_instance) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_public_access_var"></a> [enable\_public\_access\_var](#input\_enable\_public\_access\_var) | n/a | `string` | `"false"` | no |
| <a name="input_license_code_var"></a> [license\_code\_var](#input\_license\_code\_var) | n/a | `string` | `"bhah_ent_50_asset"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf_example2605"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"1"` | no |
| <a name="input_renew_period_var"></a> [renew\_period\_var](#input\_renew\_period\_var) | n/a | `string` | `"2"` | no |
| <a name="input_renewal_period_unit_var"></a> [renewal\_period\_unit\_var](#input\_renewal\_period\_unit\_var) | n/a | `string` | `"M"` | no |
| <a name="input_renewal_status_var"></a> [renewal\_status\_var](#input\_renewal\_status\_var) | n/a | `string` | `"NotRenewal"` | no |
<!-- END_TF_DOCS -->    