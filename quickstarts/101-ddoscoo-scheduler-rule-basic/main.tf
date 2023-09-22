resource "alicloud_ddoscoo_scheduler_rule" "default" {
  rule_name = "tf-exampleDdoscooSchedulerRule660180"
  rule_type = var.rule_type_var
  rules {
    type       = "A"
    value      = "170.33.2.125"
    value_type = "1"
    priority   = "100"
    region_id  = "cn-hangzhou"
  }
  rules {
    type       = "A"
    value      = "170.33.14.193"
    value_type = "6"
    priority   = "50"
    region_id  = "cn-hangzhou"
  }

}
