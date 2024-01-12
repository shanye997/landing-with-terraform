variable "name" {
  default = "tf-example"
}
resource "alicloud_cr_ee_instance" "example" {
  payment_type   = "Subscription"
  period         = 1
  renew_period   = 0
  renewal_status = "ManualRenewal"
  instance_type  = "Advanced"
  instance_name  = var.name
}

resource "alicloud_cr_chart_namespace" "example" {
  instance_id    = alicloud_cr_ee_instance.example.id
  namespace_name = var.name
}

resource "alicloud_cr_chart_repository" "example" {
  repo_namespace_name = alicloud_cr_chart_namespace.example.namespace_name
  instance_id         = alicloud_cr_chart_namespace.example.instance_id
  repo_name           = var.name
}