data "alicloud_instance_types" "default" {
  instance_type_family = "ecs.c6"
}

data "alicloud_zones" "default" {
  available_resource_creation = "Instance"
}

resource "alicloud_ecs_elasticity_assurance" "default" {
  zone_ids = [
    data.alicloud_zones.default.zones[0].id
  ]
  instance_type = [
    data.alicloud_instance_types.default.instance_types.0.id
  ]
  instance_amount = "1"
}
