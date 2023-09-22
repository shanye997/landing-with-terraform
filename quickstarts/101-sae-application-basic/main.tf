resource "alicloud_sae_application" "default" {
  app_name     = "tfexample37596"
  replicas     = var.replicas_var
  package_type = "War"
}
