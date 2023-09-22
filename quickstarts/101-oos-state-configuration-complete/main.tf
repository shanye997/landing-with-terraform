data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_oos_state_configuration" "default" {
  targets           = var.targets_var
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.1
  parameters        = var.parameters_var
  template_name     = "ACS-ECS-InventoryDataCollection"
  configure_mode    = var.configure_mode_var
  description       = var.description_var
  schedule_type     = var.schedule_type_var
  tags = {
    Created = "TF1"
    For     = "test1"
  }
  schedule_expression = var.schedule_expression_var
}
