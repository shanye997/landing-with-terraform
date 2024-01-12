# Create a cen flowlog resource and use it to publish a route entry pointing to an ECS.
resource "alicloud_cen_instance" "default" {
  name = "my-cen"
}
resource "alicloud_log_project" "default" {
  name        = "sls-for-flowlog"
  description = "create by terraform"
}
resource "alicloud_log_store" "default" {
  project               = alicloud_log_project.default.name
  name                  = "sls-for-flowlog"
  retention_period      = 3650
  shard_count           = 3
  auto_split            = true
  max_split_shard_count = 60
  append_meta           = true
}

resource "alicloud_cen_flowlog" "default" {
  flow_log_name  = "my-flowlog"
  cen_id         = alicloud_cen_instance.default.id
  project_name   = alicloud_log_project.default.name
  log_store_name = alicloud_log_store.default.name
}