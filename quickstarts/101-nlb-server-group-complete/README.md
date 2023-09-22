<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_nlb_server_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/nlb_server_group) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_connection_drain_timeout_var"></a> [connection\_drain\_timeout\_var](#input\_connection\_drain\_timeout\_var) | n/a | `string` | `"100"` | no |
| <a name="input_connection_drain_var"></a> [connection\_drain\_var](#input\_connection\_drain\_var) | n/a | `string` | `"true"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhounlbservergroup6139"` | no |
| <a name="input_preserve_client_ip_enabled_var"></a> [preserve\_client\_ip\_enabled\_var](#input\_preserve\_client\_ip\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_scheduler_var"></a> [scheduler\_var](#input\_scheduler\_var) | n/a | `string` | `"Rr"` | no |
<!-- END_TF_DOCS -->    