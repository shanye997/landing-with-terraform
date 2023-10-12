<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_alidns_record.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alidns_record) | resource |
| [alicloud_dns.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dns) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rr_var"></a> [rr\_var](#input\_rr\_var) | n/a | `string` | `"alimail"` | no |
| <a name="input_type_var"></a> [type\_var](#input\_type\_var) | n/a | `string` | `"CNAME"` | no |
| <a name="input_value_var"></a> [value\_var](#input\_value\_var) | n/a | `string` | `"mail.mxhichin.com"` | no |
<!-- END_TF_DOCS -->    