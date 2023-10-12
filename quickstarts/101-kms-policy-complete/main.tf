resource "alicloud_kms_network_rule" "networkRule1" {
  description       = "dummy"
  source_private_ip = ["10.10.10.10"]
  network_rule_name = var.name
}

resource "alicloud_kms_policy" "default" {
  description     = var.description_var
  kms_instance_id = "shared"
  permissions = [
    "RbacPermission/Template/CryptoServiceKeyUser",
    "RbacPermission/Template/CryptoServiceSecretUser"
  ]
  policy_name = "tf-examplecn-hangzhoukmspolicy50826"
  resources = [
    "secret/*",
    "key/*"
  ]
  access_control_rules = var.access_control_rules_var
}
