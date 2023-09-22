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
| [alicloud_slb_acl.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_acl) | resource |
| [alicloud_slb_listener.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_listener) | resource |
| [alicloud_slb_load_balancer.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_load_balancer) | resource |
| [alicloud_slb_master_slave_server_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_master_slave_server_group) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl_status_var"></a> [acl\_status\_var](#input\_acl\_status\_var) | n/a | `string` | `"on"` | no |
| <a name="input_acl_type_var"></a> [acl\_type\_var](#input\_acl\_type\_var) | n/a | `string` | `"black"` | no |
| <a name="input_bandwidth_var"></a> [bandwidth\_var](#input\_bandwidth\_var) | n/a | `string` | `"10"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-exampleSlbListenerConfigSpot1906"` | no |
| <a name="input_established_timeout_var"></a> [established\_timeout\_var](#input\_established\_timeout\_var) | n/a | `string` | `"500"` | no |
| <a name="input_health_check_connect_port_var"></a> [health\_check\_connect\_port\_var](#input\_health\_check\_connect\_port\_var) | n/a | `string` | `"30"` | no |
| <a name="input_health_check_domain_var"></a> [health\_check\_domain\_var](#input\_health\_check\_domain\_var) | n/a | `string` | `""` | no |
| <a name="input_health_check_http_code_var"></a> [health\_check\_http\_code\_var](#input\_health\_check\_http\_code\_var) | n/a | `string` | `"http_2xx,http_3xx"` | no |
| <a name="input_health_check_interval_var"></a> [health\_check\_interval\_var](#input\_health\_check\_interval\_var) | n/a | `string` | `"4"` | no |
| <a name="input_health_check_timeout_var"></a> [health\_check\_timeout\_var](#input\_health\_check\_timeout\_var) | n/a | `string` | `"9"` | no |
| <a name="input_health_check_type_var"></a> [health\_check\_type\_var](#input\_health\_check\_type\_var) | n/a | `string` | `"tcp"` | no |
| <a name="input_health_check_uri_var"></a> [health\_check\_uri\_var](#input\_health\_check\_uri\_var) | n/a | `string` | `"/cn"` | no |
| <a name="input_healthy_threshold_var"></a> [healthy\_threshold\_var](#input\_healthy\_threshold\_var) | n/a | `string` | `"9"` | no |
| <a name="input_ip_version"></a> [ip\_version](#input\_ip\_version) | n/a | `string` | `"ipv4"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleSlbListenerConfigSpot1906"` | no |
| <a name="input_persistence_timeout_var"></a> [persistence\_timeout\_var](#input\_persistence\_timeout\_var) | n/a | `string` | `"3000"` | no |
| <a name="input_proxy_protocol_v2_enabled_var"></a> [proxy\_protocol\_v2\_enabled\_var](#input\_proxy\_protocol\_v2\_enabled\_var) | n/a | `string` | `"false"` | no |
| <a name="input_scheduler_var"></a> [scheduler\_var](#input\_scheduler\_var) | n/a | `string` | `"wrr"` | no |
| <a name="input_server_group_id_var"></a> [server\_group\_id\_var](#input\_server\_group\_id\_var) | n/a | `string` | `""` | no |
| <a name="input_unhealthy_threshold_var"></a> [unhealthy\_threshold\_var](#input\_unhealthy\_threshold\_var) | n/a | `string` | `"9"` | no |
<!-- END_TF_DOCS -->    