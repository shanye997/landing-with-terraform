resource "alicloud_drds_instance" "default" {
  description          = "drds instance"
  instance_charge_type = "PostPaid"
  zone_id              = "cn-hangzhou-e"
  vswitch_id           = "vsw-bp1jlu3swk8rq2yoi40ey"
  instance_series      = "drds.sn1.4c8g"
  specification        = "drds.sn1.4c8g.8C16G"
}