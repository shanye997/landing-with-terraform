<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_dns.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dns) | resource |
| [alicloud_dns_record.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dns_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_host_record_var"></a> [host\_record\_var](#input\_host\_record\_var) | n/a | `string` | `"alimail"` | no |
| <a name="input_priority_var"></a> [priority\_var](#input\_priority\_var) | n/a | `string` | `"1"` | no |
| <a name="input_routing_var"></a> [routing\_var](#input\_routing\_var) | n/a | `string` | `"default"` | no |
| <a name="input_ttl_var"></a> [ttl\_var](#input\_ttl\_var) | n/a | `string` | `"600"` | no |
| <a name="input_type_var"></a> [type\_var](#input\_type\_var) | n/a | `string` | `"CNAME"` | no |
| <a name="input_value_var"></a> [value\_var](#input\_value\_var) | n/a | `string` | `"mail.mxhichin.com"` | no |
<!-- END_TF_DOCS -->    