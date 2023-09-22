resource "alicloud_sag_dnat_entry" "default" {
  ip_protocol   = "any"
  sag_id        = ""
  type          = "Intranet"
  external_ip   = "172.32.0.2"
  external_port = "any"
  internal_ip   = "172.16.0.4"
  internal_port = "any"
}
