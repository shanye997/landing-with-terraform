data "alicloud_zones" "default" {}

resource "alicloud_ocean_base_instance" "default" {
  disk_size = var.disk_size_var
  zones = [
    data.alicloud_zones.default.ids[length(data.alicloud_zones.default.ids) - 2],
    data.alicloud_zones.default.ids[length(data.alicloud_zones.default.ids) - 3],
    data.alicloud_zones.default.ids[length(data.alicloud_zones.default.ids) - 4]
  ]
  instance_class = var.instance_class_var
  series         = "normal"
  payment_type   = "Subscription"
}
