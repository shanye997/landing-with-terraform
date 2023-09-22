<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_vpc_dhcp_options_set.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc_dhcp_options_set) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name_servers_var"></a> [domain\_name\_servers\_var](#input\_domain\_name\_servers\_var) | n/a | `string` | `"100.100.2.138"` | no |
| <a name="input_domain_name_var"></a> [domain\_name\_var](#input\_domain\_name\_var) | n/a | `string` | `"updatetfexample47149.com"` | no |
| <a name="input_dry_run_var"></a> [dry\_run\_var](#input\_dry\_run\_var) | n/a | `string` | `"false"` | no |
| <a name="input_ipv6_lease_time_var"></a> [ipv6\_lease\_time\_var](#input\_ipv6\_lease\_time\_var) | n/a | `string` | `"48h"` | no |
| <a name="input_lease_time_var"></a> [lease\_time\_var](#input\_lease\_time\_var) | n/a | `string` | `"48h"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouvpcdhcpoptionsset47149"` | no |
<!-- END_TF_DOCS -->    