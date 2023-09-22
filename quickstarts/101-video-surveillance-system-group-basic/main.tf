resource "alicloud_video_surveillance_system_group" "default" {
  push_domain  = var.push_domain_var
  in_protocol  = var.in_protocol_var
  play_domain  = "ultron.pub"
  group_name   = var.group_name_var
  out_protocol = var.out_protocol_var
}
