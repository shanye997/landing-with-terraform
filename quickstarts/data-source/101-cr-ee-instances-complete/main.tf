resource "alicloud_cr_ee_instance" "default" {
  payment_type   = "Subscription"
  period         = 1
  renewal_status = "ManualRenewal"
  instance_type  = "Advanced"
  instance_name  = var.name
}

data "alicloud_cr_ee_instances" "default" {
  name_regex     = var.name_regex_var
  enable_details = var.enable_details_var
  ids = [
    alicloud_cr_ee_instance.default.id
  ]
}
