resource "alicloud_sag_dnat_entry" "default" {
  sag_id        = ""
  ip_protocol   = "any"
  external_port = "any"
  internal_ip   = "172.16.0.4"
  internal_port = "any"
  type          = "Intranet"
}
