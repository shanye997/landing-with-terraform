resource "alicloud_resource_manager_account" "example" {
  display_name = "tf-exampleResourceManagerHandshake1047915"
}

resource "alicloud_resource_manager_handshake" "default" {
  note          = "test resource manager handshake"
  target_entity = alicloud_resource_manager_account.example.id
  target_type   = "Account"
}
