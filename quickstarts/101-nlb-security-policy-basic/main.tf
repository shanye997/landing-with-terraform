resource "alicloud_nlb_security_policy" "default" {
  tls_versions = [
    "TLSv1.0",
    "TLSv1.1",
    "TLSv1.2"
  ]
  ciphers = [
    "ECDHE-RSA-AES128-SHA",
    "ECDHE-ECDSA-AES128-SHA"
  ]
}
