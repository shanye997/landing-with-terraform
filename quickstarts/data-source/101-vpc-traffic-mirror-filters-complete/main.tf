resource "alicloud_vpc_traffic_mirror_filter" "default" {
  traffic_mirror_filter_name        = var.name
  traffic_mirror_filter_description = var.name
}

data "alicloud_vpc_traffic_mirror_filters" "default" {
  traffic_mirror_filter_name = alicloud_vpc_traffic_mirror_filter.default.traffic_mirror_filter_name
  ids = [
    alicloud_vpc_traffic_mirror_filter.default.id
  ]
  status     = "Created"
  name_regex = "${alicloud_vpc_traffic_mirror_filter.default.traffic_mirror_filter_name}-fake"
}
