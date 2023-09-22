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
  partition_num  = "50"
  disk_type      = "1"
  disk_size      = "500"
  deploy_type    = "5"
  io_max         = "20"
  vswitch_id     = "${data.alicloud_vswitches.default.ids.0}"
  security_group = alicloud_security_group.default.id
}

resource "alicloud_alikafka_topic" "default" {
  instance_id = "${alicloud_alikafka_instance.default.id}"
  topic       = "${var.name}"
  remark      = "topic-remark"
}

resource "alicloud_alikafka_sasl_user" "default" {
  instance_id = "${alicloud_alikafka_instance.default.id}"
  username    = "${var.name}"
  password    = "password"
}

resource "alicloud_alikafka_sasl_acl" "default" {
  instance_id               = alicloud_alikafka_instance.default.id
  username                  = alicloud_alikafka_sasl_user.default.username
  acl_operation_type        = element(var.operation, count.index)
  acl_resource_name         = alicloud_alikafka_topic.default.topic
  acl_resource_pattern_type = "LITERAL"
  acl_resource_type         = "Topic"
  count                     = "2"
}
