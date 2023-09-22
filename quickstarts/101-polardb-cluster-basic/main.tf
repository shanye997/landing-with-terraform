data "alicloud_polardb_node_classes" "this" {
  db_type    = "MySQL"
  db_version = "8.0"
  pay_type   = "PostPaid"
  category   = "Normal"
}

resource "alicloud_polardb_cluster" "default" {
  parameters {
    name  = "wait_timeout"
    value = "86"
  }
  parameters {
    name  = "innodb_old_blocks_time"
    value = "10"
  }

  db_version    = "8.0"
  db_node_class = data.alicloud_polardb_node_classes.this.classes.0.supported_engines.0.available_resources.0.db_node_class
  db_type       = "MySQL"
}
