<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_polardb_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/polardb_account) | resource |
| [alicloud_polardb_cluster.cluster](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/polardb_cluster) | resource |
| [alicloud_vswitch.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_polardb_node_classes.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/polardb_node_classes) | data source |
| [alicloud_polardb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/polardb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_password_var"></a> [account\_password\_var](#input\_account\_password\_var) | n/a | `string` | `"YourPassword_123"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampledbaccount-51532"` | no |
<!-- END_TF_DOCS -->    