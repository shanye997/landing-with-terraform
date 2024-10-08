resource "random_integer" "default" {
  max = 99999
  min = 10000
}

resource "alicloud_log_project" "example" {
  project_name = "terraform-example-${random_integer.default.result}"
  description  = "terraform-example"
}

resource "alicloud_log_store" "example" {
  project_name          = alicloud_log_project.example.project_name
  logstore_name         = "example-store"
  shard_count           = 3
  auto_split            = true
  max_split_shard_count = 60
  append_meta           = true
}

resource "alicloud_log_store_index" "example" {
  project  = alicloud_log_project.example.project_name
  logstore = alicloud_log_store.example.logstore_name
  full_text {
    case_sensitive = true
    token          = " #$^*\r\n\t"
  }
  field_search {
    name             = "terraform-example"
    enable_analytics = true
    type             = "text"
    token            = " #$^*\r\n\t"
  }
}