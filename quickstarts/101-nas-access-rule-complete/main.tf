resource "alicloud_nas_access_group" "example" {
  access_group_name = "${var.name}"
  access_group_type = "Vpc"
}

resource "alicloud_nas_access_rule" "default" {
  priority          = var.priority_var
  rw_access_type    = var.rw_access_type_var
  source_cidr_ip    = var.source_cidr_ip_var
  user_access_type  = var.user_access_type_var
  access_group_name = alicloud_nas_access_group.example.access_group_name
}
