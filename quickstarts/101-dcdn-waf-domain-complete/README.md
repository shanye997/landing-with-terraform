<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_dcdn_domain.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dcdn_domain) | resource |
| [alicloud_dcdn_waf_domain.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dcdn_waf_domain) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_ip_tag_var"></a> [client\_ip\_tag\_var](#input\_client\_ip\_tag\_var) | n/a | `string` | `"X-Forwarded-For"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | n/a | `string` | `"tf-examplecn-hangzhou52709.alicloud-provider.cn"` | no |
<!-- END_TF_DOCS -->    