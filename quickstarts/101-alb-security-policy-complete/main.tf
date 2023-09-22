data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_alb_security_policy" "default" {
  ciphers = [
    "TLS_AES_128_GCM_SHA256"
  ]
  security_policy_name = var.security_policy_name_var
  dry_run              = var.dry_run_var
  resource_group_id    = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  tags = {
    Created = "tfexample58"
    For     = "Tfexample58"
  }
  tls_versions = [
    "TLSv1.3"
  ]
}
