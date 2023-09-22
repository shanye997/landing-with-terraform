<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_hbr_hana_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_hana_instance) | resource |
| [alicloud_hbr_vault.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_vault) | resource |
| [alicloud_instances.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instances) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_setting_var"></a> [alert\_setting\_var](#input\_alert\_setting\_var) | n/a | `string` | `"INHERITED"` | no |
| <a name="input_host_var"></a> [host\_var](#input\_host\_var) | n/a | `string` | `"1.1.1.1"` | no |
| <a name="input_instance_number_var"></a> [instance\_number\_var](#input\_instance\_number\_var) | n/a | `string` | `"1"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouhbrhanainstance3654"` | no |
| <a name="input_use_ssl_var"></a> [use\_ssl\_var](#input\_use\_ssl\_var) | n/a | `string` | `"true"` | no |
| <a name="input_user_name_var"></a> [user\_name\_var](#input\_user\_name\_var) | n/a | `string` | `"admin1"` | no |
| <a name="input_validate_certificate_var"></a> [validate\_certificate\_var](#input\_validate\_certificate\_var) | n/a | `string` | `"false"` | no |
<!-- END_TF_DOCS -->    