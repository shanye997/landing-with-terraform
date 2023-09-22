resource "alicloud_ecs_prefix_list" "default" {
  entry {
    cidr        = "192.168.0.0/24"
    description = "tf-examplerecsprefixlist"
  }
  entry {
    cidr        = "10.0.0.0/8"
    description = "tf-examplerecsprefixlist"
  }

  address_family   = "IPv4"
  max_entries      = "3"
  prefix_list_name = var.prefix_list_name_var
}
