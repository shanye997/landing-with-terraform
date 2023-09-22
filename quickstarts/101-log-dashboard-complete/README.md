<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_log_dashboard.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_dashboard) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attribute_var"></a> [attribute\_var](#input\_attribute\_var) | n/a | `string` | `"{\\\"type\\\":\\\"grid\\\"}"` | no |
| <a name="input_char_list_var"></a> [char\_list\_var](#input\_char\_list\_var) | n/a | `string` | `"[{\\\"action\\\":{},\\\"title\\\":\\\"upadte_title_3\\\",\\\"type\\\":\\\"map\\\",\\\"search\\\":{\\\"logstore\\\":\\\"new_logstore\\\",\\\"topic\\\":\\\"new_topic\\\",\\\"query\\\":\\\"method:  GET  | select  ip_to_province(remote_addr) as province , count(1) as pv group by province order by pv desc \\\",\\\"start\\\":\\\"-86400s\\\",\\\"end\\\":\\\"\\\"},\\\"display\\\":{\\\"xAxis\\\":[\\\"province\\\"],\\\"yAxis\\\":[\\\"aini\\\"],\\\"xPos\\\":0,\\\"yPos\\\":0,\\\"width\\\":10,\\\"height\\\":12,\\\"displayName\\\":\\\"xixihaha911\\\"}}]"` | no |
| <a name="input_display_name_var"></a> [display\_name\_var](#input\_display\_name\_var) | n/a | `string` | `"update_name"` | no |
<!-- END_TF_DOCS -->    