<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_fc_service.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/fc_service) | resource |
| [alicloud_fcv2_function.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/fcv2_function) | resource |
| [alicloud_log_project.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_project) | resource |
| [alicloud_log_store.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_store) | resource |
| [alicloud_ram_role.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role) | resource |
| [alicloud_ram_role_policy_attachment.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ca_port_var"></a> [ca\_port\_var](#input\_ca\_port\_var) | n/a | `string` | `"9000"` | no |
| <a name="input_code_checksum_var"></a> [code\_checksum\_var](#input\_code\_checksum\_var) | n/a | `string` | `"1750949844529959033"` | no |
| <a name="input_cpu_var"></a> [cpu\_var](#input\_cpu\_var) | n/a | `string` | `"2"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"terraform测试case"` | no |
| <a name="input_disk_size_var"></a> [disk\_size\_var](#input\_disk\_size\_var) | n/a | `string` | `"512"` | no |
| <a name="input_gpu_memory_size_var"></a> [gpu\_memory\_size\_var](#input\_gpu\_memory\_size\_var) | n/a | `string` | `"4096"` | no |
| <a name="input_handler_var"></a> [handler\_var](#input\_handler\_var) | n/a | `string` | `"index.handler"` | no |
| <a name="input_initialization_timeout_var"></a> [initialization\_timeout\_var](#input\_initialization\_timeout\_var) | n/a | `string` | `"10"` | no |
| <a name="input_initializer_var"></a> [initializer\_var](#input\_initializer\_var) | n/a | `string` | `"index.initializer"` | no |
| <a name="input_instance_concurrency_var"></a> [instance\_concurrency\_var](#input\_instance\_concurrency\_var) | n/a | `string` | `"10"` | no |
| <a name="input_instance_type_var"></a> [instance\_type\_var](#input\_instance\_type\_var) | n/a | `string` | `"fc.gpu.tesla.1"` | no |
| <a name="input_memory_size_var"></a> [memory\_size\_var](#input\_memory\_size\_var) | n/a | `string` | `"8192"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhoufcv2function21340"` | no |
| <a name="input_runtime_var"></a> [runtime\_var](#input\_runtime\_var) | n/a | `string` | `"custom-container"` | no |
| <a name="input_timeout_var"></a> [timeout\_var](#input\_timeout\_var) | n/a | `string` | `"60"` | no |
<!-- END_TF_DOCS -->    