<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_fc_function.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/fc_function) | resource |
| [alicloud_fc_service.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/fc_service) | resource |
| [alicloud_log_project.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_project) | resource |
| [alicloud_log_store.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_store) | resource |
| [alicloud_ram_role.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role) | resource |
| [alicloud_ram_role_policy_attachment.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role_policy_attachment) | resource |
| [alicloud_file_crc64_checksum.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/file_crc64_checksum) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ca_port_var"></a> [ca\_port\_var](#input\_ca\_port\_var) | n/a | `string` | `"9527"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf"` | no |
| <a name="input_filename_var"></a> [filename\_var](#input\_filename\_var) | n/a | `string` | `"/var/folders/2g/75_g3cg150q53lpr1h28sg5m0000gp/T/tf-examplealicloudfcfunction-127953.zip"` | no |
| <a name="input_handler_var"></a> [handler\_var](#input\_handler\_var) | n/a | `string` | `"fake"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplealicloudfcfunction-127953"` | no |
| <a name="input_runtime_var"></a> [runtime\_var](#input\_runtime\_var) | n/a | `string` | `"custom"` | no |
<!-- END_TF_DOCS -->    