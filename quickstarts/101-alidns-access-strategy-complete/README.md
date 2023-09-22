<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_alidns_access_strategy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alidns_access_strategy) | resource |
| [alicloud_alidns_address_pool.ipv4](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alidns_address_pool) | resource |
| [alicloud_alidns_gtm_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alidns_gtm_instance) | resource |
| [alicloud_cms_alarm_contact_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cms_alarm_contact_group) | resource |
| [alicloud_alidns_gtm_instances.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/alidns_gtm_instances) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_mode_var"></a> [access\_mode\_var](#input\_access\_mode\_var) | n/a | `string` | `"AUTO"` | no |
| <a name="input_default_addr_pool_type_var"></a> [default\_addr\_pool\_type\_var](#input\_default\_addr\_pool\_type\_var) | n/a | `string` | `"IPV4"` | no |
| <a name="input_default_latency_optimization_var"></a> [default\_latency\_optimization\_var](#input\_default\_latency\_optimization\_var) | n/a | `string` | `"CLOSE"` | no |
| <a name="input_default_lba_strategy_var"></a> [default\_lba\_strategy\_var](#input\_default\_lba\_strategy\_var) | n/a | `string` | `"RATIO"` | no |
| <a name="input_default_max_return_addr_num_var"></a> [default\_max\_return\_addr\_num\_var](#input\_default\_max\_return\_addr\_num\_var) | n/a | `string` | `"3"` | no |
| <a name="input_default_min_available_addr_num_var"></a> [default\_min\_available\_addr\_num\_var](#input\_default\_min\_available\_addr\_num\_var) | n/a | `string` | `"1"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | n/a | `string` | `""` | no |
| <a name="input_failover_addr_pool_type_var"></a> [failover\_addr\_pool\_type\_var](#input\_failover\_addr\_pool\_type\_var) | n/a | `string` | `"IPV4"` | no |
| <a name="input_failover_latency_optimization_var"></a> [failover\_latency\_optimization\_var](#input\_failover\_latency\_optimization\_var) | n/a | `string` | `"CLOSE"` | no |
| <a name="input_failover_lba_strategy_var"></a> [failover\_lba\_strategy\_var](#input\_failover\_lba\_strategy\_var) | n/a | `string` | `"RATIO"` | no |
| <a name="input_failover_max_return_addr_num_var"></a> [failover\_max\_return\_addr\_num\_var](#input\_failover\_max\_return\_addr\_num\_var) | n/a | `string` | `"3"` | no |
| <a name="input_failover_min_available_addr_num_var"></a> [failover\_min\_available\_addr\_num\_var](#input\_failover\_min\_available\_addr\_num\_var) | n/a | `string` | `"1"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example21276"` | no |
| <a name="input_strategy_mode_var"></a> [strategy\_mode\_var](#input\_strategy\_mode\_var) | n/a | `string` | `"LATENCY"` | no |
<!-- END_TF_DOCS -->    