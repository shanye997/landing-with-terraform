data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_sae_application" "default" {
  app_description = var.name
  app_name        = var.name
  namespace_id    = alicloud_sae_namespace.default.id
  image_url       = "registry-vpc.cn-hangzhou.aliyuncs.com/sae-demo-image/consumer:1.0"
  package_type    = "Image"
  vswitch_id      = data.alicloud_vswitches.default.vswitches.0.id
  vpc_id          = data.alicloud_vpcs.default.ids.0
  timezone        = "Asia/Beijing"
  replicas        = "5"
  cpu             = "500"
  memory          = "2048"
}

resource "alicloud_slb" "default" {
  load_balancer_name = var.name
  load_balancer_spec = "slb.s2.small"
  vswitch_id         = data.alicloud_vswitches.default.vswitches.0.id
}

resource "alicloud_sae_namespace" "default" {
  namespace_description = var.name
  namespace_id          = var.namespace_id
  namespace_name        = var.name
}

resource "alicloud_sae_ingress" "default" {
  rules {
    path           = "/"
    app_id         = alicloud_sae_application.default.id
    app_name       = alicloud_sae_application.default.app_name
    container_port = "443"
    domain         = "www.sohu.com"
  }

  slb_id        = alicloud_slb.default.id
  namespace_id  = alicloud_sae_namespace.default.id
  listener_port = var.listener_port_var
}
