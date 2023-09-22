resource "alicloud_cloud_firewall_address_book" "default" {
  group_name = var.group_name_var
  group_type = "ip"
  lang       = var.lang_var
  address_list = [
    "10.21.0.0/16"
  ]
  description = var.description_var
}
