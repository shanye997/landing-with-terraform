variable "name" {
  default = "terraform-example"
}
resource "alicloud_cr_ee_instance" "example" {
  payment_type   = "Subscription"
  period         = 1
  renew_period   = 0
  renewal_status = "ManualRenewal"
  instance_type  = "Advanced"
  instance_name  = var.name
}

resource "alicloud_cr_ee_namespace" "example" {
  instance_id        = alicloud_cr_ee_instance.example.id
  name               = var.name
  auto_create        = false
  default_visibility = "PUBLIC"
}

resource "alicloud_cr_ee_repo" "example" {
  instance_id = alicloud_cr_ee_instance.example.id
  namespace   = alicloud_cr_ee_namespace.example.name
  name        = var.name
  summary     = "this is summary of my new repo"
  repo_type   = "PUBLIC"
  detail      = "this is a public repo"
}