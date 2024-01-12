variable "sag_id" {
  default = "sag-9bifk***"
}
provider "alicloud" {
  region = "cn-shanghai"
}

resource "alicloud_sag_snat_entry" "default" {
  sag_id     = var.sag_id
  cidr_block = "192.168.7.0/24"
  snat_ip    = "192.0.0.2"
}