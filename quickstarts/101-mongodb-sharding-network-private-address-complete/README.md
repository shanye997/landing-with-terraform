<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_mongodb_sharding_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/mongodb_sharding_instance) | resource |
| [alicloud_mongodb_sharding_network_private_address.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/mongodb_sharding_network_private_address) | resource |
| [alicloud_mongodb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/mongodb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name_var"></a> [account\_name\_var](#input\_account\_name\_var) | n/a | `string` | `"tf_test"` | no |
| <a name="input_account_password_var"></a> [account\_password\_var](#input\_account\_password\_var) | n/a | `string` | `"YourPassword+12345"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhoumongodbshardingnetworkprivateaddress23562"` | no |
<!-- END_TF_DOCS -->    