<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cs_managed_kubernetes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cs_managed_kubernetes) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_kms_keys.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/kms_keys) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_spec_var"></a> [cluster\_spec\_var](#input\_cluster\_spec\_var) | n/a | `string` | `"ack.pro.small"` | no |
| <a name="input_deletion_protection_var"></a> [deletion\_protection\_var](#input\_deletion\_protection\_var) | n/a | `string` | `"false"` | no |
| <a name="input_enable_rrsa_var"></a> [enable\_rrsa\_var](#input\_enable\_rrsa\_var) | n/a | `string` | `"true"` | no |
| <a name="input_is_enterprise_security_group_var"></a> [is\_enterprise\_security\_group\_var](#input\_is\_enterprise\_security\_group\_var) | n/a | `string` | `"true"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplemanagedkubernetes-4214926"` | no |
| <a name="input_name_var"></a> [name\_var](#input\_name\_var) | n/a | `string` | `"tf-examplemanagedkubernetes-4214926"` | no |
| <a name="input_new_nat_gateway_var"></a> [new\_nat\_gateway\_var](#input\_new\_nat\_gateway\_var) | n/a | `string` | `"true"` | no |
| <a name="input_node_cidr_mask_var"></a> [node\_cidr\_mask\_var](#input\_node\_cidr\_mask\_var) | n/a | `string` | `"26"` | no |
| <a name="input_pod_cidr_var"></a> [pod\_cidr\_var](#input\_pod\_cidr\_var) | n/a | `string` | `"10.96.0.0/16"` | no |
| <a name="input_proxy_mode_var"></a> [proxy\_mode\_var](#input\_proxy\_mode\_var) | n/a | `string` | `"ipvs"` | no |
| <a name="input_service_cidr_var"></a> [service\_cidr\_var](#input\_service\_cidr\_var) | n/a | `string` | `"172.24.0.0/16"` | no |
| <a name="input_slb_internet_enabled_var"></a> [slb\_internet\_enabled\_var](#input\_slb\_internet\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_version_var"></a> [version\_var](#input\_version\_var) | n/a | `string` | `"1.22.3-aliyun.1"` | no |
<!-- END_TF_DOCS -->    