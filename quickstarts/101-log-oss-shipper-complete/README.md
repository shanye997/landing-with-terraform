<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_log_oss_shipper.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_oss_shipper) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_buffer_interval_var"></a> [buffer\_interval\_var](#input\_buffer\_interval\_var) | n/a | `string` | `"300"` | no |
| <a name="input_buffer_size_var"></a> [buffer\_size\_var](#input\_buffer\_size\_var) | n/a | `string` | `"250"` | no |
| <a name="input_compress_type_var"></a> [compress\_type\_var](#input\_compress\_type\_var) | n/a | `string` | `"none"` | no |
| <a name="input_csv_config_delimiter_var"></a> [csv\_config\_delimiter\_var](#input\_csv\_config\_delimiter\_var) | n/a | `string` | `","` | no |
| <a name="input_csv_config_header_var"></a> [csv\_config\_header\_var](#input\_csv\_config\_header\_var) | n/a | `string` | `"false"` | no |
| <a name="input_csv_config_linefeed_var"></a> [csv\_config\_linefeed\_var](#input\_csv\_config\_linefeed\_var) | n/a | `string` | `""` | no |
| <a name="input_csv_config_nullidentifier_var"></a> [csv\_config\_nullidentifier\_var](#input\_csv\_config\_nullidentifier\_var) | n/a | `string` | `""` | no |
| <a name="input_csv_config_quote_var"></a> [csv\_config\_quote\_var](#input\_csv\_config\_quote\_var) | n/a | `string` | `","` | no |
| <a name="input_format_var"></a> [format\_var](#input\_format\_var) | n/a | `string` | `"json"` | no |
| <a name="input_json_enable_tag_var"></a> [json\_enable\_tag\_var](#input\_json\_enable\_tag\_var) | n/a | `string` | `"true"` | no |
| <a name="input_oss_bucket_var"></a> [oss\_bucket\_var](#input\_oss\_bucket\_var) | n/a | `string` | `"test_bucket"` | no |
| <a name="input_oss_prefix_var"></a> [oss\_prefix\_var](#input\_oss\_prefix\_var) | n/a | `string` | `"root"` | no |
| <a name="input_path_format_var"></a> [path\_format\_var](#input\_path\_format\_var) | n/a | `string` | `"%Y/%m/%d/%H/%M"` | no |
<!-- END_TF_DOCS -->    