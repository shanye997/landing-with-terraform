resource "alicloud_ecs_storage_capacity_unit" "default" {
  description                = var.description_var
  storage_capacity_unit_name = var.storage_capacity_unit_name_var
  capacity                   = "20"
  period                     = var.period_var
  period_unit                = var.period_unit_var
}
