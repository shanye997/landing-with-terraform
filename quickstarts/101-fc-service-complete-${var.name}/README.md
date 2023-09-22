<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_fc_service.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/fc_service) | resource |
| [alicloud_log_project.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_project) | resource |
| [alicloud_log_store.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_store) | resource |
| [alicloud_nas_access_group.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_access_group) | resource |
| [alicloud_nas_file_system.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_file_system) | resource |
| [alicloud_nas_mount_target.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nas_mount_target) | resource |
| [alicloud_ram_role.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role) | resource |
| [alicloud_ram_role_policy_attachment.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role_policy_attachment) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf unit test"` | no |
| <a name="input_internet_access_var"></a> [internet\_access\_var](#input\_internet\_access\_var) | n/a | `string` | `"false"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleap-southeast-1alicloudfcservice-858307"` | no |
| <a name="input_publish_var"></a> [publish\_var](#input\_publish\_var) | n/a | `string` | `"true"` | no |
<!-- END_TF_DOCS -->    