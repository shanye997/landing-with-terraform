resource "alicloud_sag_dnat_entry" "default" {
  external_port = "1"
  internal_ip   = "10.0.0.${count.index}"
  internal_port = "20"
  ip_protocol   = "tcp"
  sag_id        = ""
  type          = "Intranet"
  count         = "5"
  external_ip   = "1.0.0.${count.index}"
}
