data "alicloud_resource_manager_resource_groups" "default" {
}

data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone    = data.alicloud_zones.default.zones.0.id
  instance_type_family = "ecs.sn1ne"
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_compute_nest_service_instance" "operated" {
  service_id             = "service-0a15dbf13e4049daaf66"
  service_version        = "1"
  service_instance_name  = "${var.name}-operated"
  parameters             = "{ \"ZoneId\": \"${data.alicloud_zones.default.zones.0.id}\", \"SystemDiskSize\": 40, \"InstanceChargeType\": \"PostPaid\", \"SecurityGroupId\": \"${alicloud_security_group.default.id}\", \"VSwitchId\": \"${data.alicloud_vswitches.default.ids.0}\", \"Count\": 2, \"UserEnablePrometheus\": true, \"SystemDiskCategory\": \"cloud_efficiency\", \"InternetChargeType\": \"PayByTraffic\", \"InternetMaxBandwidthOut\": 0, \"VpcId\": \"${data.alicloud_vpcs.default.ids.0}\", \"RegionId\": \"cn-hangzhou\", \"DataDiskSize\": 100, \"DataDiskCategory\": \"cloud_efficiency\", \"InstanceType\": \"${data.alicloud_instance_types.default.instance_types.0.id}\", \"Password\": \"YourPassword123!\"}"
  enable_instance_ops    = false
  template_name          = "模板1"
  resource_group_id      = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  specification_name     = "套餐一"
  enable_user_prometheus = true
}

resource "alicloud_compute_nest_service_instance" "default" {
  parameters = var.parameters_var
  tags = {
    For     = "ServiceInstance_Update"
    Created = "TF_Update"
  }
  operation_metadata {
    operation_end_time           = "1681367579000"
    operation_start_time         = "1681281179000"
    operated_service_instance_id = alicloud_compute_nest_service_instance.operated.id
  }

  service_id             = "service-0a15dbf13e4049daaf66"
  template_name          = "模板1"
  service_instance_name  = "tf-examplecn-hangzhouComputeNestServiceInstance761"
  service_version        = "1"
  specification_name     = "套餐一"
  enable_user_prometheus = "true"
  enable_instance_ops    = "false"
  resource_group_id      = data.alicloud_resource_manager_resource_groups.default.groups.1.id
  payment_type           = "Permanent"
}
