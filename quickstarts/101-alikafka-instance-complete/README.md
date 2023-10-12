<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_alikafka_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alikafka_instance) | resource |
| [alicloud_kms_key.key](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_key) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deploy_type_var"></a> [deploy\_type\_var](#input\_deploy\_type\_var) | n/a | `string` | `"4"` | no |
| <a name="input_disk_size_var"></a> [disk\_size\_var](#input\_disk\_size\_var) | n/a | `string` | `"800"` | no |
| <a name="input_eip_max_var"></a> [eip\_max\_var](#input\_eip\_max\_var) | n/a | `string` | `"3"` | no |
| <a name="input_io_max_spec_var"></a> [io\_max\_spec\_var](#input\_io\_max\_spec\_var) | n/a | `string` | `"alikafka.hw.3xlarge"` | no |
| <a name="input_io_max_var"></a> [io\_max\_var](#input\_io\_max\_var) | n/a | `string` | `"30"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example-alikafkainstancebasic8349976482488520919"` | no |
| <a name="input_name_var"></a> [name\_var](#input\_name\_var) | n/a | `string` | `"tf-example-alikafkainstancechange8349976482488520919"` | no |
| <a name="input_paid_type_var"></a> [paid\_type\_var](#input\_paid\_type\_var) | n/a | `string` | `"PrePaid"` | no |
| <a name="input_partition_num_var"></a> [partition\_num\_var](#input\_partition\_num\_var) | n/a | `string` | `"1"` | no |
| <a name="input_service_version_var"></a> [service\_version\_var](#input\_service\_version\_var) | n/a | `string` | `"2.2.0"` | no |
| <a name="input_spec_type_var"></a> [spec\_type\_var](#input\_spec\_type\_var) | n/a | `string` | `"professional"` | no |
<!-- END_TF_DOCS -->    