<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_compute_nest_service_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/compute_nest_service_instance) | resource |
| [alicloud_compute_nest_service_instance.operated](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/compute_nest_service_instance) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouComputeNestServiceInstance838"` | no |
| <a name="input_parameters_var"></a> [parameters\_var](#input\_parameters\_var) | n/a | `string` | `"{ \\\"ZoneId\\\": \\\"${data.alicloud_zones.default.zones.0.id}\\\", \\\"SystemDiskSize\\\": 40, \\\"InstanceChargeType\\\": \\\"PostPaid\\\", \\\"SecurityGroupId\\\": \\\"${alicloud_security_group.default.id}\\\", \\\"VSwitchId\\\": \\\"${data.alicloud_vswitches.default.ids.0}\\\", \\\"Count\\\": 2, \\\"UserEnablePrometheus\\\": true, \\\"SystemDiskCategory\\\": \\\"cloud_efficiency\\\", \\\"InternetChargeType\\\": \\\"PayByTraffic\\\", \\\"InternetMaxBandwidthOut\\\": 0, \\\"VpcId\\\": \\\"${data.alicloud_vpcs.default.ids.0}\\\", \\\"RegionId\\\": \\\"cn-hangzhou\\\", \\\"DataDiskSize\\\": 100, \\\"DataDiskCategory\\\": \\\"cloud_efficiency\\\", \\\"InstanceType\\\": \\\"${data.alicloud_instance_types.default.instance_types.0.id}\\\", \\\"Password\\\": \\\"YourPassword123!\\\"}"` | no |
<!-- END_TF_DOCS -->    