resource "alicloud_service_catalog_portfolio" "default" {
  provider_name  = "${var.name}"
  portfolio_name = "${var.name}"
}
