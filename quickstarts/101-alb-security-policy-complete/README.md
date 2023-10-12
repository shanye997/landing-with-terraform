<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_alb_security_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alb_security_policy) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dry_run_var"></a> [dry\_run\_var](#input\_dry\_run\_var) | n/a | `string` | `"false"` | no |
| <a name="input_security_policy_name_var"></a> [security\_policy\_name\_var](#input\_security\_policy\_name\_var) | n/a | `string` | `"tf-example-test-secrity"` | no |
<!-- END_TF_DOCS -->    