<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cloud_firewall_vpc_firewall.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cloud_firewall_vpc_firewall) | resource |
| [alicloud_account.current](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |
| [alicloud_route_tables.local_peer](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/route_tables) | data source |
| [alicloud_route_tables.local_vpc](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/route_tables) | data source |
| [alicloud_vpc_peer_connections.cfw_vpc_peer](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpc_peer_connections) | data source |
| [alicloud_vpcs.vpcs_ds](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vpcs.vpcs_ds_peer](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lang_var"></a> [lang\_var](#input\_lang\_var) | n/a | `string` | `"en"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"close"` | no |
| <a name="input_vpc_firewall_name_var"></a> [vpc\_firewall\_name\_var](#input\_vpc\_firewall\_name\_var) | n/a | `string` | `"tf-examplecn-hangzhouCloudfirewallVpcFirewall53806"` | no |
<!-- END_TF_DOCS -->    