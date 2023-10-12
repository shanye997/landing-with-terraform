<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_oos_template.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/oos_template) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content_var"></a> [content\_var](#input\_content\_var) | n/a | `string` | `"FormatVersion: OOS-2019-06-01\\nDescription: Describe instances of given status\\nParameters:\\n  Status:\\n    Type: String\\n    Description: (Required) The status of the Ecs instance.\\nTasks:\\n  - Properties:\\n      Parameters:\\n        Status: '{{ Status }}'\\n      API: DescribeInstances\\n      Service: Ecs\\n    Name: foo\\n    Action: 'ACS::ExecuteApi'"` | no |
| <a name="input_version_name_var"></a> [version\_name\_var](#input\_version\_name\_var) | n/a | `string` | `"test3"` | no |
<!-- END_TF_DOCS -->    