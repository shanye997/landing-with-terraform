resource "alicloud_polardb_parameter_group" "default" {
  db_version = "8.0"
  db_type    = "MySQL"
  parameters {
    param_name  = "wait_timeout"
    param_value = "86400"
  }
  parameters {
    param_value = "1000"
    param_name  = "innodb_old_blocks_time"
  }

  name = "tf_example"
}
