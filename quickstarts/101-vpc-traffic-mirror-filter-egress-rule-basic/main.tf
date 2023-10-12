resource "alicloud_vpc_traffic_mirror_filter" "default" {
  traffic_mirror_filter_name = var.name
}

resource "alicloud_vpc_traffic_mirror_filter_egress_rule" "default" {
  destination_cidr_block   = var.destination_cidr_block_var
  priority                 = var.priority_var
  rule_action              = var.rule_action_var
  traffic_mirror_filter_id = alicloud_vpc_traffic_mirror_filter.default.id
  protocol                 = var.protocol_var
  source_cidr_block        = var.source_cidr_block_var
}
