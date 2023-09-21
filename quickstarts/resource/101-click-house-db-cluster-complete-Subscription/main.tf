data "alicloud_click_house_regions" "default" {
  current = true
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = "${data.alicloud_vpcs.default.ids.0}"
  zone_id = data.alicloud_click_house_regions.default.regions.0.zone_ids.0.zone_id
}

resource "alicloud_click_house_db_cluster" "default" {
  category                = "Basic"
  db_cluster_class        = "S8"
  db_cluster_version      = "20.3.10.75"
  db_node_storage         = "100"
  storage_type            = "cloud_essd"
  db_cluster_network_type = "vpc"
  db_node_group_count     = "1"
  payment_type            = "Subscription"
  period                  = "Month"
  used_time               = "1"
  vswitch_id              = data.alicloud_vswitches.default.vswitches.0.id
}
