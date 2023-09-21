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
  time_to_live = var.time_to_live_var
  primary_key {
    type = "Integer"
    name = "pk1"
  }

  deviation_cell_version_in_sec = var.deviation_cell_version_in_sec_var
  instance_name                 = alicloud_ots_instance.default.name
  table_name                    = var.name
  sse_key_type                  = var.sse_key_type_var
  defined_column {
    name = "col1"
    type = "Integer"
  }

  enable_sse  = var.enable_sse_var
  max_version = var.max_version_var
}
