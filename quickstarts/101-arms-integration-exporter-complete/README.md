<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_arms_integration_exporter.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/arms_integration_exporter) | resource |
| [alicloud_arms_prometheus.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/arms_prometheus) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example-ArmsIE60"` | no |
| <a name="input_param_var"></a> [param\_var](#input\_param\_var) | n/a | `string` | `"{\\\"tls_insecure-skip-tls-verify\\\":\\\"none=tls.insecure-skip-tls-verify\\\",\\\"tls_enabled\\\":\\\"none=tls.enabled\\\",\\\"sasl_mechanism\\\":\\\"\\\",\\\"name\\\":\\\"kafka1\\\",\\\"sasl_enabled\\\":\\\"none=sasl.enabled\\\",\\\"ip_ports\\\":\\\"abc:888\\\",\\\"scrape_interval\\\":30,\\\"version\\\":\\\"0.10.1.0\\\"}"` | no |
<!-- END_TF_DOCS -->    