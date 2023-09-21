data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_alb_acl" "default" {
  acl_name          = var.name
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
}

resource "alicloud_alb_acl_entry_attachment" "default" {
  acl_id      = alicloud_alb_acl.default.id
  description = "tf-exampleAlbAclEntryAttachment24728"
  entry       = "10.10.10.0/24"
}
