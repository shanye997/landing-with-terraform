resource "alicloud_vpc_prefix_list" "default" {
  ip_version              = "IPV4"
  max_entries             = 50
  prefix_list_name        = var.name
  prefix_list_description = "description"
  entrys {
    cidr        = "192.168.0.0/16"
    description = "description"
  }
}

resource "alicloud_resource_manager_resource_share" "default" {
  resource_share_name = var.name
}

resource "alicloud_resource_manager_shared_resource" "default" {
  resource_id       = alicloud_vpc_prefix_list.default.id
  resource_share_id = alicloud_resource_manager_resource_share.default.id
  resource_type     = "PrefixList"
}
