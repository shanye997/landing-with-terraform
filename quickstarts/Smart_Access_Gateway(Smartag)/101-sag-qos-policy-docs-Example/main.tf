variable "name" {
  default = "tf-example"
}
provider "alicloud" {
  region = "cn-shanghai"
}
resource "alicloud_sag_qos" "default" {
  name = var.name
}

resource "alicloud_sag_qos_policy" "default" {
  qos_id            = alicloud_sag_qos.default.id
  name              = var.name
  description       = var.name
  priority          = "1"
  ip_protocol       = "ALL"
  source_cidr       = "192.168.0.0/24"
  source_port_range = "-1/-1"
  dest_cidr         = "10.10.0.0/24"
  dest_port_range   = "-1/-1"
  start_time        = replace(timestamp(), "Z", "+0800")
  end_time          = replace(timeadd(timestamp(), "24h"), "Z", "+0800")
}