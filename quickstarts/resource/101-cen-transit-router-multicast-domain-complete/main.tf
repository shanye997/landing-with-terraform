resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
}

resource "alicloud_cen_transit_router" "default" {
  cen_id            = alicloud_cen_instance.default.id
  support_multicast = true
}

resource "alicloud_cen_transit_router_multicast_domain" "default" {
  transit_router_multicast_domain_name = var.transit_router_multicast_domain_name_var
  tags = {
    Created = "TF_Update"
    For     = "TransitRouterMulticastDomain_Update"
  }
  transit_router_id                           = alicloud_cen_transit_router.default.transit_router_id
  transit_router_multicast_domain_description = var.transit_router_multicast_domain_description_var
}
