resource "alicloud_sae_namespace" "default" {
  enable_micro_registration = var.enable_micro_registration_var
  namespace_id              = "cn-hangzhou:tftest86"
  namespace_description     = var.namespace_description_var
  namespace_name            = var.namespace_name_var
  namespace_short_id        = "tftest60"
}
