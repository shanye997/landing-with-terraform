data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = "${data.alicloud_vpcs.default.ids.0}"
}

resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name = var.name
  address_type       = "intranet"
  load_balancer_spec = "slb.s2.small"
  vswitch_id         = data.alicloud_vswitches.default.vswitches[0].id
}

resource "alicloud_sae_namespace" "default" {
  namespace_description = var.name
  namespace_id          = "cn-hangzhou:tfexample7744"
  namespace_name        = var.name
}

resource "alicloud_sae_application" "default" {
  app_description = var.name
  app_name        = var.name
  namespace_id    = alicloud_sae_namespace.default.namespace_id
  image_url       = "registry-vpc.cn-hangzhou.aliyuncs.com/lxepoo/apache-php5"
  package_type    = "Image"
  jdk             = "Open JDK 8"
  vswitch_id      = data.alicloud_vswitches.default.ids.0
  vpc_id          = data.alicloud_vpcs.default.ids.0
  timezone        = "Asia/Shanghai"
  replicas        = "5"
  cpu             = "500"
  memory          = "2048"
}

resource "alicloud_sae_load_balancer_intranet" "default" {
  app_id = alicloud_sae_application.default.id
  intranet {
    target_port = "9090"
    port        = "90"
    protocol    = "TCP"
  }
  intranet {
    port        = "99"
    protocol    = "TCP"
    target_port = "9999"
  }

  intranet_slb_id = alicloud_slb_load_balancer.default.id
}
