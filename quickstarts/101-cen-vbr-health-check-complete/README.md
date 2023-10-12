<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cen_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_instance) | resource |
| [alicloud_cen_vbr_health_check.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_vbr_health_check) | resource |
| [alicloud_express_connect_virtual_border_router.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/express_connect_virtual_border_router) | resource |
| [alicloud_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |
| [alicloud_express_connect_physical_connections.nameRegex](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/express_connect_physical_connections) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_health_check_interval_var"></a> [health\_check\_interval\_var](#input\_health\_check\_interval\_var) | n/a | `string` | `"2"` | no |
| <a name="input_health_check_source_ip_var"></a> [health\_check\_source\_ip\_var](#input\_health\_check\_source\_ip\_var) | n/a | `string` | `"192.168.1.2"` | no |
| <a name="input_health_check_target_ip_var"></a> [health\_check\_target\_ip\_var](#input\_health\_check\_target\_ip\_var) | n/a | `string` | `"10.0.0.2"` | no |
| <a name="input_healthy_threshold_var"></a> [healthy\_threshold\_var](#input\_healthy\_threshold\_var) | n/a | `string` | `"8"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleCenVbrHealthCheck1100"` | no |
<!-- END_TF_DOCS -->    