data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_edas_cluster" "default" {
  cluster_name = "${var.name}-${count.index}"
  cluster_type = "2"
  count        = "2"
  network_mode = "2"
  vpc_id       = data.alicloud_vpcs.default.ids.0
}
