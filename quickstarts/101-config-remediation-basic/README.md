<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_config_remediation.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/config_remediation) | resource |
| [alicloud_config_rule.prerequirement-rule](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/config_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_invoke_type_var"></a> [invoke\_type\_var](#input\_invoke\_type\_var) | n/a | `string` | `"MANUAL_EXECUTION"` | no |
| <a name="input_params_var"></a> [params\_var](#input\_params\_var) | n/a | `string` | `"{\\\"regionId\\\":\\\"{regionId}\\\",\\\"tags\\\":\\\"{\\\\\\\"terraform\\\\\\\":\\\\\\\"terraform\\\\\\\"}\\\",\\\"resourceType\\\":\\\"{resourceType}\\\",\\\"resourceIds\\\":\\\"{resourceId}\\\"}"` | no |
| <a name="input_remediation_template_id_var"></a> [remediation\_template\_id\_var](#input\_remediation\_template\_id\_var) | n/a | `string` | `"ACS-TAG-TagResources"` | no |
<!-- END_TF_DOCS -->    