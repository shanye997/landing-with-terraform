resource "alicloud_vpc" "defaultVpc" {
  description = "tf-example"
}

resource "alicloud_vpc_gateway_endpoint" "default" {
  vpc_id       = alicloud_vpc.defaultVpc.id
  service_name = var.domain
}
