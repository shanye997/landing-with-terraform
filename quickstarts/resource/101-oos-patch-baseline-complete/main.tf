resource "alicloud_oos_patch_baseline" "default" {
  operation_system    = "Windows"
  patch_baseline_name = var.name
  rejected_patches = [
    "KB1",
    "KB5",
    "KB6"
  ]
  rejected_patches_action = var.rejected_patches_action_var
  approval_rules          = var.approval_rules_var
  description             = "${var.name}"
}
