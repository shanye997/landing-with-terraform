variable "name" {
  default = "tf-examplecn-hangzhouComputeNestServiceInstance838"
}

variable "parameters_var" {
  default = "{ \\\"ZoneId\\\": \\\"$${data.alicloud_zones.default.zones.0.id}\\\", \\\"SystemDiskSize\\\": 40, \\\"InstanceChargeType\\\": \\\"PostPaid\\\", \\\"SecurityGroupId\\\": \\\"$${alicloud_security_group.default.id}\\\", \\\"VSwitchId\\\": \\\"$${data.alicloud_vswitches.default.ids.0}\\\", \\\"Count\\\": 2, \\\"UserEnablePrometheus\\\": true, \\\"SystemDiskCategory\\\": \\\"cloud_efficiency\\\", \\\"InternetChargeType\\\": \\\"PayByTraffic\\\", \\\"InternetMaxBandwidthOut\\\": 0, \\\"VpcId\\\": \\\"$${data.alicloud_vpcs.default.ids.0}\\\", \\\"RegionId\\\": \\\"cn-hangzhou\\\", \\\"DataDiskSize\\\": 100, \\\"DataDiskCategory\\\": \\\"cloud_efficiency\\\", \\\"InstanceType\\\": \\\"$${data.alicloud_instance_types.default.instance_types.0.id}\\\", \\\"Password\\\": \\\"YourPassword123!\\\"}"
}

