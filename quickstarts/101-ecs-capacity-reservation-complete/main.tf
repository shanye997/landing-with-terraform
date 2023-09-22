data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

data "alicloud_zones" "default" {
  available_resource_creation = "Instance"
}

resource "alicloud_ecs_capacity_reservation" "default" {
  zone_ids = [
    data.alicloud_zones.default.zones[0].id
  ]
  capacity_reservation_name = "${var.name}"
  end_time                  = var.end_time_var
  platform                  = "linux"
  instance_type             = "ecs.c5.2xlarge"
  description               = "${var.name}"
  end_time_type             = var.end_time_type_var
  instance_amount           = var.instance_amount_var
  match_criteria            = "Open"
  resource_group_id         = data.alicloud_resource_manager_resource_groups.default.ids.0
  tags = {
    Created = "tfexample9"
    For     = "Tfexample 9"
  }
}
