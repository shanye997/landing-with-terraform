<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_reserved_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/reserved_instance) | resource |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_renew_period_var"></a> [auto\_renew\_period\_var](#input\_auto\_renew\_period\_var) | n/a | `string` | `"36"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"ReservedInstance"` | no |
| <a name="input_renewal_status_var"></a> [renewal\_status\_var](#input\_renewal\_status\_var) | n/a | `string` | `"Normal"` | no |
| <a name="input_reserved_instance_name_var"></a> [reserved\_instance\_name\_var](#input\_reserved\_instance\_name\_var) | n/a | `string` | `"tf-exampleEcsReservedInstanceConfigBasic7652change"` | no |
<!-- END_TF_DOCS -->    