data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_alikafka_instance" "default" {
  disk_type   = "1"
  vswitch_id  = data.alicloud_vswitches.default.ids.0
  deploy_type = var.deploy_type_var
  disk_size   = var.disk_size_var
}
