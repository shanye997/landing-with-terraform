<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_nas_file_system.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_file_system) | resource |
| [alicloud_nas_smb_acl_attachment.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_smb_acl_attachment) | resource |
| [alicloud_nas_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/nas_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_anonymous_access_var"></a> [enable\_anonymous\_access\_var](#input\_enable\_anonymous\_access\_var) | n/a | `string` | `"true"` | no |
| <a name="input_encrypt_data_var"></a> [encrypt\_data\_var](#input\_encrypt\_data\_var) | n/a | `string` | `"true"` | no |
| <a name="input_home_dir_path_var"></a> [home\_dir\_path\_var](#input\_home\_dir\_path\_var) | n/a | `string` | `"/wang"` | no |
| <a name="input_keytab_md5_var"></a> [keytab\_md5\_var](#input\_keytab\_md5\_var) | n/a | `string` | `"E3CCF7E2416DF04FA958AA4513EA29E8"` | no |
| <a name="input_keytab_var"></a> [keytab\_var](#input\_keytab\_var) | n/a | `string` | `"BQIAAABHAAIADUFMSUFEVEVTVC5DT00ABGNpZnMAGXNtYnNlcnZlcjI0LmFsaWFkdGVzdC5jb20AAAABAAAAAAEAAQAIqIx6v7p11oUAAABHAAIADUFMSUFEVEVTVC5DT00ABGNpZnMAGXNtYnNlcnZlcjI0LmFsaWFkdGVzdC5jb20AAAABAAAAAAEAAwAIqIx6v7p11oUAAABPAAIADUFMSUFEVEVTVC5DT00ABGNpZnMAGXNtYnNlcnZlcjI0LmFsaWFkdGVzdC5jb20AAAABAAAAAAEAFwAQnQZWB3RAPHU7PMIJyBWePAAAAF8AAgANQUxJQURURVNULkNPTQAEY2lmcwAZc21ic2VydmVyMjQuYWxpYWR0ZXN0LmNvbQAAAAEAAAAAAQASACAGJ7F0s+bcBjf6jD5HlvlRLmPSOW+qDZe0Qk0lQcf8WwAAAE8AAgANQUxJQURURVNULkNPTQAEY2lmcwAZc21ic2VydmVyMjQuYWxpYWR0ZXN0LmNvbQAAAAEAAAAAAQARABDdFmanrSIatnDDhoOXYadj"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhousmbacl80626"` | no |
| <a name="input_reject_unencrypted_access_var"></a> [reject\_unencrypted\_access\_var](#input\_reject\_unencrypted\_access\_var) | n/a | `string` | `"true"` | no |
| <a name="input_super_admin_sid_var"></a> [super\_admin\_sid\_var](#input\_super\_admin\_sid\_var) | n/a | `string` | `"S-1-1-1-2"` | no |
<!-- END_TF_DOCS -->    