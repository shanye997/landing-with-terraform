resource "alicloud_pvtz_zone" "basic" {
  name = "tf-example8431717.test.com"
}

resource "alicloud_pvtz_zone_record" "foo" {
  zone_id = "${alicloud_pvtz_zone.basic.id}"
  rr      = "www"
  type    = "A"
  value   = "2.2.2.2"
  ttl     = "60"
}

data "alicloud_pvtz_zone_records" "default" {
  keyword = "${alicloud_pvtz_zone_record.foo.value}-fake"
  zone_id = alicloud_pvtz_zone_record.foo.zone_id
  ids = [
    "${alicloud_pvtz_zone_record.foo.record_id}-fake"
  ]
}
