resource "alicloud_pvtz_zone" "default" {
  name = "tf-example2555325.test.com"
}

resource "alicloud_pvtz_zone_record" "default" {
  rr       = var.rr_var
  type     = var.type_var
  value    = var.value_var
  zone_id  = alicloud_pvtz_zone.default.id
  ttl      = var.ttl_var
  priority = var.priority_var
  count    = "5"
  remark   = var.remark_var
  status   = var.status_var
}
