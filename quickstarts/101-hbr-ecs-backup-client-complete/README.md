<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_hbr_ecs_backup_client.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_ecs_backup_client) | resource |
| [alicloud_instances.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_network_type_var"></a> [data\_network\_type\_var](#input\_data\_network\_type\_var) | n/a | `string` | `"PUBLIC"` | no |
| <a name="input_data_proxy_setting_var"></a> [data\_proxy\_setting\_var](#input\_data\_proxy\_setting\_var) | n/a | `string` | `"USE_CONTROL_PROXY"` | no |
| <a name="input_max_cpu_core_var"></a> [max\_cpu\_core\_var](#input\_max\_cpu\_core\_var) | n/a | `string` | `"2"` | no |
| <a name="input_max_worker_var"></a> [max\_worker\_var](#input\_max\_worker\_var) | n/a | `string` | `"4"` | no |
| <a name="input_proxy_host_var"></a> [proxy\_host\_var](#input\_proxy\_host\_var) | n/a | `string` | `"192.168.11.101"` | no |
| <a name="input_proxy_password_var"></a> [proxy\_password\_var](#input\_proxy\_password\_var) | n/a | `string` | `"password"` | no |
| <a name="input_proxy_port_var"></a> [proxy\_port\_var](#input\_proxy\_port\_var) | n/a | `string` | `"80"` | no |
| <a name="input_proxy_user_var"></a> [proxy\_user\_var](#input\_proxy\_user\_var) | n/a | `string` | `"user"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"ACTIVATED"` | no |
| <a name="input_use_https_var"></a> [use\_https\_var](#input\_use\_https\_var) | n/a | `string` | `"false"` | no |
<!-- END_TF_DOCS -->    