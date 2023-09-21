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
  application_name = "${var.name}"
  cluster_id       = "${alicloud_edas_cluster.default.id}"
  package_type     = "JAR"
}

resource "alicloud_edas_deploy_group" "default" {
  group_name = "tf-example-edasdeploygroupchange1076"
  app_id     = alicloud_edas_application.default.id
}
