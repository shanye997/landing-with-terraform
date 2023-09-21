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

resource "alicloud_ots_secondary_index" "default" {
  instance_name     = "${alicloud_ots_instance.default.name}"
  table_name        = "${var.name}"
  index_name        = "index1"
  index_type        = "Global"
  include_base_data = true
  primary_keys      = ["pk2", "pk1"]
  defined_columns   = ["col2", "col1"]
}

data "alicloud_ots_secondary_indexes" "default" {
  ids = [
    alicloud_ots_secondary_index.default.id
  ]
  instance_name = alicloud_ots_secondary_index.default.instance_name
  name_regex    = "${alicloud_ots_secondary_index.default.index_name}-fake"
  table_name    = alicloud_ots_secondary_index.default.table_name
}
