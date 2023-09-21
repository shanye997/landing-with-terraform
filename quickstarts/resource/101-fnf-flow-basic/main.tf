resource "alicloud_fnf_flow" "default" {
  type        = var.type_var
  definition  = var.definition_var
  name        = var.name
  description = var.description_var
}
