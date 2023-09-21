resource "alicloud_vpc_traffic_mirror_filter" "default" {
  egress_rules {
    destination_cidr_block = "32.0.0.0/4"
    destination_port_range = "80/80"
    priority               = "1"
    protocol               = "TCP"
    source_cidr_block      = "16.0.0.0/4"
    source_port_range      = "80/80"
    action                 = "accept"
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

}
