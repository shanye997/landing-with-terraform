data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_slb_acl" "default" {
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.0
  name              = var.name
  tags = {
    Created = "TF"
    For     = "acceptance test123"
  }
  ip_version = "ipv6"
}
