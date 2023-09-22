resource "alicloud_msc_sub_contact" "default" {
  email        = var.email_var
  mobile       = var.mobile_var
  position     = "Other"
  contact_name = var.contact_name_var
}
