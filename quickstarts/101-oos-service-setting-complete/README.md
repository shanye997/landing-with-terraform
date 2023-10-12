<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_log_project.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_project) | resource |
| [alicloud_oos_service_setting.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/oos_service_setting) | resource |
| [alicloud_oss_bucket.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/oss_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delivery_oss_enabled_var"></a> [delivery\_oss\_enabled\_var](#input\_delivery\_oss\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_delivery_oss_key_prefix_var"></a> [delivery\_oss\_key\_prefix\_var](#input\_delivery\_oss\_key\_prefix\_var) | n/a | `string` | `"path1/"` | no |
| <a name="input_delivery_sls_enabled_var"></a> [delivery\_sls\_enabled\_var](#input\_delivery\_sls\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouoos67260"` | no |
<!-- END_TF_DOCS -->    