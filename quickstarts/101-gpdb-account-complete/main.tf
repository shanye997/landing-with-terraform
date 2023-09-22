data "alicloud_gpdb_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_gpdb_zones.default.zones.0.id
}

resource "alicloud_gpdb_elastic_instance" "default" {
  engine                  = "gpdb"
  engine_version          = "6.0"
  seg_storage_type        = "cloud_essd"
  seg_node_num            = 4
  storage_size            = 50
  instance_spec           = "2C16G"
  db_instance_category    = "HighAvailability"
  db_instance_description = var.name
  instance_network_type   = "VPC"
  payment_type            = "PayAsYouGo"
  vswitch_id              = data.alicloud_vswitches.default.ids.0
}

resource "alicloud_gpdb_account" "default" {
  account_name        = "tftest2534"
  account_password    = var.account_password_var
  db_instance_id      = alicloud_gpdb_elastic_instance.default.id
  account_description = "tftest2534"
}
