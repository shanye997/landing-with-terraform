<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_log_ingestion.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_ingestion) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_display_name_var"></a> [display\_name\_var](#input\_display\_name\_var) | n/a | `string` | `"test_display"` | no |
| <a name="input_interval_var"></a> [interval\_var](#input\_interval\_var) | n/a | `string` | `"5m"` | no |
| <a name="input_run_immediately_var"></a> [run\_immediately\_var](#input\_run\_immediately\_var) | n/a | `string` | `"false"` | no |
| <a name="input_source_var"></a> [source\_var](#input\_source\_var) | n/a | `string` | `"{\\\"bucket\\\":\\\"bucket_name\\\",\\\"compressionCodec\\\":\\\"none\\\",\\\"encoding\\\":\\\"UTF-8\\\",\\\"endpoint\\\":\\\"oss-cn-hangzhou-internal.aliyuncs.com\\\",\\\"format\\\":{\\\"escapeChar\\\":\\\"\\\\\\\\\\\",\\\"fieldDelimiter\\\":\\\",\\\",\\\"fieldNames\\\":[],\\\"firstRowAsHeader\\\":true,\\\"maxLines\\\":1,\\\"quoteChar\\\":\\\"\\\\\\\"\\\",\\\"skipLeadingRows\\\":0,\\\"timeField\\\":\\\"\\\",\\\"type\\\":\\\"DelimitedText\\\"},\\\"pattern\\\":\\\"\\\",\\\"prefix\\\":\\\"test_prefix/\\\",\\\"restoreObjectEnabled\\\":false,\\\"roleARN\\\":\\\"acs:ram::1049446484210612:role/aliyunlogimportossrole\\\",\\\"type\\\":\\\"AliyunOSS\\\"}"` | no |
<!-- END_TF_DOCS -->    