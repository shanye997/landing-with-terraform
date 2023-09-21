resource "alicloud_ots_instance" "default" {
  name          = "tf-${var.name}"
  description   = "${var.name}"
  accessed_by   = "Any"
  instance_type = "Capacity"
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
}

resource "alicloud_ots_table" "default" {
  instance_name = "${alicloud_ots_instance.default.name}"
  table_name    = "${var.name}"
  primary_key {
    name = "pk1"
    type = "Integer"
  }
  primary_key {
    name = "pk2"
    type = "String"
  }
  time_to_live = -1
  max_version  = 1
}

data "alicloud_ots_tables" "default" {
  instance_name = alicloud_ots_table.default.instance_name
  name_regex    = "${alicloud_ots_table.default.table_name}-fake"
  ids = [
    alicloud_ots_table.default.id
  ]
}
