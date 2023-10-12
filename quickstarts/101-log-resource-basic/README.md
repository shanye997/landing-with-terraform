<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_log_resource.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/log_resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_schema_var"></a> [schema\_var](#input\_schema\_var) | n/a | `string` | `"{\\\"schema\\\": [{\\\"desc\\\": \\\"whitelist ip range new\\\", \\\"type\\\": \\\"string\\\", \\\"column\\\": \\\"ip\\\", \\\"indexed\\\": false, \\\"ext_info\\\": {}, \\\"required\\\": true}]}"` | no |
| <a name="input_type_var"></a> [type\_var](#input\_type\_var) | n/a | `string` | `"userdefine"` | no |
<!-- END_TF_DOCS -->    