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
  primary_key {
    name = "pk1"
    type = "Integer"
  }

  time_to_live = var.time_to_live_var
  defined_column {
    name = "col1"
    type = "Integer"
  }

  table_name    = "${var.name}${count.index}"
  instance_name = alicloud_ots_instance.default.name
  count         = "5"
  max_version   = var.max_version_var
}
