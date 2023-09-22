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

  defined_column {
    name = "col1"
    type = "String"
  }
  defined_column {
    name = "col2"
    type = "Integer"
  }

  time_to_live = -1
  max_version  = 1
}

resource "alicloud_ots_secondary_index" "default" {
  index_name        = "${var.name}_index"
  index_type        = "Global"
  instance_name     = alicloud_ots_instance.default.name
  primary_keys      = var.pks
  table_name        = alicloud_ots_table.default.table_name
  defined_columns   = var.cols
  include_base_data = "true"
}
