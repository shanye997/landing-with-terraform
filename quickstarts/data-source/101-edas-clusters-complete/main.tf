resource "alicloud_vpc" "default" {
  cidr_block = "172.16.0.0/12"
  name       = "${var.name}"
}

resource "alicloud_edas_cluster" "default" {
  cluster_name = "${var.name}"
  cluster_type = "2"
  network_mode = "2"
  vpc_id       = "${alicloud_vpc.default.id}"
}

data "alicloud_edas_clusters" "default" {
  ids = [
    "${alicloud_edas_cluster.default.id}_fake"
  ]
  logical_region_id = "cn-hangzhou"
  name_regex        = alicloud_edas_cluster.default.cluster_name
}
