resource "alicloud_cloud_firewall_address_book" "default" {
  group_type  = "tag"
  description = var.description_var
  group_name  = var.group_name_var
}
