<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ram_security_preference.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_security_preference) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_user_to_change_password_var"></a> [allow\_user\_to\_change\_password\_var](#input\_allow\_user\_to\_change\_password\_var) | n/a | `string` | `"true"` | no |
| <a name="input_allow_user_to_manage_access_keys_var"></a> [allow\_user\_to\_manage\_access\_keys\_var](#input\_allow\_user\_to\_manage\_access\_keys\_var) | n/a | `string` | `"true"` | no |
| <a name="input_allow_user_to_manage_mfa_devices_var"></a> [allow\_user\_to\_manage\_mfa\_devices\_var](#input\_allow\_user\_to\_manage\_mfa\_devices\_var) | n/a | `string` | `"true"` | no |
| <a name="input_enable_save_mfa_ticket_var"></a> [enable\_save\_mfa\_ticket\_var](#input\_enable\_save\_mfa\_ticket\_var) | n/a | `string` | `"true"` | no |
| <a name="input_enforce_mfa_for_login_var"></a> [enforce\_mfa\_for\_login\_var](#input\_enforce\_mfa\_for\_login\_var) | n/a | `string` | `"false"` | no |
| <a name="input_login_network_masks_var"></a> [login\_network\_masks\_var](#input\_login\_network\_masks\_var) | n/a | `string` | `""` | no |
| <a name="input_login_session_duration_var"></a> [login\_session\_duration\_var](#input\_login\_session\_duration\_var) | n/a | `string` | `"7"` | no |
<!-- END_TF_DOCS -->    