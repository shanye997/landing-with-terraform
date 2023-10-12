resource "alicloud_log_project" "default" {
  name        = "${var.name}"
  description = "tf unit test"
}

resource "alicloud_log_store" "default" {
  project          = "${alicloud_log_project.default.name}"
  name             = "${var.name}"
  retention_period = "3000"
  shard_count      = 1
}

resource "alicloud_log_store_index" "default" {
  full_text {
    case_sensitive = "true"
    token          = " #$^*\r\n\t"
  }

  logstore = alicloud_log_store.default.name
  project  = alicloud_log_project.default.name
  field_search {
    enable_analytics = "true"
    json_keys {
      alias = "alisa22222"
      name  = "key2222"
    }
    json_keys {
      alias = "alisa1111"
      name  = "key1111"
    }

    name  = "${var.name}-1"
    token = " #$^*\r\n\t"
    type  = "json"
  }
  field_search {
    json_keys {
      alias = "alisa3333"
      name  = "key3333"
    }
    json_keys {
      alias = "alisa4444"
      name  = "key4444"
    }

    name  = "${var.name}-2"
    token = " #$^*\r\n\t"
    type  = "json"
  }

}
