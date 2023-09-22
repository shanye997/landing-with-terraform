<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_waf_domain.domain](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/waf_domain) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_waf_instances.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/waf_instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_type_var"></a> [cluster\_type\_var](#input\_cluster\_type\_var) | n/a | `string` | `"PhysicalCluster"` | no |
| <a name="input_connection_time_var"></a> [connection\_time\_var](#input\_connection\_time\_var) | n/a | `string` | `"30"` | no |
| <a name="input_http_to_user_ip_var"></a> [http\_to\_user\_ip\_var](#input\_http\_to\_user\_ip\_var) | n/a | `string` | `"Off"` | no |
| <a name="input_https_redirect_var"></a> [https\_redirect\_var](#input\_https\_redirect\_var) | n/a | `string` | `"Off"` | no |
| <a name="input_is_access_product_var"></a> [is\_access\_product\_var](#input\_is\_access\_product\_var) | n/a | `string` | `"Off"` | no |
| <a name="input_load_balancing_var"></a> [load\_balancing\_var](#input\_load\_balancing\_var) | n/a | `string` | `"IpHash"` | no |
| <a name="input_read_time_var"></a> [read\_time\_var](#input\_read\_time\_var) | n/a | `string` | `"140"` | no |
| <a name="input_write_time_var"></a> [write\_time\_var](#input\_write\_time\_var) | n/a | `string` | `"800"` | no |
<!-- END_TF_DOCS -->    