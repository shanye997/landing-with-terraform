<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ddos_basic_defense_threshold.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ddos_basic_defense_threshold) | resource |
| [alicloud_eip_address.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/eip_address) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bps_var"></a> [bps\_var](#input\_bps\_var) | n/a | `string` | `"400"` | no |
| <a name="input_is_auto_var"></a> [is\_auto\_var](#input\_is\_auto\_var) | n/a | `string` | `"false"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouddosbasicantiddos10400"` | no |
| <a name="input_pps_var"></a> [pps\_var](#input\_pps\_var) | n/a | `string` | `"80000"` | no |
<!-- END_TF_DOCS -->    