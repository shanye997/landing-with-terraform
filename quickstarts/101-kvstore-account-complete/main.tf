data "alicloud_kvstore_zones" "default" {
  instance_charge_type = "PostPaid"
}

resource "alicloud_kvstore_instance" "default" {
  zone_id        = data.alicloud_kvstore_zones.default.zones[length(data.alicloud_kvstore_zones.default.ids) - 1].id
  instance_class = "redis.master.small.default"
  instance_name  = var.name
  engine_version = "5.0"
}

resource "alicloud_kvstore_account" "default" {
  account_password  = var.account_password_var
  account_privilege = var.account_privilege_var
  description       = var.description_var
  instance_id       = alicloud_kvstore_instance.default.id
  account_name      = "tftest"
}
