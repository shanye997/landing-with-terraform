resource "alicloud_msc_sub_contact" "default1" {
  contact_name = "tfceo"
  position     = "CEO"
  email        = "123@163.com"
  mobile       = "12312345906"
}

resource "alicloud_msc_sub_contact" "default2" {
  contact_name = "tfdirector"
  position     = "Technical Director"
  email        = "123@163.com"
  mobile       = "12312345906"
}

resource "alicloud_msc_sub_subscription" "default" {
  webhook_status = var.webhook_status_var
  contact_ids = [
    alicloud_msc_sub_contact.default1.id,
    alicloud_msc_sub_contact.default2.id
  ]
  email_status = var.email_status_var
  item_name    = "Notifications of Product Expiration"
  pmsg_status  = var.pmsg_status_var
  sms_status   = var.sms_status_var
  tts_status   = var.tts_status_var
}
