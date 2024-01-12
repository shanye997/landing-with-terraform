variable "name" {
  default = "tf-example"
}
data "alicloud_regions" "default" {
  current = true
}

resource "alicloud_edas_namespace" "default" {
  debug_enable         = false
  description          = var.name
  namespace_logical_id = "${data.alicloud_regions.default.regions.0.id}:example"
  namespace_name       = var.name
}