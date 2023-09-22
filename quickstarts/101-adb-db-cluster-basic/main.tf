resource "alicloud_adb_db_cluster" "default" {
  mode                = var.mode_var
  db_cluster_category = var.db_cluster_category_var
}
