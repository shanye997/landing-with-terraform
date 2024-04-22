variable "name" {
  default = "terraform-example"
}

resource "random_integer" "default" {
  min = 10000
  max = 99999
}

resource "alicloud_dcdn_kv_namespace" "default" {
  description = var.name
  namespace   = "${var.name}-${random_integer.default.result}"
}

resource "alicloud_dcdn_kv" "default" {
  value     = "example-value"
  key       = "${var.name}-${random_integer.default.result}"
  namespace = alicloud_dcdn_kv_namespace.default.namespace
}