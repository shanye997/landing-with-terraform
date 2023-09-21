data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_kms_key" "key" {
  description            = var.name
  pending_window_in_days = "7"
  status                 = "Enabled"
}

resource "alicloud_alikafka_instance" "default" {
  disk_size = var.disk_size_var
  selected_zones = [
    data.alicloud_vswitches.default.vswitches.0.zone_id
  ]
  io_max          = var.io_max_var
  eip_max         = var.eip_max_var
  vswitch_id      = data.alicloud_vswitches.default.ids.0
  deploy_type     = var.deploy_type_var
  service_version = var.service_version_var
  kms_key_id      = alicloud_kms_key.key.id
  name            = var.name_var
  disk_type       = "1"
  spec_type       = var.spec_type_var
  tags = {
    For     = "acceptance test"
    Updated = "TF"
    Created = "TF"
  }
  security_group = alicloud_security_group.default.id
  paid_type      = var.paid_type_var
  vpc_id         = data.alicloud_vpcs.default.ids.0
  io_max_spec    = var.io_max_spec_var
  partition_num  = var.partition_num_var
}
