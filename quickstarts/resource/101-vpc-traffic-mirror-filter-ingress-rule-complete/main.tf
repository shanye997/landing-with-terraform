resource "alicloud_vpc_traffic_mirror_filter" "default" {
  traffic_mirror_filter_name = var.name
}

resource "alicloud_vpc_traffic_mirror_filter_ingress_rule" "default" {
  traffic_mirror_filter_id = alicloud_vpc_traffic_mirror_filter.default.id
  rule_action              = var.rule_action_var
  destination_port_range   = var.destination_port_range_var
  priority                 = var.priority_var
  protocol                 = var.protocol_var
  dry_run                  = var.dry_run_var
  source_cidr_block        = var.source_cidr_block_var
  source_port_range        = var.source_port_range_var
  destination_cidr_block   = var.destination_cidr_block_var
}
