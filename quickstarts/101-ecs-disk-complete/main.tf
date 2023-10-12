data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_kms_key" "key" {
  description            = var.name
  pending_window_in_days = "7"
  key_state              = "Enabled"
}

data "alicloud_instance_types" "default" {
  cpu_core_count       = 2
  memory_size          = 4
  instance_charge_type = "PrePaid"
  instance_type_family = "ecs.sn1ne"
}

data "alicloud_images" "default" {
  name_regex = "^ubuntu_[0-9]+_[0-9]+_x64*"
  owners     = "system"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = data.alicloud_vswitches.default.vswitches.0.vpc_id
}

resource "alicloud_instance" "default" {
  image_id                      = data.alicloud_images.default.images.0.id
  security_groups               = [alicloud_security_group.default.id]
  instance_type                 = data.alicloud_instance_types.default.instance_types.0.id
  system_disk_category          = "cloud_efficiency"
  instance_name                 = var.name
  spot_strategy                 = "NoSpot"
  spot_price_limit              = "0"
  security_enhancement_strategy = "Active"
  user_data                     = "I_am_user_data"
  instance_charge_type          = "PrePaid"
  period                        = 1
  vswitch_id                    = data.alicloud_vswitches.default.ids.0
  force_delete                  = true
}

resource "alicloud_ecs_disk" "default" {
  enable_auto_snapshot = var.enable_auto_snapshot_var
  description          = var.description_var
  instance_id          = alicloud_instance.default.id
  zone_id              = data.alicloud_zones.default.zones.0.id
  performance_level    = var.performance_level_var
  delete_with_instance = var.delete_with_instance_var
  delete_auto_snapshot = var.delete_auto_snapshot_var
  encrypted            = "true"
  payment_type         = var.payment_type_var
  kms_key_id           = alicloud_kms_key.key.id
  tags = {
    For     = "Test"
    Created = "TF"
  }
  size      = var.size_var
  disk_name = var.disk_name_var
  category  = var.category_var
}
