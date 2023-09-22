<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ocean_base_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ocean_base_instance) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_renew_period_var"></a> [auto\_renew\_period\_var](#input\_auto\_renew\_period\_var) | n/a | `string` | `"1"` | no |
| <a name="input_auto_renew_var"></a> [auto\_renew\_var](#input\_auto\_renew\_var) | n/a | `string` | `"false"` | no |
| <a name="input_backup_retain_mode_var"></a> [backup\_retain\_mode\_var](#input\_backup\_retain\_mode\_var) | n/a | `string` | `"delete_all"` | no |
| <a name="input_disk_size_var"></a> [disk\_size\_var](#input\_disk\_size\_var) | n/a | `string` | `"300"` | no |
| <a name="input_instance_class_var"></a> [instance\_class\_var](#input\_instance\_class\_var) | n/a | `string` | `"4C16GB"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example325"` | no |
| <a name="input_period_unit_var"></a> [period\_unit\_var](#input\_period\_unit\_var) | n/a | `string` | `"Month"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"1"` | no |
<!-- END_TF_DOCS -->    