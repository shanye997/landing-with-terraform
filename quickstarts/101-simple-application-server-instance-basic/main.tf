data "alicloud_simple_application_server_images" "default" {
  platform = "Linux"
}

data "alicloud_simple_application_server_plans" "default" {
  platform = "Linux"
}

resource "alicloud_simple_application_server_instance" "default" {
  image_id = data.alicloud_simple_application_server_images.default.images.0.id
  period   = var.period_var
  plan_id  = data.alicloud_simple_application_server_plans.default.plans.0.id
}
