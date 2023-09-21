data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = "${alicloud_vpc.default.id}"
  cidr_block   = "172.16.0.0/24"
  zone_id      = "${data.alicloud_zones.default.zones.0.id}"
  vswitch_name = "${var.name}"
}

resource "alicloud_vswitch" "default1" {
  name              = "${var.name}_bar"
  vpc_id            = "${alicloud_vpc.default.id}"
  cidr_block        = "172.16.1.0/24"
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
}

resource "alicloud_ess_scaling_group" "default" {
  min_size           = 1
  max_size           = 1
  scaling_group_name = "${var.name}"
  removal_policies   = ["OldestInstance", "NewestInstance"]
  vswitch_ids        = ["${alicloud_vswitch.default.id}", "${alicloud_vswitch.default1.id}"]
}

resource "alicloud_ess_scaling_rule" "default" {
  count             = 2
  scaling_rule_name = "${var.name}-${count.index}"
  scaling_group_id  = "${alicloud_ess_scaling_group.default.id}"
  adjustment_type   = "TotalCapacity"
  adjustment_value  = 2
  cooldown          = 60
}

resource "alicloud_ess_alarm" "default" {
  comparison_operator = var.comparison_operator_var
  description         = var.description_var
  dimensions = {

  }
  metric_name      = var.metric_name_var
  statistics       = var.statistics_var
  evaluation_count = var.evaluation_count_var
  count            = "10"
  alarm_actions = [
    alicloud_ess_scaling_rule.default.0.ari
  ]
  cloud_monitor_group_id = var.cloud_monitor_group_id_var
  name                   = var.name_var
  scaling_group_id       = alicloud_ess_scaling_group.default.id
  period                 = "300"
  enable                 = var.enable_var
  metric_type            = "system"
  threshold              = var.threshold_var
}
