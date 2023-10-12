data "alicloud_zones" "default" {
  available_resource_creation = "Instance"
}

resource "alicloud_ecs_capacity_reservation" "default" {
  instance_type   = "ecs.c5.2xlarge"
  instance_amount = var.instance_amount_var
  zone_ids = [
    data.alicloud_zones.default.zones[0].id
  ]
}
