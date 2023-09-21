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
  project = alicloud_log_project.default.name
  field_search {
    name             = "${var.name}-1"
    token            = " #$^*\r\n\t"
    type             = "json"
    enable_analytics = "true"
    json_keys {
      alias = "alisa22222"
      name  = "key2222"
    }
    json_keys {
      alias = "alisa1111"
      name  = "key1111"
    }

  }
  field_search {
    name  = "${var.name}-2"
    token = " #$^*\r\n\t"
    type  = "json"
    json_keys {
      alias = "alisa3333"
      name  = "key3333"
    }
    json_keys {
      alias = "alisa4444"
      name  = "key4444"
    }

  }

  logstore = alicloud_log_store.default.name
}
