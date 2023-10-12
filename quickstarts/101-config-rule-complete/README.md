<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_config_rule.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/config_rule) | resource |
| [alicloud_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/instance) | resource |
| [alicloud_resource_manager_resource_group.example](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/resource_manager_resource_group) | resource |
| [alicloud_security_group.tf_test_foo](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vpc.foo](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.foo](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_instances.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instances) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_rule_trigger_types_var"></a> [config\_rule\_trigger\_types\_var](#input\_config\_rule\_trigger\_types\_var) | n/a | `string` | `"ConfigurationItemChangeNotification"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"test_rule"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleConfigRule7879870"` | no |
| <a name="input_region_ids_scope_var"></a> [region\_ids\_scope\_var](#input\_region\_ids\_scope\_var) | n/a | `string` | `"cn-beijing"` | no |
| <a name="input_risk_level_var"></a> [risk\_level\_var](#input\_risk\_level\_var) | n/a | `string` | `"1"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"ACTIVE"` | no |
| <a name="input_tag_key_scope_var"></a> [tag\_key\_scope\_var](#input\_tag\_key\_scope\_var) | n/a | `string` | `"tfTest123"` | no |
| <a name="input_tag_value_scope_var"></a> [tag\_value\_scope\_var](#input\_tag\_value\_scope\_var) | n/a | `string` | `"tfTest 123 Update"` | no |
<!-- END_TF_DOCS -->    