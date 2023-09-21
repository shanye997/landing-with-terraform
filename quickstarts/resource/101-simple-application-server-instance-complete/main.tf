data "alicloud_simple_application_server_images" "default" {
  platform = "Linux"
}

data "alicloud_simple_application_server_plans" "default" {
  platform = "Linux"
}

resource "alicloud_simple_application_server_instance" "default" {
  instance_name  = var.instance_name_var
  password       = var.password_var
  payment_type   = "Subscription"
  period         = var.period_var
  plan_id        = data.alicloud_simple_application_server_plans.default.plans.0.id
  status         = var.status_var
  data_disk_size = var.data_disk_size_var
  image_id       = data.alicloud_simple_application_server_images.default.images.0.id
}
