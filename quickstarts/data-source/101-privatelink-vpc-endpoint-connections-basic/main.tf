data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_security_group" "default" {
  name        = "tf-example-forprivatelink"
  description = "privatelink test security group"
  vpc_id      = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_privatelink_vpc_endpoint_service" "default" {
  service_description    = "test for privatelink connection"
  connect_bandwidth      = 103
  auto_accept_connection = false
}

resource "alicloud_privatelink_vpc_endpoint" "default" {
  service_id         = alicloud_privatelink_vpc_endpoint_service.default.id
  vpc_id             = data.alicloud_vpcs.default.ids.0
  security_group_ids = [alicloud_security_group.default.id]
  vpc_endpoint_name  = "testformaintf"
  depends_on         = [alicloud_privatelink_vpc_endpoint_service.default]
}

resource "alicloud_privatelink_vpc_endpoint_connection" "default" {
  service_id  = alicloud_privatelink_vpc_endpoint_service.default.id
  endpoint_id = alicloud_privatelink_vpc_endpoint.default.id
  bandwidth   = "1024"
}

data "alicloud_privatelink_vpc_endpoint_connections" "default" {
  service_id = alicloud_privatelink_vpc_endpoint_connection.default.service_id
}
