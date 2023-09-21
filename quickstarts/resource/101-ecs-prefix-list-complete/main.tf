resource "alicloud_ecs_prefix_list" "default" {
  description = var.description_var
  entry {
    cidr        = "192.168.0.0/24"
    description = "tf-examplerecsprefixlist"
  }
  entry {
    cidr        = "10.0.0.0/8"
    description = "tf-examplerecsprefixlist"
  }

  max_entries      = "3"
  prefix_list_name = var.prefix_list_name_var
  address_family   = "IPv4"
}
