<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_fnf_flow.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/fnf_flow) | resource |
| [alicloud_ram_role.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_definition_var"></a> [definition\_var](#input\_definition\_var) | n/a | `string` | `"version: v1beta1\\ntype: flow\\nsteps:\\n  - type: pass\\n    name: helloworld"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-exampleFnFFlow983041"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleap-southeast-1AlicloudFnfFlow7653"` | no |
| <a name="input_type_var"></a> [type\_var](#input\_type\_var) | n/a | `string` | `"FDL"` | no |
<!-- END_TF_DOCS -->    