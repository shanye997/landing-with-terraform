variable "name" {
  default = "AliyunTerraform"
}

resource "alicloud_resource_manager_account" "default" {
  display_name = var.name
}

resource "alicloud_cloud_firewall_instance_member" "default" {
  member_desc = var.name
  member_uid  = alicloud_resource_manager_account.default.id
}