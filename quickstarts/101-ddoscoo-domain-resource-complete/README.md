<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ddoscoo_domain_resource.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ddoscoo_domain_resource) | resource |
| [alicloud_ddoscoo_instances.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/ddoscoo_instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_https_ext_var"></a> [https\_ext\_var](#input\_https\_ext\_var) | n/a | `string` | `"{\\\"Http2\\\":0,\\\"Http2https\\\":0,\\\"Https2http\\\":0}"` | no |
| <a name="input_ocsp_enabled_var"></a> [ocsp\_enabled\_var](#input\_ocsp\_enabled\_var) | n/a | `string` | `"false"` | no |
| <a name="input_rs_type_var"></a> [rs\_type\_var](#input\_rs\_type\_var) | n/a | `string` | `"0"` | no |
<!-- END_TF_DOCS -->    