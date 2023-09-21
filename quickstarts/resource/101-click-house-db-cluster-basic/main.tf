resource "alicloud_click_house_db_cluster" "default" {
  category                = "Basic"
  db_node_storage         = "100"
  db_cluster_class        = "S8"
  db_cluster_network_type = "vpc"
  payment_type            = "PayAsYouGo"
  storage_type            = "cloud_essd"
  db_node_group_count     = "1"
  db_cluster_version      = "22.8.5.29"
}
