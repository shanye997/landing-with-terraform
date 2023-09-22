<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cs_edge_kubernetes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cs_edge_kubernetes) | resource |
| [alicloud_db_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_snapshot_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/snapshot_policy) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_spec_var"></a> [cluster\_spec\_var](#input\_cluster\_spec\_var) | n/a | `string` | `"ack.pro.small"` | no |
| <a name="input_deletion_protection_var"></a> [deletion\_protection\_var](#input\_deletion\_protection\_var) | n/a | `string` | `"false"` | no |
| <a name="input_install_cloud_monitor_var"></a> [install\_cloud\_monitor\_var](#input\_install\_cloud\_monitor\_var) | n/a | `string` | `"true"` | no |
| <a name="input_is_enterprise_security_group_var"></a> [is\_enterprise\_security\_group\_var](#input\_is\_enterprise\_security\_group\_var) | n/a | `string` | `"true"` | no |
| <a name="input_load_balancer_spec_var"></a> [load\_balancer\_spec\_var](#input\_load\_balancer\_spec\_var) | n/a | `string` | `"slb.s2.small"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleedgekubernetes-3698887"` | no |
| <a name="input_name_var"></a> [name\_var](#input\_name\_var) | n/a | `string` | `"tf-exampleedgekubernetes-3698887"` | no |
| <a name="input_new_nat_gateway_var"></a> [new\_nat\_gateway\_var](#input\_new\_nat\_gateway\_var) | n/a | `string` | `"true"` | no |
| <a name="input_node_cidr_mask_var"></a> [node\_cidr\_mask\_var](#input\_node\_cidr\_mask\_var) | n/a | `string` | `"24"` | no |
| <a name="input_password_var"></a> [password\_var](#input\_password\_var) | n/a | `string` | `"Test12345"` | no |
| <a name="input_pod_cidr_var"></a> [pod\_cidr\_var](#input\_pod\_cidr\_var) | n/a | `string` | `"10.99.0.0/16"` | no |
| <a name="input_service_cidr_var"></a> [service\_cidr\_var](#input\_service\_cidr\_var) | n/a | `string` | `"172.16.0.0/16"` | no |
| <a name="input_slb_internet_enabled_var"></a> [slb\_internet\_enabled\_var](#input\_slb\_internet\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_version_var"></a> [version\_var](#input\_version\_var) | n/a | `string` | `"1.20.11-aliyunedge.1"` | no |
| <a name="input_worker_disk_category_var"></a> [worker\_disk\_category\_var](#input\_worker\_disk\_category\_var) | n/a | `string` | `"cloud_essd"` | no |
| <a name="input_worker_disk_performance_level_var"></a> [worker\_disk\_performance\_level\_var](#input\_worker\_disk\_performance\_level\_var) | n/a | `string` | `"PL1"` | no |
| <a name="input_worker_disk_size_var"></a> [worker\_disk\_size\_var](#input\_worker\_disk\_size\_var) | n/a | `string` | `"120"` | no |
| <a name="input_worker_instance_charge_type_var"></a> [worker\_instance\_charge\_type\_var](#input\_worker\_instance\_charge\_type\_var) | n/a | `string` | `"PostPaid"` | no |
| <a name="input_worker_number_var"></a> [worker\_number\_var](#input\_worker\_number\_var) | n/a | `string` | `"2"` | no |
<!-- END_TF_DOCS -->    