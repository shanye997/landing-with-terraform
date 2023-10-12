<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_slb_acl.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_acl) | resource |
| [alicloud_slb_listener.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_listener) | resource |
| [alicloud_slb_listener.default-1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_listener) | resource |
| [alicloud_slb_load_balancer.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_load_balancer) | resource |
| [alicloud_slb_server_certificate.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_server_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl_status_var"></a> [acl\_status\_var](#input\_acl\_status\_var) | n/a | `string` | `"off"` | no |
| <a name="input_acl_type_var"></a> [acl\_type\_var](#input\_acl\_type\_var) | n/a | `string` | `"white"` | no |
| <a name="input_bandwidth_var"></a> [bandwidth\_var](#input\_bandwidth\_var) | n/a | `string` | `"15"` | no |
| <a name="input_cookie_timeout_var"></a> [cookie\_timeout\_var](#input\_cookie\_timeout\_var) | n/a | `string` | `"80000"` | no |
| <a name="input_cookie_var"></a> [cookie\_var](#input\_cookie\_var) | n/a | `string` | `"testslblistenercookie"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-exampleSlbListenerConfigSpot3216"` | no |
| <a name="input_gzip_var"></a> [gzip\_var](#input\_gzip\_var) | n/a | `string` | `"false"` | no |
| <a name="input_health_check_connect_port_var"></a> [health\_check\_connect\_port\_var](#input\_health\_check\_connect\_port\_var) | n/a | `string` | `"30"` | no |
| <a name="input_health_check_domain_var"></a> [health\_check\_domain\_var](#input\_health\_check\_domain\_var) | n/a | `string` | `"al.com"` | no |
| <a name="input_health_check_http_code_var"></a> [health\_check\_http\_code\_var](#input\_health\_check\_http\_code\_var) | n/a | `string` | `"http_2xx,http_3xx"` | no |
| <a name="input_health_check_interval_var"></a> [health\_check\_interval\_var](#input\_health\_check\_interval\_var) | n/a | `string` | `"4"` | no |
| <a name="input_health_check_method_var"></a> [health\_check\_method\_var](#input\_health\_check\_method\_var) | n/a | `string` | `"get"` | no |
| <a name="input_health_check_timeout_var"></a> [health\_check\_timeout\_var](#input\_health\_check\_timeout\_var) | n/a | `string` | `"9"` | no |
| <a name="input_health_check_uri_var"></a> [health\_check\_uri\_var](#input\_health\_check\_uri\_var) | n/a | `string` | `"/con"` | no |
| <a name="input_health_check_var"></a> [health\_check\_var](#input\_health\_check\_var) | n/a | `string` | `"off"` | no |
| <a name="input_healthy_threshold_var"></a> [healthy\_threshold\_var](#input\_healthy\_threshold\_var) | n/a | `string` | `"9"` | no |
| <a name="input_idle_timeout_var"></a> [idle\_timeout\_var](#input\_idle\_timeout\_var) | n/a | `string` | `"40"` | no |
| <a name="input_ip_version"></a> [ip\_version](#input\_ip\_version) | n/a | `string` | `"ipv4"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleSlbListenerForwardConfigSpot7418"` | no |
| <a name="input_request_timeout_var"></a> [request\_timeout\_var](#input\_request\_timeout\_var) | n/a | `string` | `"90"` | no |
| <a name="input_scheduler_var"></a> [scheduler\_var](#input\_scheduler\_var) | n/a | `string` | `"rr"` | no |
| <a name="input_sticky_session_type_var"></a> [sticky\_session\_type\_var](#input\_sticky\_session\_type\_var) | n/a | `string` | `"server"` | no |
| <a name="input_sticky_session_var"></a> [sticky\_session\_var](#input\_sticky\_session\_var) | n/a | `string` | `"on"` | no |
| <a name="input_unhealthy_threshold_var"></a> [unhealthy\_threshold\_var](#input\_unhealthy\_threshold\_var) | n/a | `string` | `"9"` | no |
<!-- END_TF_DOCS -->    