resource "alicloud_slb_tls_cipher_policy" "default" {
  ciphers = [
    "AES256-SHA256"
  ]
  tls_cipher_policy_name = var.tls_cipher_policy_name_var
  tls_versions = [
    "TLSv1.1",
    "TLSv1.2"
  ]
}
