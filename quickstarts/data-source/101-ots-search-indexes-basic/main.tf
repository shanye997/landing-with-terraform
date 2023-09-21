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

resource "alicloud_ots_search_index" "default" {
  instance_name = "${alicloud_ots_instance.default.name}"
  table_name    = "${alicloud_ots_table.default.table_name}"
  index_name    = "index1"
  time_to_live  = -1

  schema {
    field_schema {
      field_name = "col1"
      field_type = "Text"
      is_array   = false
      index      = true
      analyzer   = "Split"
      store      = true
    }
    field_schema {
      field_name          = "col2"
      field_type          = "Long"
      enable_sort_and_agg = true
    }


    field_schema {
      field_name = "pk1"
      field_type = "Long"

    }
    field_schema {
      field_name = "pk2"
      field_type = "Text"

    }


    index_setting {
      routing_fields = ["pk1", "pk2"]
    }

    index_sort {
      sorter {
        sorter_type = "PrimaryKeySort"
        order       = "Asc"
      }
      sorter {
        sorter_type = "FieldSort"
        order       = "Desc"
        field_name  = "col2"
        mode        = "Max"
      }
    }
  }


}

data "alicloud_ots_search_indexes" "default" {
  table_name    = alicloud_ots_search_index.default.table_name
  instance_name = alicloud_ots_search_index.default.instance_name
}
