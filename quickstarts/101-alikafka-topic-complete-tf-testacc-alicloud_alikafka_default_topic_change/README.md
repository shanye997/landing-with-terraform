<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_alikafka_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alikafka_instance) | resource |
| [alicloud_alikafka_topic.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alikafka_topic) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example-alikafkatopicbasic5321803454339219077"` | no |
| <a name="input_partition_num_var"></a> [partition\_num\_var](#input\_partition\_num\_var) | n/a | `string` | `"9"` | no |
| <a name="input_remark_var"></a> [remark\_var](#input\_remark\_var) | n/a | `string` | `"modified remark"` | no |
<!-- END_TF_DOCS -->    