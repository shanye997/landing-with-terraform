resource "alicloud_graph_database_db_instance" "default" {
  db_instance_network_type = "vpc"
  db_node_storage          = var.db_node_storage_var
  db_version               = "1.0"
  db_instance_storage_type = "cloud_essd"
  db_node_class            = var.db_node_class_var
  db_instance_category     = "SINGLE"
  payment_type             = "PayAsYouGo"
}
