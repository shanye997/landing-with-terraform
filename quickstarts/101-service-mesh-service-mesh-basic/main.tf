data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

locals {
  vswitch_id = data.alicloud_vswitches.default.ids.0
  vpc_id     = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_service_mesh_service_mesh" "default" {
  network {
    vpc_id = local.vpc_id
    vswitche_list = [
      local.vswitch_id
    ]
  }

}
