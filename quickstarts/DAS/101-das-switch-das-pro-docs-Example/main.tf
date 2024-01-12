variable "name" {
  default = "tfexample"
}

data "alicloud_account" "default" {}
data "alicloud_polardb_node_classes" "default" {
  db_type    = "MySQL"
  db_version = "8.0"
  pay_type   = "PostPaid"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = "172.16.0.0/24"
  zone_id      = data.alicloud_polardb_node_classes.default.classes[0].zone_id
  vswitch_name = var.name
}

resource "alicloud_polardb_cluster" "default" {
  db_type       = "MySQL"
  db_version    = "8.0"
  db_node_class = "polar.mysql.x4.large"
  pay_type      = "PostPaid"
  vswitch_id    = alicloud_vswitch.default.id
  description   = var.name
  db_cluster_ip_array {
    db_cluster_ip_array_name = "default"
    security_ips             = ["1.2.3.4", "1.2.3.5"]
  }
}

resource "alicloud_das_switch_das_pro" "default" {
  instance_id   = alicloud_polardb_cluster.default.id
  sql_retention = 30
  user_id       = data.alicloud_account.default.id
}