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
  db_cluster_class        = "C16"
  db_cluster_description  = var.db_cluster_description_var
  db_cluster_network_type = "vpc"
  db_cluster_version      = "20.3.10.75"
  db_node_storage         = "500"
  maintain_time           = var.maintain_time_var
  vswitch_id              = data.alicloud_vswitches.default.vswitches.0.id
  category                = "HighAvailability"
  status                  = var.status_var
  db_node_group_count     = "1"
  storage_type            = "cloud_essd_pl2"
  payment_type            = "PayAsYouGo"
}
