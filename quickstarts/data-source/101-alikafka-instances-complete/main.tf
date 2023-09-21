data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = "${data.alicloud_vswitches.default.vswitches.0.vpc_id}"
}

resource "alicloud_alikafka_instance" "default" {
  name           = "${var.name}"
  partition_num  = "50"
  disk_type      = "1"
  disk_size      = "500"
  deploy_type    = "5"
  io_max         = "20"
  vswitch_id     = "${data.alicloud_vswitches.default.ids.0}"
  security_group = "${alicloud_security_group.default.id}"
  tags = {
    Created = "TF"
    For     = "Test"
  }
}

data "alicloud_alikafka_instances" "default" {
  enable_details = var.enable_details_var
  ids = [
    alicloud_alikafka_instance.default.id
  ]
  name_regex = alicloud_alikafka_instance.default.name
}
