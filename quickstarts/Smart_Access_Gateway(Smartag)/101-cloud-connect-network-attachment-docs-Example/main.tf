variable "name" {
  default = "tf-example"
}
variable "sag_id" {
  default = "sag-9bifkf***"
}
provider "alicloud" {
  region = "cn-shanghai"
}
resource "alicloud_cloud_connect_network" "default" {
  name        = var.name
  description = var.name
  cidr_block  = "192.168.0.0/24"
  is_default  = true
}

resource "alicloud_cloud_connect_network_attachment" "default" {
  ccn_id = alicloud_cloud_connect_network.default.id
  sag_id = var.sag_id
}