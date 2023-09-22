resource "alicloud_kms_network_rule" "default" {
  description       = var.description_var
  network_rule_name = "tf-examplecn-hangzhoukmsnetworkrule39270"
  source_private_ip = [
    "10.10.10.10/24",
    "192.168.17.13",
    "100.177.24.254"
  ]
}
