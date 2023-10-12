data "alicloud_polardb_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  zone_id = local.zone_id
  vpc_id  = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_vswitch" "this" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = "tf_examplePolarDB"
  vpc_id       = data.alicloud_vpcs.default.ids.0
  zone_id      = data.alicloud_polardb_zones.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 8, 4)
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids.0 : concat(alicloud_vswitch.this.*.id, [""])[0]
  zone_id    = data.alicloud_polardb_zones.default.ids[length(data.alicloud_polardb_zones.default.ids) - 1]
}

data "alicloud_polardb_node_classes" "this" {
  db_type    = "MySQL"
  db_version = "8.0"
  pay_type   = "PostPaid"
  zone_id    = local.zone_id
  category   = "Normal"
}

resource "alicloud_polardb_cluster" "default" {
  db_type       = "MySQL"
  db_version    = "8.0"
  pay_type      = "PostPaid"
  db_node_class = data.alicloud_polardb_node_classes.this.classes.0.supported_engines.0.available_resources.0.db_node_class
  vswitch_id    = local.vswitch_id
  description   = "${var.name}"
}

data "alicloud_polardb_endpoints" "default1" {
  db_cluster_id = "${alicloud_polardb_cluster.default.id}"
}

resource "alicloud_polardb_endpoint_address" "default" {
  db_cluster_id     = alicloud_polardb_cluster.default.id
  db_endpoint_id    = data.alicloud_polardb_endpoints.default1.endpoints[0].db_endpoint_id
  net_type          = "Public"
  connection_prefix = var.connection_prefix_var
}
