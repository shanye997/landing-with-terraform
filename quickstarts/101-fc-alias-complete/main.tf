resource "alicloud_fc_service" "default" {
  name    = "${var.name}"
  publish = "true"
}

resource "alicloud_fc_alias" "default" {
  alias_name  = var.name
  description = var.description_var
  routing_config {
    additional_version_weights = {

    }
  }

  service_name    = alicloud_fc_service.default.name
  service_version = var.service_version_var
}
