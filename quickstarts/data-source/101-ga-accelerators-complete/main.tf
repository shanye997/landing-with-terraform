resource "alicloud_ga_accelerator" "default" {
  duration         = 1
  spec             = "1"
  accelerator_name = var.name
  auto_use_coupon  = true
  description      = var.name
}

data "alicloud_ga_accelerators" "default" {
  ids = [
    "${alicloud_ga_accelerator.default.id}_fake"
  ]
  name_regex = "${alicloud_ga_accelerator.default.accelerator_name}_fake"
}
