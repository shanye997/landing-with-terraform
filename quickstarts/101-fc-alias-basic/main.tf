resource "alicloud_fc_service" "default" {
  name    = "${var.name}"
  publish = "true"
}

resource "alicloud_fc_alias" "default" {
  service_name    = alicloud_fc_service.default.name
  alias_name      = var.name
  service_version = var.service_version_var
}
