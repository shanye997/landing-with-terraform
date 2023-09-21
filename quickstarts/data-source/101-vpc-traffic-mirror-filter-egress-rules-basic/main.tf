resource "alicloud_vpc_traffic_mirror_filter" "default" {
  traffic_mirror_filter_name = var.name
}

data "alicloud_vpc_traffic_mirror_filter_egress_rules" "default" {
  traffic_mirror_filter_id = alicloud_vpc_traffic_mirror_filter.default.id
}
