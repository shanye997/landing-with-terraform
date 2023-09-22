resource "alicloud_alb_security_policy" "default" {
  tls_versions = [
    "TLSv1.3"
  ]
  ciphers = [
    "TLS_AES_128_GCM_SHA256"
  ]
  security_policy_name = var.security_policy_name_var
}
