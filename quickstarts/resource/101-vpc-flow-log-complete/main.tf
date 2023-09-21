resource "alicloud_vpc" "defaultVpc" {
  vpc_name   = "${var.name}1"
  cidr_block = "10.0.0.0/8"
}

resource "alicloud_resource_manager_resource_group" "ModifyRG" {
  display_name        = "tf-example-rg439"
  resource_group_name = "${var.name}2"
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
  log_store_name = alicloud_log_store.default.name
  tags = {
    For     = "Test"
    Created = "TF"
  }
  resource_id = alicloud_vpc.defaultVpc.id
  status      = var.status_var
  traffic_path = [
    "all"
  ]
  traffic_type         = "All"
  description          = var.description_var
  flow_log_name        = var.flow_log_name_var
  resource_type        = "VPC"
  aggregation_interval = var.aggregation_interval_var
  project_name         = alicloud_log_project.default.name
  resource_group_id    = alicloud_resource_manager_resource_group.ModifyRG.id
}
