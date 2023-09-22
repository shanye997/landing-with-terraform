<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_nas_access_group.example](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_access_group) | resource |
| [alicloud_nas_access_rule.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_access_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouAlicloudNasAccessRule3885"` | no |
| <a name="input_priority_var"></a> [priority\_var](#input\_priority\_var) | n/a | `string` | `"1"` | no |
| <a name="input_rw_access_type_var"></a> [rw\_access\_type\_var](#input\_rw\_access\_type\_var) | n/a | `string` | `"RDONLY"` | no |
| <a name="input_source_cidr_ip_var"></a> [source\_cidr\_ip\_var](#input\_source\_cidr\_ip\_var) | n/a | `string` | `"168.1.1.0/16"` | no |
| <a name="input_user_access_type_var"></a> [user\_access\_type\_var](#input\_user\_access\_type\_var) | n/a | `string` | `"root_squash"` | no |
<!-- END_TF_DOCS -->    