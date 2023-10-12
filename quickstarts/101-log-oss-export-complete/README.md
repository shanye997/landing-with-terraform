<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_log_oss_export.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_oss_export) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_var"></a> [bucket\_var](#input\_bucket\_var) | n/a | `string` | `"test_bucket"` | no |
| <a name="input_buffer_interval_var"></a> [buffer\_interval\_var](#input\_buffer\_interval\_var) | n/a | `string` | `"300"` | no |
| <a name="input_buffer_size_var"></a> [buffer\_size\_var](#input\_buffer\_size\_var) | n/a | `string` | `"250"` | no |
| <a name="input_compress_type_var"></a> [compress\_type\_var](#input\_compress\_type\_var) | n/a | `string` | `"none"` | no |
| <a name="input_content_type_var"></a> [content\_type\_var](#input\_content\_type\_var) | n/a | `string` | `"parquet"` | no |
| <a name="input_csv_config_delimiter_var"></a> [csv\_config\_delimiter\_var](#input\_csv\_config\_delimiter\_var) | n/a | `string` | `","` | no |
| <a name="input_csv_config_escape_var"></a> [csv\_config\_escape\_var](#input\_csv\_config\_escape\_var) | n/a | `string` | `""` | no |
| <a name="input_csv_config_header_var"></a> [csv\_config\_header\_var](#input\_csv\_config\_header\_var) | n/a | `string` | `"false"` | no |
| <a name="input_csv_config_linefeed_var"></a> [csv\_config\_linefeed\_var](#input\_csv\_config\_linefeed\_var) | n/a | `string` | `""` | no |
| <a name="input_csv_config_null_var"></a> [csv\_config\_null\_var](#input\_csv\_config\_null\_var) | n/a | `string` | `""` | no |
| <a name="input_csv_config_quote_var"></a> [csv\_config\_quote\_var](#input\_csv\_config\_quote\_var) | n/a | `string` | `","` | no |
| <a name="input_display_name_var"></a> [display\_name\_var](#input\_display\_name\_var) | n/a | `string` | `"test display"` | no |
| <a name="input_json_enable_tag_var"></a> [json\_enable\_tag\_var](#input\_json\_enable\_tag\_var) | n/a | `string` | `"true"` | no |
| <a name="input_log_read_role_arn_var"></a> [log\_read\_role\_arn\_var](#input\_log\_read\_role\_arn\_var) | n/a | `string` | `"test-role-log-read-arn"` | no |
| <a name="input_path_format_var"></a> [path\_format\_var](#input\_path\_format\_var) | n/a | `string` | `"%Y/%m/%d/%H/%M"` | no |
| <a name="input_prefix_var"></a> [prefix\_var](#input\_prefix\_var) | n/a | `string` | `""` | no |
| <a name="input_role_arn_var"></a> [role\_arn\_var](#input\_role\_arn\_var) | n/a | `string` | `"test-role-arn"` | no |
| <a name="input_suffix_var"></a> [suffix\_var](#input\_suffix\_var) | n/a | `string` | `""` | no |
| <a name="input_time_zone_var"></a> [time\_zone\_var](#input\_time\_zone\_var) | n/a | `string` | `"+0800"` | no |
<!-- END_TF_DOCS -->    