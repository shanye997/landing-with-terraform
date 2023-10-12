<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_smartag_flow_log.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/smartag_flow_log) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_aging_var"></a> [active\_aging\_var](#input\_active\_aging\_var) | n/a | `string` | `"400"` | no |
| <a name="input_inactive_aging_var"></a> [inactive\_aging\_var](#input\_inactive\_aging\_var) | n/a | `string` | `"20"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleap-southeast-1smartagflowlog52897"` | no |
| <a name="input_netflow_server_ip_var"></a> [netflow\_server\_ip\_var](#input\_netflow\_server\_ip\_var) | n/a | `string` | `"192.168.0.1"` | no |
| <a name="input_netflow_server_port_var"></a> [netflow\_server\_port\_var](#input\_netflow\_server\_port\_var) | n/a | `string` | `"9999"` | no |
| <a name="input_netflow_version_var"></a> [netflow\_version\_var](#input\_netflow\_version\_var) | n/a | `string` | `"V10"` | no |
| <a name="input_output_type_var"></a> [output\_type\_var](#input\_output\_type\_var) | n/a | `string` | `"sls"` | no |
| <a name="input_sls_region_id_var"></a> [sls\_region\_id\_var](#input\_sls\_region\_id\_var) | n/a | `string` | `"ap-southeast-1"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"Active"` | no |
<!-- END_TF_DOCS -->    