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
| [alicloud_slb_load_balancer.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_load_balancer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl_status_var"></a> [acl\_status\_var](#input\_acl\_status\_var) | n/a | `string` | `"on"` | no |
| <a name="input_acl_type_var"></a> [acl\_type\_var](#input\_acl\_type\_var) | n/a | `string` | `"black"` | no |
| <a name="input_bandwidth_var"></a> [bandwidth\_var](#input\_bandwidth\_var) | n/a | `string` | `"15"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-exampleSlbListenerConfigSpot2029"` | no |
| <a name="input_health_check_connect_port_var"></a> [health\_check\_connect\_port\_var](#input\_health\_check\_connect\_port\_var) | n/a | `string` | `"30"` | no |
| <a name="input_health_check_interval_var"></a> [health\_check\_interval\_var](#input\_health\_check\_interval\_var) | n/a | `string` | `"5"` | no |
| <a name="input_health_check_timeout_var"></a> [health\_check\_timeout\_var](#input\_health\_check\_timeout\_var) | n/a | `string` | `"9"` | no |
| <a name="input_healthy_threshold_var"></a> [healthy\_threshold\_var](#input\_healthy\_threshold\_var) | n/a | `string` | `"9"` | no |
| <a name="input_ip_version"></a> [ip\_version](#input\_ip\_version) | n/a | `string` | `"ipv4"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleSlbListenerConfigSpot2029"` | no |
| <a name="input_persistence_timeout_var"></a> [persistence\_timeout\_var](#input\_persistence\_timeout\_var) | n/a | `string` | `"3000"` | no |
| <a name="input_proxy_protocol_v2_enabled_var"></a> [proxy\_protocol\_v2\_enabled\_var](#input\_proxy\_protocol\_v2\_enabled\_var) | n/a | `string` | `"false"` | no |
| <a name="input_scheduler_var"></a> [scheduler\_var](#input\_scheduler\_var) | n/a | `string` | `"wrr"` | no |
| <a name="input_unhealthy_threshold_var"></a> [unhealthy\_threshold\_var](#input\_unhealthy\_threshold\_var) | n/a | `string` | `"9"` | no |
<!-- END_TF_DOCS -->    