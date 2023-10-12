<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_datahub_project.basic](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/datahub_project) | resource |
| [alicloud_datahub_subscription.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/datahub_subscription) | resource |
| [alicloud_datahub_topic.basic](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/datahub_topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comment_var"></a> [comment\_var](#input\_comment\_var) | n/a | `string` | `"subscription for basic."` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | `"tf_example_datahub_project407748"` | no |
| <a name="input_record_type"></a> [record\_type](#input\_record\_type) | n/a | `string` | `"BLOB"` | no |
| <a name="input_topic_name"></a> [topic\_name](#input\_topic\_name) | n/a | `string` | `"tf_example_datahub_topic"` | no |
<!-- END_TF_DOCS -->    