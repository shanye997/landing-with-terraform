<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_db_account.account](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_account) | resource |
| [alicloud_db_instance.instance](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_dms_enterprise_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dms_enterprise_instance) | resource |
| [alicloud_dms_enterprise_proxy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/dms_enterprise_proxy) | resource |
| [alicloud_account.current](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |
| [alicloud_db_instance_classes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_instance_classes) | data source |
| [alicloud_db_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_zones) | data source |
| [alicloud_dms_user_tenants.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/dms_user_tenants) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhoudmsenterpriseproxy9373"` | no |
| <a name="input_password_var"></a> [password\_var](#input\_password\_var) | n/a | `string` | `"Test12345"` | no |
| <a name="input_username_var"></a> [username\_var](#input\_username\_var) | n/a | `string` | `"tftestnormal"` | no |
<!-- END_TF_DOCS -->    