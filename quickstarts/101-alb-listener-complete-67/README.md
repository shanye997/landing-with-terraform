<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_alb_listener.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alb_listener) | resource |
| [alicloud_alb_load_balancer.default_3](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alb_load_balancer) | resource |
| [alicloud_alb_server_group.default_4](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alb_server_group) | resource |
| [alicloud_log_project.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_project) | resource |
| [alicloud_log_store.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_store) | resource |
| [alicloud_ssl_certificates_service_certificate.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ssl_certificates_service_certificate) | resource |
| [alicloud_vswitch.vswitch_1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_vswitch.vswitch_2](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_alb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/alb_zones) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default_1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_vswitches.default_2](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_log_record_customized_headers_enabled_var"></a> [access\_log\_record\_customized\_headers\_enabled\_var](#input\_access\_log\_record\_customized\_headers\_enabled\_var) | n/a | `string` | `"false"` | no |
| <a name="input_gzip_enabled_var"></a> [gzip\_enabled\_var](#input\_gzip\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_http2_enabled_var"></a> [http2\_enabled\_var](#input\_http2\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_idle_timeout_var"></a> [idle\_timeout\_var](#input\_idle\_timeout\_var) | n/a | `string` | `"15"` | no |
| <a name="input_listener_description_var"></a> [listener\_description\_var](#input\_listener\_description\_var) | n/a | `string` | `"tf-exampleListener"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplealblistenertf-examplealblistener7462679748865348700"` | no |
| <a name="input_request_timeout_var"></a> [request\_timeout\_var](#input\_request\_timeout\_var) | n/a | `string` | `"60"` | no |
| <a name="input_security_policy_id_var"></a> [security\_policy\_id\_var](#input\_security\_policy\_id\_var) | n/a | `string` | `"tls_cipher_policy_1_0"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"Running"` | no |
<!-- END_TF_DOCS -->    