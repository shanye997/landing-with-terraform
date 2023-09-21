resource "alicloud_resource_manager_resource_group" "default3iXhoa" {
  display_name        = "testname03"
  resource_group_name = var.name
}

resource "alicloud_vpc_traffic_mirror_filter" "default" {
  egress_rules {
    action                 = "accept"
    destination_cidr_block = "32.0.0.0/4"
    destination_port_range = "80/80"
    priority               = "1"
    protocol               = "TCP"
    source_cidr_block      = "16.0.0.0/4"
    source_port_range      = "80/80"
  }

  ingress_rules {
    destination_port_range = "80/80"
    priority               = "1"
    protocol               = "TCP"
    source_cidr_block      = "10.0.0.0/8"
    source_port_range      = "80/80"
    action                 = "accept"
    destination_cidr_block = "10.64.0.0/10"
  }

  resource_group_id = alicloud_resource_manager_resource_group.default3iXhoa.id
  dry_run           = var.dry_run_var
  tags = {
    For     = "Test"
    Created = "TF"
  }
  traffic_mirror_filter_description = var.traffic_mirror_filter_description_var
  traffic_mirror_filter_name        = var.traffic_mirror_filter_name_var
}
