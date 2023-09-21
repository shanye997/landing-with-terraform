resource "alicloud_video_surveillance_system_group" "default" {
  out_protocol = var.out_protocol_var
  play_domain  = "ultron.pub"
  push_domain  = var.push_domain_var
  callback     = var.callback_var
  description  = var.description_var
  enabled      = var.enabled_var
  group_name   = var.group_name_var
  in_protocol  = var.in_protocol_var
}
