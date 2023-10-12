<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_vpc_traffic_mirror_filter.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc_traffic_mirror_filter) | resource |
| [alicloud_vpc_traffic_mirror_filter_egress_rule.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc_traffic_mirror_filter_egress_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_destination_cidr_block_var"></a> [destination\_cidr\_block\_var](#input\_destination\_cidr\_block\_var) | n/a | `string` | `"10.0.0.0/24"` | no |
| <a name="input_destination_port_range_var"></a> [destination\_port\_range\_var](#input\_destination\_port\_range\_var) | n/a | `string` | `"1/120"` | no |
| <a name="input_dry_run_var"></a> [dry\_run\_var](#input\_dry\_run\_var) | n/a | `string` | `"false"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example-vpctrafficmirrorfilteregressrule31941"` | no |
| <a name="input_priority_var"></a> [priority\_var](#input\_priority\_var) | n/a | `string` | `"1"` | no |
| <a name="input_protocol_var"></a> [protocol\_var](#input\_protocol\_var) | n/a | `string` | `"ICMP"` | no |
| <a name="input_rule_action_var"></a> [rule\_action\_var](#input\_rule\_action\_var) | n/a | `string` | `"accept"` | no |
| <a name="input_source_cidr_block_var"></a> [source\_cidr\_block\_var](#input\_source\_cidr\_block\_var) | n/a | `string` | `"10.0.0.0/24"` | no |
| <a name="input_source_port_range_var"></a> [source\_port\_range\_var](#input\_source\_port\_range\_var) | n/a | `string` | `"1/120"` | no |
<!-- END_TF_DOCS -->    