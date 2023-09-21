resource "alicloud_vpc" "defaultVpc" {
  vpc_name   = "${var.name}1"
  cidr_block = "10.0.0.0/8"
}

resource "alicloud_log_project" "default" {
  name = "${var.name}3"
}

resource "alicloud_log_store" "default" {
  project = alicloud_log_project.default.name
  name    = "${var.name}4"
}

resource "alicloud_vpc" "default" {
  cidr_block = "192.168.0.0/24"
  vpc_name   = var.name
}

resource "alicloud_vpc_flow_log" "default" {
  resource_type  = "VPC"
  log_store_name = alicloud_log_store.default.name
  project_name   = alicloud_log_project.default.name
  resource_id    = alicloud_vpc.defaultVpc.id
  traffic_type   = "All"
}
