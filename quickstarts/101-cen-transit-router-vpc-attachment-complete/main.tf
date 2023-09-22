data "alicloud_account" "default" {
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = cidrsubnet(alicloud_vpc.default.cidr_block, 8, 2)
  zone_id      = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
}

resource "alicloud_cen_transit_router" "default" {
  transit_router_name = var.name
  cen_id              = alicloud_cen_instance.default.id
}

resource "alicloud_cen_transit_router_vpc_attachment" "default" {
  dry_run                               = var.dry_run_var
  transit_router_attachment_description = var.transit_router_attachment_description_var
  transit_router_attachment_name        = var.transit_router_attachment_name_var
  resource_type                         = var.resource_type_var
  transit_router_id                     = alicloud_cen_transit_router.default.transit_router_id
  payment_type                          = "PayAsYouGo"
  vpc_owner_id                          = data.alicloud_account.default.id
  cen_id                                = alicloud_cen_instance.default.id
  zone_mappings {
    vswitch_id = alicloud_vswitch.default.id
    zone_id    = alicloud_vswitch.default.zone_id
  }

  auto_publish_route_enabled = var.auto_publish_route_enabled_var
  tags = {
    Created = "TF_Update"
    For     = "TransitRouterVpcAttachment_Update"
  }
  vpc_id = alicloud_vpc.default.id
}
