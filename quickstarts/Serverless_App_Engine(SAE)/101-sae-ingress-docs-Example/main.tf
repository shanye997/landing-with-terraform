provider "alicloud" {
  region = "cn-hangzhou"
}

variable "name" {
  default = "tf-example"
}
data "alicloud_regions" "default" {
  current = true
}
resource "random_integer" "default" {
  max = 99999
  min = 10000
}
data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "10.4.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = "10.4.0.0/24"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}
resource "alicloud_security_group" "default" {
  vpc_id = alicloud_vpc.default.id
}

resource "alicloud_sae_namespace" "default" {
  namespace_id              = "${data.alicloud_regions.default.regions.0.id}:example${random_integer.default.result}"
  namespace_name            = var.name
  namespace_description     = var.name
  enable_micro_registration = false
}

resource "alicloud_sae_application" "default" {
  app_description   = var.name
  app_name          = "${var.name}-${random_integer.default.result}"
  namespace_id      = alicloud_sae_namespace.default.id
  image_url         = "registry-vpc.${data.alicloud_regions.default.regions.0.id}.aliyuncs.com/sae-demo-image/consumer:1.0"
  package_type      = "Image"
  security_group_id = alicloud_security_group.default.id
  vpc_id            = alicloud_vpc.default.id
  vswitch_id        = alicloud_vswitch.default.id
  timezone          = "Asia/Beijing"
  replicas          = "5"
  cpu               = "500"
  memory            = "2048"
}

resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name = var.name
  vswitch_id         = alicloud_vswitch.default.id
  load_balancer_spec = "slb.s2.small"
  address_type       = "intranet"
}

resource "alicloud_sae_ingress" "default" {
  slb_id        = alicloud_slb_load_balancer.default.id
  namespace_id  = alicloud_sae_namespace.default.id
  listener_port = "80"
  rules {
    app_id         = alicloud_sae_application.default.id
    container_port = "443"
    domain         = "www.alicloud.com"
    app_name       = alicloud_sae_application.default.app_name
    path           = "/"
  }
  default_rule {
    app_id         = alicloud_sae_application.default.id
    container_port = "443"
  }
}