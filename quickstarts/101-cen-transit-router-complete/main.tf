resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
}

resource "alicloud_cen_transit_router" "default" {
  transit_router_name        = var.name
  cen_id                     = alicloud_cen_instance.default.id
  transit_router_description = var.transit_router_description_var
  dry_run                    = var.dry_run_var
  support_multicast          = "true"
  tags = {
    For     = "TransitRouter_Update"
    Created = "TF_Update"
  }
}
