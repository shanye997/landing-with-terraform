data "alicloud_instance_types" "default" {
  instance_type_family = "ecs.g7"
}

resource "alicloud_reserved_instance" "default" {
  instance_type   = "ecs.g6.large"
  scope           = "Zone"
  description     = var.description_var
  period_unit     = "Month"
  instance_amount = "1"
  tags = {
    Created = "TF1"
    Foo     = "Bar1"
  }
  offering_type          = "All Upfront"
  period                 = "1"
  renewal_status         = var.renewal_status_var
  reserved_instance_name = var.reserved_instance_name_var
  zone_id                = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
  auto_renew_period      = var.auto_renew_period_var
}
