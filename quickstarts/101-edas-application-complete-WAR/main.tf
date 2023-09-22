data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_edas_cluster" "default" {
  cluster_name = "${var.name}"
  cluster_type = 2
  network_mode = 2
  vpc_id       = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_edas_application" "default" {
  application_name = var.application_name_var
  cluster_id       = alicloud_edas_cluster.default.id
  package_type     = "WAR"
}
