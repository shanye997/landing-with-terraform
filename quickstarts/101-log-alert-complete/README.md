<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_log_alert.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_alert) | resource |
| [alicloud_log_project.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_project) | resource |
| [alicloud_log_store.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_store) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_displayname_var"></a> [alert\_displayname\_var](#input\_alert\_displayname\_var) | n/a | `string` | `"update_alert_name_new"` | no |
| <a name="input_auto_annotation_var"></a> [auto\_annotation\_var](#input\_auto\_annotation\_var) | n/a | `string` | `"true"` | no |
| <a name="input_mute_until_var"></a> [mute\_until\_var](#input\_mute\_until\_var) | n/a | `string` | `"1632488888"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplelogalert-4093839"` | no |
| <a name="input_no_data_fire_var"></a> [no\_data\_fire\_var](#input\_no\_data\_fire\_var) | n/a | `string` | `"true"` | no |
| <a name="input_no_data_severity_var"></a> [no\_data\_severity\_var](#input\_no\_data\_severity\_var) | n/a | `string` | `"8"` | no |
| <a name="input_send_resolved_var"></a> [send\_resolved\_var](#input\_send\_resolved\_var) | n/a | `string` | `"false"` | no |
| <a name="input_type_var"></a> [type\_var](#input\_type\_var) | n/a | `string` | `"default"` | no |
| <a name="input_version_var"></a> [version\_var](#input\_version\_var) | n/a | `string` | `"2.0"` | no |
<!-- END_TF_DOCS -->    