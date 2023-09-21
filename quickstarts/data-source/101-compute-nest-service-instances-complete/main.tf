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

data "alicloud_images" "default" {
  name_regex  = "^ubuntu_[0-9]+_[0-9]+_x64*"
  most_recent = true
  owners      = "system"
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

resource "alicloud_instance" "default" {
  image_id                   = data.alicloud_images.default.images.0.id
  instance_type              = data.alicloud_instance_types.default.instance_types.0.id
  instance_name              = var.name
  security_groups            = alicloud_security_group.default.*.id
  internet_charge_type       = "PayByTraffic"
  internet_max_bandwidth_out = "10"
  availability_zone          = data.alicloud_zones.default.zones.0.id
  instance_charge_type       = "PostPaid"
  system_disk_category       = "cloud_efficiency"
  vswitch_id                 = data.alicloud_vswitches.default.ids.0
}

resource "alicloud_compute_nest_service_instance" "default" {
  service_id            = "service-dd475e6e468348799f0f"
  service_version       = "1"
  service_instance_name = var.name
  resource_group_id     = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  payment_type          = "Permanent"
  operation_metadata {
    operation_start_time = "1681281179000"
    operation_end_time   = "1681367579000"
    resources            = "{\"Type\":\"ResourceIds\",\"ResourceIds\":{\"ALIYUN::ECS::INSTANCE\":[\"${alicloud_instance.default.id}\"]},\"RegionId\":\"cn-hangzhou\"}"
  }
  tags = {
    Created = "TF"
    For     = "ServiceInstance"
  }
}

data "alicloud_compute_nest_service_instances" "default" {
  filter {
    name = "ServiceInstanceId"
    value = [
      "${alicloud_compute_nest_service_instance.default.id}_fake"
    ]
  }

  ids = [
    "${alicloud_compute_nest_service_instance.default.id}_fake"
  ]
  name_regex = "${alicloud_compute_nest_service_instance.default.service_instance_name}_fake"
  status     = "DeletedFailed"
  tags = {
    Created = "TF"
    For     = "ServiceInstance_Update"
  }
}
