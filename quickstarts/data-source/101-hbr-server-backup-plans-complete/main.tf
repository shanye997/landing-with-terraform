data "alicloud_zones" default {
  available_resource_creation = "Instance"
}

data "alicloud_instance_types" "default" {
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
  cpu_core_count    = 1
  memory_size       = 2
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_security_group" "default" {
  name        = "${var.name}"
  description = "New security group"
  vpc_id      = data.alicloud_vpcs.default.ids.0
}

data "alicloud_images" "default" {
  owners      = "system"
  name_regex  = "^centos_8"
  most_recent = true
}

resource "alicloud_instance" "default" {
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
  instance_name     = "${var.name}"
  host_name         = "tf-example"
  image_id          = data.alicloud_images.default.images.0.id
  instance_type     = data.alicloud_instance_types.default.instance_types.0.id
  security_groups   = [alicloud_security_group.default.id]
  vswitch_id        = data.alicloud_vswitches.default.ids.0
}

resource "alicloud_hbr_server_backup_plan" "example" {
  ecs_server_backup_plan_name = "server_backup_plan"
  instance_id                 = alicloud_instance.default.id
  schedule                    = "I|1602673264|PT2H"
  retention                   = 1
  detail {
    app_consistent     = false
    snapshot_group     = true
    enable_fs_freeze   = true
    pre_script_path    = ""
    post_script_path   = ""
    timeout_in_seconds = 60
    disk_id_list       = ["/home"]
  }
  disabled = false
}

data "alicloud_hbr_server_backup_plans" "default" {
  filters {
    key = "planId"
    values = [
      alicloud_hbr_server_backup_plan.example.id
    ]
  }

  ids = [
    "${alicloud_hbr_server_backup_plan.example.id}_fake"
  ]
}
