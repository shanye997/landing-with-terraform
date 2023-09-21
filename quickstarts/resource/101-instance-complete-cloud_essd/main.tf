data "alicloud_images" "default" {
  name_regex = "^ubuntu_[0-9]+_[0-9]+_x64*"
  owners     = "system"
}

data "alicloud_instance_types" "default" {
  instance_type_family = "ecs.g6e"
  network_type         = "Vpc"
}

resource "alicloud_vpc" "default" {
  vpc_name = var.name
}

resource "alicloud_vswitch" "default" {
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
  cidr_block   = cidrsubnet(alicloud_vpc.default.cidr_block, 8, 8)
  vswitch_name = var.name
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = alicloud_vpc.default.id
}

resource "alicloud_ecs_auto_snapshot_policy" "default" {
  name            = var.name
  repeat_weekdays = ["1"]
  retention_days  = -1
  time_points     = ["1"]
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
}

resource "alicloud_ecs_auto_snapshot_policy" "default1" {
  name            = "${var.name}_update"
  repeat_weekdays = ["1"]
  retention_days  = -1
  time_points     = ["1"]
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
}

resource "alicloud_key_pair" "default" {
  key_pair_name = var.name
}

resource "alicloud_kms_key" "key" {
  description            = var.name
  pending_window_in_days = "7"
  key_state              = "Enabled"
}

resource "alicloud_instance" "default" {
  system_disk_encrypt_algorithm = "aes-256"
  availability_zone             = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
  instance_charge_type          = var.instance_charge_type_var
  secondary_private_ips = [
    cidrhost(alicloud_vswitch.default.cidr_block, 195),
    cidrhost(alicloud_vswitch.default.cidr_block, 197)
  ]
  security_enhancement_strategy       = "Active"
  vswitch_id                          = alicloud_vswitch.default.id
  system_disk_auto_snapshot_policy_id = alicloud_ecs_auto_snapshot_policy.default1.id
  security_groups = [
    alicloud_security_group.default.id
  ]
  system_disk_encrypted      = "true"
  internet_max_bandwidth_out = var.internet_max_bandwidth_out_var
  password                   = var.password_var
  host_name                  = var.host_name_var
  system_disk_category       = "cloud_essd"
  maintenance_action         = var.maintenance_action_var
  user_data                  = base64encode("I am the user data")
  internet_charge_type       = var.internet_charge_type_var
  system_disk_kms_key_id     = alicloud_kms_key.key.id
  key_name                   = alicloud_key_pair.default.key_name
  spot_strategy              = "NoSpot"
  maintenance_notify         = var.maintenance_notify_var
  maintenance_time {
    end_time   = "03:00:00"
    start_time = "02:00:00"
  }

  force_delete     = var.force_delete_var
  spot_price_limit = "0"
  instance_type    = data.alicloud_instance_types.default.instance_types.0.id
  image_id         = data.alicloud_images.default.images.0.id
  instance_name    = var.name
}
