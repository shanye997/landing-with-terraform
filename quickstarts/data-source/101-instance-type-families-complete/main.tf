data "alicloud_zones" "default" {
  available_resource_creation = "Instance"
}

data "alicloud_instance_type_families" "default" {
  zone_id              = "${data.alicloud_zones.default.zones.0.id}-F"
  generation           = "ecs-3"
  instance_charge_type = "PrePaid"
  spot_strategy        = "SpotAsPriceGo"
}
