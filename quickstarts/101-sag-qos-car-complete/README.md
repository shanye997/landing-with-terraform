<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_sag_qos.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/sag_qos) | resource |
| [alicloud_sag_qos_car.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/sag_qos_car) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-testSagQosCarDescription"` | no |
| <a name="input_limit_type_var"></a> [limit\_type\_var](#input\_limit\_type\_var) | n/a | `string` | `"Absolute"` | no |
| <a name="input_max_bandwidth_abs_var"></a> [max\_bandwidth\_abs\_var](#input\_max\_bandwidth\_abs\_var) | n/a | `string` | `"12"` | no |
| <a name="input_min_bandwidth_abs_var"></a> [min\_bandwidth\_abs\_var](#input\_min\_bandwidth\_abs\_var) | n/a | `string` | `"8"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-testQosCarName"` | no |
| <a name="input_name_var"></a> [name\_var](#input\_name\_var) | n/a | `string` | `"tf-testQosCarName"` | no |
| <a name="input_priority_var"></a> [priority\_var](#input\_priority\_var) | n/a | `string` | `"1"` | no |
<!-- END_TF_DOCS -->    