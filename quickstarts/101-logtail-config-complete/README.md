<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_log_project.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_project) | resource |
| [alicloud_log_store.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_store) | resource |
| [alicloud_logtail_config.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/logtail_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_input_detail_var"></a> [input\_detail\_var](#input\_input\_detail\_var) | n/a | `string` | `"{\\\"plugin\\\":{\\\"inputs\\\":[{\\\"detail\\\":{\\\"ExcludeEnv\\\":null,\\\"ExcludeLabel\\\":null,\\\"IncludeEnv\\\":null,\\\"IncludeLabel\\\":null,\\\"Stderr\\\":true,\\\"Stdout\\\":true},\\\"type\\\":\\\"service_docker_stdout\\\"}]}}"` | no |
| <a name="input_input_type_var"></a> [input\_type\_var](#input\_input\_type\_var) | n/a | `string` | `"plugin"` | no |
| <a name="input_log_sample_var"></a> [log\_sample\_var](#input\_log\_sample\_var) | n/a | `string` | `"test-logtail"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplelogtailconfig-1696563"` | no |
| <a name="input_output_type_var"></a> [output\_type\_var](#input\_output\_type\_var) | n/a | `string` | `"LogService"` | no |
<!-- END_TF_DOCS -->    