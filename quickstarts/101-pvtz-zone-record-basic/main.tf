resource "alicloud_pvtz_zone" "default" {
  name = "tf-example2555325.test.com"
}

resource "alicloud_pvtz_zone_record" "default" {
  value   = var.value_var
  count   = "5"
  type    = var.type_var
  zone_id = alicloud_pvtz_zone.default.id
}
