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

resource "alicloud_alikafka_instance" "default" {
  name           = "${var.name}"
  partition_num  = 50
  disk_type      = 1
  disk_size      = 500
  deploy_type    = 5
  io_max         = 20
  vswitch_id     = data.alicloud_vswitches.default.ids.0
  security_group = alicloud_security_group.default.id
}

resource "alicloud_alikafka_topic" "default" {
  local_topic   = "false"
  partition_num = var.partition_num_var
  remark        = var.remark_var
  tags = {
    Created = "TF"
    For     = "acceptance test"
    Updated = "TF"
  }
  topic         = "tf-example-alicloud_alikafka_default_topic_change"
  compact_topic = "false"
  instance_id   = alicloud_alikafka_instance.default.id
}
