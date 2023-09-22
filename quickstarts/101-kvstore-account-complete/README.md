<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_kvstore_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kvstore_account) | resource |
| [alicloud_kvstore_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kvstore_instance) | resource |
| [alicloud_kvstore_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/kvstore_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_password_var"></a> [account\_password\_var](#input\_account\_password\_var) | n/a | `string` | `"YourPassword_123"` | no |
| <a name="input_account_privilege_var"></a> [account\_privilege\_var](#input\_account\_privilege\_var) | n/a | `string` | `"RoleReadWrite"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"terraform_test"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouKvstoreAccounttftestnormal7993074"` | no |
<!-- END_TF_DOCS -->    