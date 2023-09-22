<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_nlb_listener.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nlb_listener) | resource |
| [alicloud_nlb_load_balancer.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nlb_load_balancer) | resource |
| [alicloud_nlb_server_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nlb_server_group) | resource |
| [alicloud_nlb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/nlb_zones) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default_1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_vswitches.default_2](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cps_var"></a> [cps\_var](#input\_cps\_var) | n/a | `string` | `"10000"` | no |
| <a name="input_idle_timeout_var"></a> [idle\_timeout\_var](#input\_idle\_timeout\_var) | n/a | `string` | `"900"` | no |
| <a name="input_mss_var"></a> [mss\_var](#input\_mss\_var) | n/a | `string` | `"0"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhounlblistener2363"` | no |
| <a name="input_proxy_protocol_enabled_var"></a> [proxy\_protocol\_enabled\_var](#input\_proxy\_protocol\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_sec_sensor_enabled_var"></a> [sec\_sensor\_enabled\_var](#input\_sec\_sensor\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"Running"` | no |
<!-- END_TF_DOCS -->    