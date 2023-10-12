<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_sae_application.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/sae_application) | resource |
| [alicloud_sae_namespace.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/sae_namespace) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_enable_application_scaling_rule_var"></a> [auto\_enable\_application\_scaling\_rule\_var](#input\_auto\_enable\_application\_scaling\_rule\_var) | n/a | `string` | `"true"` | no |
| <a name="input_batch_wait_time_var"></a> [batch\_wait\_time\_var](#input\_batch\_wait\_time\_var) | n/a | `string` | `"10"` | no |
| <a name="input_command_args_var"></a> [command\_args\_var](#input\_command\_args\_var) | n/a | `string` | `"[\\\"1d\\\"]"` | no |
| <a name="input_command_var"></a> [command\_var](#input\_command\_var) | n/a | `string` | `"sleep"` | no |
| <a name="input_cpu_var"></a> [cpu\_var](#input\_cpu\_var) | n/a | `string` | `"1000"` | no |
| <a name="input_custom_host_alias_var"></a> [custom\_host\_alias\_var](#input\_custom\_host\_alias\_var) | n/a | `string` | `"[{\\\"hostName\\\":\\\"samplehost\\\",\\\"ip\\\":\\\"127.0.0.1\\\"}]"` | no |
| <a name="input_envs_var"></a> [envs\_var](#input\_envs\_var) | n/a | `string` | `"[{\\\"name\\\":\\\"envtmp\\\",\\\"value\\\":\\\"0\\\"}]"` | no |
| <a name="input_jdk_var"></a> [jdk\_var](#input\_jdk\_var) | n/a | `string` | `"Open JDK 8"` | no |
| <a name="input_liveness_var"></a> [liveness\_var](#input\_liveness\_var) | n/a | `string` | `"{\\\"exec\\\":{\\\"command\\\":[\\\"sleep\\\",\\\"5s\\\"]},\\\"initialDelaySeconds\\\":10,\\\"periodSeconds\\\":30,\\\"timeoutSeconds\\\":11}"` | no |
| <a name="input_memory_var"></a> [memory\_var](#input\_memory\_var) | n/a | `string` | `"4096"` | no |
| <a name="input_min_ready_instances_var"></a> [min\_ready\_instances\_var](#input\_min\_ready\_instances\_var) | n/a | `string` | `"2"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tfexample85736"` | no |
| <a name="input_package_url_var"></a> [package\_url\_var](#input\_package\_url\_var) | n/a | `string` | `"http://edas-hz.oss-cn-hangzhou.aliyuncs.com/demo/1.0/hello-sae.jar"` | no |
| <a name="input_package_version_var"></a> [package\_version\_var](#input\_package\_version\_var) | n/a | `string` | `"1695281662custom_host_alias"` | no |
| <a name="input_php_arms_config_location_var"></a> [php\_arms\_config\_location\_var](#input\_php\_arms\_config\_location\_var) | n/a | `string` | `"/usr/local/etc/php/conf.d/arms.ini"` | no |
| <a name="input_php_config_location_var"></a> [php\_config\_location\_var](#input\_php\_config\_location\_var) | n/a | `string` | `"/usr/local/etc/php/php.ini"` | no |
| <a name="input_php_config_var"></a> [php\_config\_var](#input\_php\_config\_var) | n/a | `string` | `"k1=v1"` | no |
| <a name="input_post_start_var"></a> [post\_start\_var](#input\_post\_start\_var) | n/a | `string` | `"{\\\"exec\\\":{\\\"command\\\":[\\\"cat\\\",\\\"/etc/group\\\"]}}"` | no |
| <a name="input_pre_stop_var"></a> [pre\_stop\_var](#input\_pre\_stop\_var) | n/a | `string` | `"{\\\"exec\\\":{\\\"command\\\":[\\\"cat\\\",\\\"/etc/group\\\"]}}"` | no |
| <a name="input_readiness_var"></a> [readiness\_var](#input\_readiness\_var) | n/a | `string` | `"{\\\"exec\\\":{\\\"command\\\":[\\\"sleep\\\",\\\"6s\\\"]},\\\"initialDelaySeconds\\\":15,\\\"periodSeconds\\\":30,\\\"timeoutSeconds\\\":12}"` | no |
| <a name="input_replicas_var"></a> [replicas\_var](#input\_replicas\_var) | n/a | `string` | `"5"` | no |
| <a name="input_sls_configs_var"></a> [sls\_configs\_var](#input\_sls\_configs\_var) | n/a | `string` | `"[{\\\"logDir\\\":\\\"/root/logs/hsf/hsf.log\\\"}]"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"RUNNING"` | no |
| <a name="input_termination_grace_period_seconds_var"></a> [termination\_grace\_period\_seconds\_var](#input\_termination\_grace\_period\_seconds\_var) | n/a | `string` | `"30"` | no |
| <a name="input_timezone_var"></a> [timezone\_var](#input\_timezone\_var) | n/a | `string` | `"Asia/Beijing"` | no |
<!-- END_TF_DOCS -->    