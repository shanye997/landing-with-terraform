<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cs_autoscaling_config.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cs_autoscaling_config) | resource |
| [alicloud_cs_managed_kubernetes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cs_managed_kubernetes) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cool_down_duration_var"></a> [cool\_down\_duration\_var](#input\_cool\_down\_duration\_var) | n/a | `string` | `"10m"` | no |
| <a name="input_daemonset_eviction_for_nodes_var"></a> [daemonset\_eviction\_for\_nodes\_var](#input\_daemonset\_eviction\_for\_nodes\_var) | n/a | `string` | `"false"` | no |
| <a name="input_expander_var"></a> [expander\_var](#input\_expander\_var) | n/a | `string` | `"least-waste"` | no |
| <a name="input_gpu_utilization_threshold_var"></a> [gpu\_utilization\_threshold\_var](#input\_gpu\_utilization\_threshold\_var) | n/a | `string` | `"0.5"` | no |
| <a name="input_max_graceful_termination_sec_var"></a> [max\_graceful\_termination\_sec\_var](#input\_max\_graceful\_termination\_sec\_var) | n/a | `string` | `"14400"` | no |
| <a name="input_min_replica_count_var"></a> [min\_replica\_count\_var](#input\_min\_replica\_count\_var) | n/a | `string` | `"0"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleCSAutoscalingConfig-1229204"` | no |
| <a name="input_recycle_node_deletion_enabled_var"></a> [recycle\_node\_deletion\_enabled\_var](#input\_recycle\_node\_deletion\_enabled\_var) | n/a | `string` | `"false"` | no |
| <a name="input_scale_down_enabled_var"></a> [scale\_down\_enabled\_var](#input\_scale\_down\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_scale_up_from_zero_var"></a> [scale\_up\_from\_zero\_var](#input\_scale\_up\_from\_zero\_var) | n/a | `string` | `"true"` | no |
| <a name="input_scan_interval_var"></a> [scan\_interval\_var](#input\_scan\_interval\_var) | n/a | `string` | `"30s"` | no |
| <a name="input_skip_nodes_with_local_storage_var"></a> [skip\_nodes\_with\_local\_storage\_var](#input\_skip\_nodes\_with\_local\_storage\_var) | n/a | `string` | `"false"` | no |
| <a name="input_skip_nodes_with_system_pods_var"></a> [skip\_nodes\_with\_system\_pods\_var](#input\_skip\_nodes\_with\_system\_pods\_var) | n/a | `string` | `"true"` | no |
| <a name="input_unneeded_duration_var"></a> [unneeded\_duration\_var](#input\_unneeded\_duration\_var) | n/a | `string` | `"10m"` | no |
| <a name="input_utilization_threshold_var"></a> [utilization\_threshold\_var](#input\_utilization\_threshold\_var) | n/a | `string` | `"0.5"` | no |
<!-- END_TF_DOCS -->    