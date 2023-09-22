<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cddc_dedicated_host.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cddc_dedicated_host) | resource |
| [alicloud_cddc_dedicated_host_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cddc_dedicated_host_group) | resource |
| [alicloud_cddc_dedicated_host_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/cddc_dedicated_host_groups) | data source |
| [alicloud_cddc_host_ecs_level_infos.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/cddc_host_ecs_level_infos) | data source |
| [alicloud_cddc_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/cddc_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocation_status_var"></a> [allocation\_status\_var](#input\_allocation\_status\_var) | n/a | `string` | `"Suspended"` | no |
| <a name="input_auto_renew_var"></a> [auto\_renew\_var](#input\_auto\_renew\_var) | n/a | `string` | `"false"` | no |
| <a name="input_image_category_var"></a> [image\_category\_var](#input\_image\_category\_var) | n/a | `string` | `"AliLinux"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example-cddcdedicatedhost75321"` | no |
| <a name="input_os_password_var"></a> [os\_password\_var](#input\_os\_password\_var) | n/a | `string` | `"Password1234."` | no |
| <a name="input_payment_type_var"></a> [payment\_type\_var](#input\_payment\_type\_var) | n/a | `string` | `"Subscription"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"Month"` | no |
| <a name="input_used_time_var"></a> [used\_time\_var](#input\_used\_time\_var) | n/a | `string` | `"1"` | no |
<!-- END_TF_DOCS -->    