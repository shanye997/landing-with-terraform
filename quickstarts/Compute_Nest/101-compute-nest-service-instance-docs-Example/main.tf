variable "name" {
  default = "tfexample"
}

provider "alicloud" {
  region = "cn-hangzhou"
}
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
  name_regex = "^ubuntu_[0-9]+_[0-9]+_x64*"
  owners     = "system"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "10.0.0.0/8"
}

resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = "10.1.0.0/16"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_security_group" "default" {
  vpc_id = alicloud_vpc.default.id
}

resource "alicloud_instance" "default" {
  image_id                   = data.alicloud_images.default.images.0.id
  instance_type              = data.alicloud_instance_types.default.instance_types.0.id
  security_groups            = alicloud_security_group.default.*.id
  internet_charge_type       = "PayByTraffic"
  internet_max_bandwidth_out = "10"
  availability_zone          = data.alicloud_zones.default.zones.0.id
  instance_charge_type       = "PostPaid"
  system_disk_category       = "cloud_efficiency"
  vswitch_id                 = alicloud_vswitch.default.id
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
    resources            = <<EOF
    {
      "Type": "ResourceIds",
      "RegionId": "cn-hangzhou",
      "ResourceIds": {
      "ALIYUN::ECS::INSTANCE": [
        "${alicloud_instance.default.id}"
        ]
      } 
    }
    EOF
  }
  tags = {
    Created = "TF"
    For     = "ServiceInstance"
  }
}