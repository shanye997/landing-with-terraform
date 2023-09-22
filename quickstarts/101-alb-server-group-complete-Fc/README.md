<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_alb_server_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alb_server_group) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dry_run_var"></a> [dry\_run\_var](#input\_dry\_run\_var) | n/a | `string` | `"false"` | no |
| <a name="input_server_group_name_var"></a> [server\_group\_name\_var](#input\_server\_group\_name\_var) | n/a | `string` | `"tf-example-new"` | no |
<!-- END_TF_DOCS -->    