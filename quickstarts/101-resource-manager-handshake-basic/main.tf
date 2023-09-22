resource "alicloud_resource_manager_account" "example" {
  display_name = "tf-exampleResourceManagerHandshake1047915"
}

resource "alicloud_resource_manager_handshake" "default" {
  target_type   = "Account"
  target_entity = alicloud_resource_manager_account.example.id
}
