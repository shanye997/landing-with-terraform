resource "alicloud_ga_bandwidth_package" "default" {
  bandwidth = var.bandwidth_var
  type      = "Basic"
}
