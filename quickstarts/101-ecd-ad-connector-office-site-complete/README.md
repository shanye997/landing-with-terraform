<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cen_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_instance) | resource |
| [alicloud_ecd_ad_connector_office_site.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecd_ad_connector_office_site) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_desktop_access_type_var"></a> [desktop\_access\_type\_var](#input\_desktop\_access\_type\_var) | n/a | `string` | `"INTERNET"` | no |
| <a name="input_domain_name_var"></a> [domain\_name\_var](#input\_domain\_name\_var) | n/a | `string` | `"example1234.com"` | no |
| <a name="input_domain_password_var"></a> [domain\_password\_var](#input\_domain\_password\_var) | n/a | `string` | `"YourPassword1234"` | no |
| <a name="input_domain_user_name_var"></a> [domain\_user\_name\_var](#input\_domain\_user\_name\_var) | n/a | `string` | `"Administrator"` | no |
| <a name="input_mfa_enabled_var"></a> [mfa\_enabled\_var](#input\_mfa\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouecdadconnectorofficesite39492"` | no |
| <a name="input_sub_domain_name_var"></a> [sub\_domain\_name\_var](#input\_sub\_domain\_name\_var) | n/a | `string` | `"child.example1234.com"` | no |
<!-- END_TF_DOCS -->    