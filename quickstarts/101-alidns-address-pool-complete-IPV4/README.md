<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_alidns_address_pool.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alidns_address_pool) | resource |
| [alicloud_alidns_gtm_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alidns_gtm_instance) | resource |
| [alicloud_cms_alarm_contact_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cms_alarm_contact_group) | resource |
| [alicloud_alidns_gtm_instances.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/alidns_gtm_instances) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | n/a | `string` | `""` | no |
| <a name="input_lba_strategy_var"></a> [lba\_strategy\_var](#input\_lba\_strategy\_var) | n/a | `string` | `"RATIO"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example321"` | no |
<!-- END_TF_DOCS -->    