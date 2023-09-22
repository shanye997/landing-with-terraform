<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cdn_fc_trigger.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cdn_fc_trigger) | resource |
| [alicloud_account.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |
| [alicloud_regions.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/regions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhoucdnfctrigger52705"` | no |
| <a name="input_role_arn_var"></a> [role\_arn\_var](#input\_role\_arn\_var) | n/a | `string` | `"acs:ram::${data.alicloud_account.default.id}:role/aliyuncdneventnotificationrole"` | no |
| <a name="input_source_arn_var"></a> [source\_arn\_var](#input\_source\_arn\_var) | n/a | `string` | `"acs:cdn:*:${data.alicloud_account.default.id}:domain/example1.com"` | no |
<!-- END_TF_DOCS -->    