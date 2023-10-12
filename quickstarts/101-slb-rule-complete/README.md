<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/instance) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_slb_listener.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_listener) | resource |
| [alicloud_slb_load_balancer.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_load_balancer) | resource |
| [alicloud_slb_rule.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_rule) | resource |
| [alicloud_slb_server_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_server_group) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_slb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/slb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cookie_timeout_var"></a> [cookie\_timeout\_var](#input\_cookie\_timeout\_var) | n/a | `string` | `"100"` | no |
| <a name="input_cookie_var"></a> [cookie\_var](#input\_cookie\_var) | n/a | `string` | `"23ffsa"` | no |
| <a name="input_health_check_connect_port_var"></a> [health\_check\_connect\_port\_var](#input\_health\_check\_connect\_port\_var) | n/a | `string` | `"80"` | no |
| <a name="input_health_check_domain_var"></a> [health\_check\_domain\_var](#input\_health\_check\_domain\_var) | n/a | `string` | `"test"` | no |
| <a name="input_health_check_http_code_var"></a> [health\_check\_http\_code\_var](#input\_health\_check\_http\_code\_var) | n/a | `string` | `"http_2xx"` | no |
| <a name="input_health_check_interval_var"></a> [health\_check\_interval\_var](#input\_health\_check\_interval\_var) | n/a | `string` | `"10"` | no |
| <a name="input_health_check_timeout_var"></a> [health\_check\_timeout\_var](#input\_health\_check\_timeout\_var) | n/a | `string` | `"10"` | no |
| <a name="input_health_check_uri_var"></a> [health\_check\_uri\_var](#input\_health\_check\_uri\_var) | n/a | `string` | `"/test"` | no |
| <a name="input_health_check_var"></a> [health\_check\_var](#input\_health\_check\_var) | n/a | `string` | `"on"` | no |
| <a name="input_healthy_threshold_var"></a> [healthy\_threshold\_var](#input\_healthy\_threshold\_var) | n/a | `string` | `"3"` | no |
| <a name="input_listener_sync_var"></a> [listener\_sync\_var](#input\_listener\_sync\_var) | n/a | `string` | `"off"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleSlbRuleBasic"` | no |
| <a name="input_scheduler_var"></a> [scheduler\_var](#input\_scheduler\_var) | n/a | `string` | `"rr"` | no |
| <a name="input_sticky_session_type_var"></a> [sticky\_session\_type\_var](#input\_sticky\_session\_type\_var) | n/a | `string` | `"server"` | no |
| <a name="input_sticky_session_var"></a> [sticky\_session\_var](#input\_sticky\_session\_var) | n/a | `string` | `"on"` | no |
| <a name="input_unhealthy_threshold_var"></a> [unhealthy\_threshold\_var](#input\_unhealthy\_threshold\_var) | n/a | `string` | `"3"` | no |
<!-- END_TF_DOCS -->    