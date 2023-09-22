resource "alicloud_service_catalog_portfolio" "default" {
  description    = "${var.name}"
  portfolio_name = "${var.name}"
  provider_name  = "${var.name}"
}
