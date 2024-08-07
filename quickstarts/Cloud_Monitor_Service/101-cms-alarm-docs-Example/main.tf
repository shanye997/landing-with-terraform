variable "name" {
  default = "tf-example"
}

data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

data "alicloud_images" "default" {
  most_recent = true
  owners      = "system"
}

data "alicloud_instance_types" "default" {
  availability_zone = data.alicloud_zones.default.zones.0.id
  image_id          = data.alicloud_images.default.images.0.id
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "10.4.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = "10.4.0.0/24"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = alicloud_vpc.default.id
}

resource "alicloud_instance" "default" {
  availability_zone = data.alicloud_zones.default.zones.0.id
  instance_name     = var.name
  image_id          = data.alicloud_images.default.images.0.id
  instance_type     = data.alicloud_instance_types.default.instance_types.0.id
  security_groups   = [alicloud_security_group.default.id]
  vswitch_id        = alicloud_vswitch.default.id
}

resource "alicloud_cms_alarm_contact_group" "default" {
  alarm_contact_group_name = var.name
}

resource "alicloud_cms_alarm" "default" {
  name               = var.name
  project            = "acs_ecs_dashboard"
  metric             = "disk_writebytes"
  period             = 900
  contact_groups     = [alicloud_cms_alarm_contact_group.default.alarm_contact_group_name]
  effective_interval = "06:00-20:00"
  metric_dimensions  = <<EOF
  [
    {
      "instanceId": "${alicloud_instance.default.id}",
      "device": "/dev/vda1"
    }
  ]
  EOF
  escalations_critical {
    statistics          = "Average"
    comparison_operator = "<="
    threshold           = 35
    times               = 2
  }
}