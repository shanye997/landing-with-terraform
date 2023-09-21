data "alicloud_ga_accelerators" "default" {
  status = "active"
}

resource "alicloud_ga_bandwidth_package" "default" {
  bandwidth              = 100
  type                   = "Basic"
  bandwidth_type         = "Basic"
  payment_type           = "PayAsYouGo"
  billing_type           = "PayBy95"
  ratio                  = 30
  bandwidth_package_name = var.name
  auto_pay               = true
  auto_use_coupon        = true
}

resource "alicloud_ga_bandwidth_package_attachment" "default" {
  // Please run resource ga_accelerator test case to ensure this account has at least one accelerator before run this case.
  accelerator_id       = data.alicloud_ga_accelerators.default.ids.0
  bandwidth_package_id = alicloud_ga_bandwidth_package.default.id
}

resource "alicloud_ga_listener" "default" {
  port_ranges {
    from_port = "80"
    to_port   = "90"
  }
  accelerator_id = alicloud_ga_bandwidth_package_attachment.default.accelerator_id
  name           = var.name
  description    = "create_description"
}

data "alicloud_ga_listeners" "default" {
  accelerator_id = alicloud_ga_listener.default.accelerator_id
  ids = [
    "${alicloud_ga_listener.default.id}_fake"
  ]
  name_regex = "${alicloud_ga_listener.default.name}_fake"
  status     = "creating"
}
