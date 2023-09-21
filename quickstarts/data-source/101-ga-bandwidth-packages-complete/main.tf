resource "alicloud_ga_bandwidth_package" "default" {
  bandwidth              = 100
  type                   = "Basic"
  bandwidth_type         = "Basic"
  payment_type           = "PayAsYouGo"
  billing_type           = "PayBy95"
  ratio                  = 30
  bandwidth_package_name = "tf-testBandwidthPackages_datasource-4759211345426542629"
}

data "alicloud_ga_bandwidth_packages" "default" {
  ids = [
    alicloud_ga_bandwidth_package.default.id
  ]
  name_regex     = alicloud_ga_bandwidth_package.default.bandwidth_package_name
  status         = "active"
  enable_details = var.enable_details_var
}
