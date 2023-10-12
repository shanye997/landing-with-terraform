<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cs_kubernetes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cs_kubernetes) | resource |
| [alicloud_db_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deletion_protection_var"></a> [deletion\_protection\_var](#input\_deletion\_protection\_var) | n/a | `string` | `"false"` | no |
| <a name="input_enable_ssh_var"></a> [enable\_ssh\_var](#input\_enable\_ssh\_var) | n/a | `string` | `"true"` | no |
| <a name="input_install_cloud_monitor_var"></a> [install\_cloud\_monitor\_var](#input\_install\_cloud\_monitor\_var) | n/a | `string` | `"true"` | no |
| <a name="input_master_disk_category_var"></a> [master\_disk\_category\_var](#input\_master\_disk\_category\_var) | n/a | `string` | `"cloud_ssd"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleKubernetes_basic-3898635"` | no |
| <a name="input_name_var"></a> [name\_var](#input\_name\_var) | n/a | `string` | `"tf-dedicated-k8s"` | no |
| <a name="input_new_nat_gateway_var"></a> [new\_nat\_gateway\_var](#input\_new\_nat\_gateway\_var) | n/a | `string` | `"true"` | no |
| <a name="input_password_var"></a> [password\_var](#input\_password\_var) | n/a | `string` | `"Yourpassword1234"` | no |
| <a name="input_pod_cidr_var"></a> [pod\_cidr\_var](#input\_pod\_cidr\_var) | n/a | `string` | `"10.72.0.0/16"` | no |
| <a name="input_proxy_mode_var"></a> [proxy\_mode\_var](#input\_proxy\_mode\_var) | n/a | `string` | `"ipvs"` | no |
| <a name="input_service_cidr_var"></a> [service\_cidr\_var](#input\_service\_cidr\_var) | n/a | `string` | `"172.18.0.0/16"` | no |
<!-- END_TF_DOCS -->    