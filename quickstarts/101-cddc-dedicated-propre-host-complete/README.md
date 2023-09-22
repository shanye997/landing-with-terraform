<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cddc_dedicated_host_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cddc_dedicated_host_group) | resource |
| [alicloud_cddc_dedicated_propre_host.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cddc_dedicated_propre_host) | resource |
| [alicloud_ecs_deployment_set.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_deployment_set) | resource |
| [alicloud_key_pair.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/key_pair) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_cddc_dedicated_host_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/cddc_dedicated_host_groups) | data source |
| [alicloud_ecs_deployment_sets.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/ecs_deployment_sets) | data source |
| [alicloud_key_pairs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/key_pairs) | data source |
| [alicloud_security_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/security_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_renew_var"></a> [auto\_renew\_var](#input\_auto\_renew\_var) | n/a | `string` | `"false"` | no |
| <a name="input_ecs_unique_suffix_var"></a> [ecs\_unique\_suffix\_var](#input\_ecs\_unique\_suffix\_var) | n/a | `string` | `"false"` | no |
| <a name="input_os_password_var"></a> [os\_password\_var](#input\_os\_password\_var) | n/a | `string` | `"YourPassword123!"` | no |
| <a name="input_password_inherit_var"></a> [password\_inherit\_var](#input\_password\_inherit\_var) | n/a | `string` | `"false"` | no |
| <a name="input_period_type_var"></a> [period\_type\_var](#input\_period\_type\_var) | n/a | `string` | `"Monthly"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"1"` | no |
<!-- END_TF_DOCS -->    