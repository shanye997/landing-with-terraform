resource "alicloud_resource_manager_resource_group" "defaultRg" {
  display_name        = "tf-example-chenyi"
  resource_group_name = var.name
}

resource "alicloud_vpc_prefix_list" "default" {
  tags = {
    Created = "TF"
    For     = "Test"
  }
  entrys {
    description = "test"
    cidr        = "192.168.0.0/16"
  }

  ip_version              = "IPV4"
  max_entries             = var.max_entries_var
  prefix_list_description = var.prefix_list_description_var
  prefix_list_name        = var.prefix_list_name_var
  resource_group_id       = alicloud_resource_manager_resource_group.defaultRg.id
}
