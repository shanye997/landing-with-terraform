<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_alb_health_check_template.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alb_health_check_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dry_run_var"></a> [dry\_run\_var](#input\_dry\_run\_var) | n/a | `string` | `"false"` | no |
| <a name="input_health_check_connect_port_var"></a> [health\_check\_connect\_port\_var](#input\_health\_check\_connect\_port\_var) | n/a | `string` | `"8080"` | no |
| <a name="input_health_check_host_var"></a> [health\_check\_host\_var](#input\_health\_check\_host\_var) | n/a | `string` | `"www.test.com"` | no |
| <a name="input_health_check_http_version_var"></a> [health\_check\_http\_version\_var](#input\_health\_check\_http\_version\_var) | n/a | `string` | `"HTTP1.0"` | no |
| <a name="input_health_check_interval_var"></a> [health\_check\_interval\_var](#input\_health\_check\_interval\_var) | n/a | `string` | `"2"` | no |
| <a name="input_health_check_method_var"></a> [health\_check\_method\_var](#input\_health\_check\_method\_var) | n/a | `string` | `"GET"` | no |
| <a name="input_health_check_path_var"></a> [health\_check\_path\_var](#input\_health\_check\_path\_var) | n/a | `string` | `"/test"` | no |
| <a name="input_health_check_protocol_var"></a> [health\_check\_protocol\_var](#input\_health\_check\_protocol\_var) | n/a | `string` | `"HTTP"` | no |
| <a name="input_health_check_template_name_var"></a> [health\_check\_template\_name\_var](#input\_health\_check\_template\_name\_var) | n/a | `string` | `"tf-examplecn-hangzhoualbhealthchecktemplate79307"` | no |
| <a name="input_health_check_timeout_var"></a> [health\_check\_timeout\_var](#input\_health\_check\_timeout\_var) | n/a | `string` | `"50"` | no |
| <a name="input_healthy_threshold_var"></a> [healthy\_threshold\_var](#input\_healthy\_threshold\_var) | n/a | `string` | `"5"` | no |
| <a name="input_unhealthy_threshold_var"></a> [unhealthy\_threshold\_var](#input\_unhealthy\_threshold\_var) | n/a | `string` | `"5"` | no |
<!-- END_TF_DOCS -->    