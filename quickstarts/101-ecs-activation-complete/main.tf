resource "alicloud_ecs_activation" "default" {
  instance_count        = "10"
  instance_name         = var.name
  ip_address_range      = "0.0.0.0/0"
  time_to_live_in_hours = "4"
  description           = var.name
}
