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
| <a name="input_content_type_var"></a> [content\_type\_var](#input\_content\_type\_var) | n/a | `string` | `"parquet"` | no |
| <a name="input_path_format_var"></a> [path\_format\_var](#input\_path\_format\_var) | n/a | `string` | `"%Y/%m/%d/%H/%M"` | no |
| <a name="input_time_zone_var"></a> [time\_zone\_var](#input\_time\_zone\_var) | n/a | `string` | `"+0800"` | no |
<!-- END_TF_DOCS -->    