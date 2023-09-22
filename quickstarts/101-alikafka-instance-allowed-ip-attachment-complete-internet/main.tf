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
  name           = var.name
  partition_num  = "50"
  disk_type      = "1"
  disk_size      = "500"
  deploy_type    = "4"
  eip_max        = "3"
  io_max         = "20"
  vswitch_id     = data.alicloud_vswitches.default.ids.0
  security_group = alicloud_security_group.default.id
}

resource "alicloud_alikafka_instance_allowed_ip_attachment" "default" {
  allowed_ip   = "1.1.1.1/1"
  allowed_type = "internet"
  instance_id  = alicloud_alikafka_instance.default.id
  port_range   = "9093/9093"
}
