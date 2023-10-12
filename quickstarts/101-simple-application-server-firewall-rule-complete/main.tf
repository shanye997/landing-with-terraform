data "alicloud_simple_application_server_images" "default" {
  platform = "Linux"
}

data "alicloud_simple_application_server_plans" "default" {
  platform = "Linux"
}

resource "alicloud_simple_application_server_instance" "default" {
  payment_type   = "Subscription"
  plan_id        = data.alicloud_simple_application_server_plans.default.plans.0.id
  instance_name  = var.name
  image_id       = data.alicloud_simple_application_server_images.default.images.0.id
  period         = 1
  data_disk_size = 100
}

resource "alicloud_simple_application_server_firewall_rule" "default" {
  port          = "1024/1055"
  remark        = var.name
  rule_protocol = "TcpAndUdp"
  instance_id   = alicloud_simple_application_server_instance.default.id
}
