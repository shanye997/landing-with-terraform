resource "alicloud_kms_network_rule" "default" {
  source_private_ip = [
    "10.10.10.10/24",
    "192.168.17.13",
    "100.177.24.254"
  ]
}
