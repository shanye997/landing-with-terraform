variable "sag_id" {
  default = "sag-9bifkfaz***"
}
provider "alicloud" {
  region = "cn-shanghai"
}

resource "alicloud_sag_dnat_entry" "default" {
  sag_id        = var.sag_id
  type          = "Intranet"
  ip_protocol   = "any"
  external_ip   = "172.32.0.2"
  external_port = "any"
  internal_ip   = "172.16.0.4"
  internal_port = "any"
}