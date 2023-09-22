resource "alicloud_nas_access_group" "example" {
  access_group_name = "${var.name}"
  access_group_type = "Vpc"
}

resource "alicloud_nas_access_rule" "default" {
  access_group_name = alicloud_nas_access_group.example.access_group_name
  source_cidr_ip    = var.source_cidr_ip_var
}
