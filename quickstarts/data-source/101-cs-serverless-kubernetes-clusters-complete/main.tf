data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "vpc" {
  vpc_name   = var.name
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "vswitch" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = cidrsubnet(alicloud_vpc.vpc.cidr_block, 8, 8)
  zone_id      = data.alicloud_zones.default.zones.0.id
  vswitch_name = var.name
}

resource "alicloud_cs_serverless_kubernetes" "default" {
  name_prefix                    = "${var.name}"
  vpc_id                         = alicloud_vpc.vpc.id
  vswitch_ids                    = [alicloud_vswitch.vswitch.id]
  new_nat_gateway                = true
  cluster_spec                   = "ack.pro.small"
  endpoint_public_access_enabled = true
  private_zone                   = false
  deletion_protection            = false
  service_cidr                   = "10.0.1.0/24"
  load_balancer_spec             = "slb.s2.small"
  tags = {
    "k-aa" : "v-aa"
    "k-bb" : "v-aa",
  }
}

data "alicloud_cs_serverless_kubernetes_clusters" "default" {
  name_regex     = "${alicloud_cs_serverless_kubernetes.default.name}-fake"
  enable_details = var.enable_details_var
  ids = [
    alicloud_cs_serverless_kubernetes.default.id
  ]
}
