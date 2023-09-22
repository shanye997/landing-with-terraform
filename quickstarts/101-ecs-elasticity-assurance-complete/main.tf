data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

data "alicloud_instance_types" "default" {
  instance_type_family = "ecs.c6"
}

data "alicloud_zones" "default" {
  available_resource_creation = "Instance"
}

resource "alicloud_ecs_elasticity_assurance" "default" {
  instance_type = [
    data.alicloud_instance_types.default.instance_types.0.id
  ]
  period                    = var.period_var
  period_unit               = var.period_unit_var
  private_pool_options_name = "test_after"
  resource_group_id         = data.alicloud_resource_manager_resource_groups.default.ids.0
  start_time                = "2023-09-21T16:34:21Z"
  tags = {
    Created = "tfexample1"
    For     = "Tfexample 1"
  }
  zone_ids = [
    data.alicloud_zones.default.zones[0].id
  ]
  description                         = var.description_var
  instance_amount                     = "1"
  private_pool_options_match_criteria = "Open"
  assurance_times                     = "Unlimited"
}
