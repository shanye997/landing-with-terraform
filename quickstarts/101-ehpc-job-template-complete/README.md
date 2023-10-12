<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ehpc_job_template.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ehpc_job_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_array_request_var"></a> [array\_request\_var](#input\_array\_request\_var) | n/a | `string` | `"1-12:2"` | no |
| <a name="input_clock_time_var"></a> [clock\_time\_var](#input\_clock\_time\_var) | n/a | `string` | `"14:00:00"` | no |
| <a name="input_command_line_var"></a> [command\_line\_var](#input\_command\_line\_var) | n/a | `string` | `"./LammpsTestT/lammps.pbs"` | no |
| <a name="input_gpu_var"></a> [gpu\_var](#input\_gpu\_var) | n/a | `string` | `"3"` | no |
| <a name="input_job_template_name_var"></a> [job\_template\_name\_var](#input\_job\_template\_name\_var) | n/a | `string` | `"JobTemplateNameY"` | no |
| <a name="input_mem_var"></a> [mem\_var](#input\_mem\_var) | n/a | `string` | `"3GB"` | no |
| <a name="input_node_var"></a> [node\_var](#input\_node\_var) | n/a | `string` | `"4"` | no |
| <a name="input_package_path_var"></a> [package\_path\_var](#input\_package\_path\_var) | n/a | `string` | `"./jobfolderT"` | no |
| <a name="input_priority_var"></a> [priority\_var](#input\_priority\_var) | n/a | `string` | `"2"` | no |
| <a name="input_queue_var"></a> [queue\_var](#input\_queue\_var) | n/a | `string` | `"workq"` | no |
| <a name="input_re_runable_var"></a> [re\_runable\_var](#input\_re\_runable\_var) | n/a | `string` | `"true"` | no |
| <a name="input_runas_user_var"></a> [runas\_user\_var](#input\_runas\_user\_var) | n/a | `string` | `"user3"` | no |
| <a name="input_stderr_redirect_path_var"></a> [stderr\_redirect\_path\_var](#input\_stderr\_redirect\_path\_var) | n/a | `string` | `"./LammpsTestT"` | no |
| <a name="input_stdout_redirect_path_var"></a> [stdout\_redirect\_path\_var](#input\_stdout\_redirect\_path\_var) | n/a | `string` | `"./LammpsTestH"` | no |
| <a name="input_task_var"></a> [task\_var](#input\_task\_var) | n/a | `string` | `"4"` | no |
| <a name="input_thread_var"></a> [thread\_var](#input\_thread\_var) | n/a | `string` | `"3"` | no |
| <a name="input_variables_var"></a> [variables\_var](#input\_variables\_var) | n/a | `string` | `"[{Demo:,Test:},{Test:,Demo:}]"` | no |
<!-- END_TF_DOCS -->    