<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_log_project.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_project) | resource |
| [alicloud_log_store.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_store) | resource |
| [alicloud_resource_manager_resource_group.ModifyRG](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/resource_manager_resource_group) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vpc.defaultVpc](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vpc_flow_log.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc_flow_log) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aggregation_interval_var"></a> [aggregation\_interval\_var](#input\_aggregation\_interval\_var) | n/a | `string` | `"5"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"test"` | no |
| <a name="input_flow_log_name_var"></a> [flow\_log\_name\_var](#input\_flow\_log\_name\_var) | n/a | `string` | `"tf-examplecn-hangzhouvpcflowlog13190"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouvpcflowlog13190"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"Active"` | no |
<!-- END_TF_DOCS -->    