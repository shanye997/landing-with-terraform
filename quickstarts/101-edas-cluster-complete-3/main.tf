data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_edas_cluster" "default" {
  cluster_type = "3"
  network_mode = "2"
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cluster_name = "tf-example-edasclusterchange169445394633915024"
}
