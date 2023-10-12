<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_brain_industrial_pid_loop.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/brain_industrial_pid_loop) | resource |
| [alicloud_brain_industrial_pid_organization.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/brain_industrial_pid_organization) | resource |
| [alicloud_brain_industrial_pid_project.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/brain_industrial_pid_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pid_loop_configuration_var"></a> [pid\_loop\_configuration\_var](#input\_pid\_loop\_configuration\_var) | n/a | `string` | `"{\\\"baseParam\\\":{\\\"forwardController\\\":false,\\\"integral\\\":false,\\\"kd\\\":{\\\"tagValue\\\":\\\"20\\\"},\\\"kp\\\":{},\\\"op\\\":\\\"PIDBenchmark.FOPDT_OP\\\",\\\"opParam\\\":{\\\"increment\\\":{\\\"max\\\":10},\\\"operate\\\":{\\\"max\\\":115,\\\"min\\\":-15},\\\"range\\\":{\\\"max\\\":115,\\\"min\\\":-15},\\\"trend\\\":0},\\\"openLoopTime\\\":150,\\\"pv\\\":\\\"PIDBenchmark.FOPDT_PV\\\",\\\"pvRange\\\":{\\\"max\\\":100,\\\"min\\\":0},\\\"sampleTime\\\":5,\\\"sp\\\":\\\"PIDBenchmark.FOPDT_SP\\\",\\\"spOperate\\\":{\\\"max\\\":100,\\\"min\\\":0},\\\"splitRangeControl\\\":false,\\\"suitCtrlTime\\\":100,\\\"td\\\":{},\\\"ti\\\":{}},\\\"identParam\\\":{\\\"delay\\\":10,\\\"modelType\\\":3},\\\"resetParam\\\":{\\\"ctrlMode\\\":0,\\\"ctrlStuc\\\":1}}"` | no |
| <a name="input_pid_loop_is_crucial_var"></a> [pid\_loop\_is\_crucial\_var](#input\_pid\_loop\_is\_crucial\_var) | n/a | `string` | `"false"` | no |
| <a name="input_pid_loop_name_var"></a> [pid\_loop\_name\_var](#input\_pid\_loop\_name\_var) | n/a | `string` | `"tf-example71459"` | no |
| <a name="input_pid_loop_type_var"></a> [pid\_loop\_type\_var](#input\_pid\_loop\_type\_var) | n/a | `string` | `"0"` | no |
<!-- END_TF_DOCS -->    