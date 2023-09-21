resource "alicloud_ga_bandwidth_package" "default" {
  bandwidth              = var.bandwidth_var
  payment_type           = "PayAsYouGo"
  description            = var.description_var
  bandwidth_package_name = var.name
  bandwidth_type         = var.bandwidth_type_var
  billing_type           = "PayBy95"
  ratio                  = "30"
  tags = {
    Created = "TF"
    For     = "BandwidthPackage"
  }
  type = "Basic"
}
