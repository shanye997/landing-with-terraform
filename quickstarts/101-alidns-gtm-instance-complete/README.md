<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_alidns_gtm_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alidns_gtm_instance) | resource |
| [alicloud_cms_alarm_contact_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cms_alarm_contact_group) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cname_type_var"></a> [cname\_type\_var](#input\_cname\_type\_var) | n/a | `string` | `"PUBLIC"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | n/a | `string` | `""` | no |
| <a name="input_instance_name_var"></a> [instance\_name\_var](#input\_instance\_name\_var) | n/a | `string` | `"tf-examplecn-hangzhoualidnsgtminstance36171"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhoualidnsgtminstance36171"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"1"` | no |
| <a name="input_public_cname_mode_var"></a> [public\_cname\_mode\_var](#input\_public\_cname\_mode\_var) | n/a | `string` | `"SYSTEM_ASSIGN"` | no |
| <a name="input_strategy_mode_var"></a> [strategy\_mode\_var](#input\_strategy\_mode\_var) | n/a | `string` | `"GEO"` | no |
| <a name="input_ttl_var"></a> [ttl\_var](#input\_ttl\_var) | n/a | `string` | `"60"` | no |
<!-- END_TF_DOCS -->    