<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_oos_template.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/oos_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content_var"></a> [content\_var](#input\_content\_var) | n/a | `string` | `"FormatVersion: OOS-2019-06-01\\nDescription: Describe instances of given status\\nParameters:\\n  Status:\\n    Type: String\\n    Description: (Required) The status of the Ecs instance.\\nTasks:\\n  - Properties:\\n      Parameters:\\n        Status: '{{ Status }}'\\n      API: DescribeInstances\\n      Service: Ecs\\n    Name: foo\\n    Action: 'ACS::ExecuteApi'"` | no |
<!-- END_TF_DOCS -->    