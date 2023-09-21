resource "alicloud_vpc_traffic_mirror_filter" "default" {
  traffic_mirror_filter_name = var.name
}

resource "alicloud_vpc_traffic_mirror_filter_ingress_rule" "default" {
  traffic_mirror_filter_id = alicloud_vpc_traffic_mirror_filter.default.id
  priority                 = "1"
  rule_action              = "accept"
  protocol                 = "UDP"
  destination_cidr_block   = "10.0.0.0/24"
  source_cidr_block        = "10.0.0.0/24"
  destination_port_range   = "1/120"
  source_port_range        = "1/120"
}

data "alicloud_vpc_traffic_mirror_filter_ingress_rules" "default" {
  ids = [
    alicloud_vpc_traffic_mirror_filter_ingress_rule.default.id
  ]
  status                   = "Deleting"
  traffic_mirror_filter_id = alicloud_vpc_traffic_mirror_filter.default.id
}
