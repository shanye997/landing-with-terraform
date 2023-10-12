data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_slb_acl" "default" {
  ip_version        = "ipv4"
  name              = var.name
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.0
  tags = {
    Created = "TF"
    For     = "acceptance test123"
  }
}
