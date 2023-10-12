data "alicloud_resource_manager_resource_groups" "defaults" {
  name_regex = "default"
}

resource "alicloud_ddoscoo_scheduler_rule" "default" {
  resource_group_id = data.alicloud_resource_manager_resource_groups.defaults.groups[0].id
  rule_name         = "tf-exampleDdoscooSchedulerRule660180"
  rule_type         = var.rule_type_var
  rules {
    value      = "170.33.2.125"
    value_type = "1"
    priority   = "100"
    region_id  = "cn-hangzhou"
    type       = "A"
  }
  rules {
    priority   = "50"
    region_id  = "cn-hangzhou"
    type       = "A"
    value      = "170.33.14.193"
    value_type = "6"
  }

}
