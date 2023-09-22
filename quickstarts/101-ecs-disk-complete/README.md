<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ecs_disk.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_disk) | resource |
| [alicloud_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/instance) | resource |
| [alicloud_kms_key.key](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_key) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_category_var"></a> [category\_var](#input\_category\_var) | n/a | `string` | `"cloud_essd"` | no |
| <a name="input_delete_auto_snapshot_var"></a> [delete\_auto\_snapshot\_var](#input\_delete\_auto\_snapshot\_var) | n/a | `string` | `"false"` | no |
| <a name="input_delete_with_instance_var"></a> [delete\_with\_instance\_var](#input\_delete\_with\_instance\_var) | n/a | `string` | `"false"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"Test For Terraform"` | no |
| <a name="input_disk_name_var"></a> [disk\_name\_var](#input\_disk\_name\_var) | n/a | `string` | `"tf-examplecn-hangzhouecsdisk38197"` | no |
| <a name="input_enable_auto_snapshot_var"></a> [enable\_auto\_snapshot\_var](#input\_enable\_auto\_snapshot\_var) | n/a | `string` | `"false"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouecsdisk38197"` | no |
| <a name="input_payment_type_var"></a> [payment\_type\_var](#input\_payment\_type\_var) | n/a | `string` | `"PayAsYouGo"` | no |
| <a name="input_performance_level_var"></a> [performance\_level\_var](#input\_performance\_level\_var) | n/a | `string` | `"PL1"` | no |
| <a name="input_size_var"></a> [size\_var](#input\_size\_var) | n/a | `string` | `"800"` | no |
<!-- END_TF_DOCS -->    