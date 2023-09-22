resource "alicloud_resource_manager_control_policy" "default" {
  effect_scope        = "RAM"
  policy_document     = var.policy_document_var
  control_policy_name = var.name
}
