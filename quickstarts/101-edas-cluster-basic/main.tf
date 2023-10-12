resource "alicloud_edas_cluster" "default" {
  cluster_name = "${var.name}-${count.index}"
  cluster_type = "2"
  network_mode = "2"
  count        = "2"
}
