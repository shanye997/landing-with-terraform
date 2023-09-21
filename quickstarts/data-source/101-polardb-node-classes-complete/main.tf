data "alicloud_polardb_node_classes" "default" {
  db_version    = "11"
  pay_type      = "PostPaid"
  category      = var.category_var
  region_id     = var.region_id_var
  db_node_class = var.db_node_class_var
  db_type       = "PostgreSQL"
}
