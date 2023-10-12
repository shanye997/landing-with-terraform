resource "alicloud_oos_state_configuration" "default" {
  template_name       = "ACS-ECS-InventoryDataCollection"
  schedule_type       = var.schedule_type_var
  schedule_expression = var.schedule_expression_var
  targets             = var.targets_var
}
