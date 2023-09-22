<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_alb_ascript.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alb_ascript) | resource |
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
| <a name="input_ascript_name_var"></a> [ascript\_name\_var](#input\_ascript\_name\_var) | n/a | `string` | `"test"` | no |
| <a name="input_enabled_var"></a> [enabled\_var](#input\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_ext_attribute_enabled_var"></a> [ext\_attribute\_enabled\_var](#input\_ext\_attribute\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplealbascript471"` | no |
| <a name="input_port"></a> [port](#input\_port) | n/a | `string` | `"3366"` | no |
| <a name="input_script_content_var"></a> [script\_content\_var](#input\_script\_content\_var) | n/a | `string` | `"now()"` | no |
<!-- END_TF_DOCS -->    