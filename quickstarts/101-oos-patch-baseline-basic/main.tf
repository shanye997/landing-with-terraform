resource "alicloud_oos_patch_baseline" "default" {
  approval_rules      = var.approval_rules_var
  operation_system    = "Windows"
  patch_baseline_name = var.name
}
