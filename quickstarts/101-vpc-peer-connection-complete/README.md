<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |
| <a name="provider_alicloud.accepting"></a> [alicloud.accepting](#provider\_alicloud.accepting) | n/a |
| <a name="provider_alicloud.local"></a> [alicloud.local](#provider\_alicloud.local) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_vpc_peer_connection.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc_peer_connection) | resource |
| [alicloud_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vpcs.default1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accepting_region"></a> [accepting\_region](#input\_accepting\_region) | n/a | `string` | `"cn-beijing"` | no |
| <a name="input_bandwidth_var"></a> [bandwidth\_var](#input\_bandwidth\_var) | n/a | `string` | `"100"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouvpcpeerconnection41905"` | no |
<!-- END_TF_DOCS -->    