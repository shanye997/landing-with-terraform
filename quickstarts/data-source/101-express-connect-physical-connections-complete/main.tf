resource "alicloud_express_connect_physical_connection" "default" {
  access_point_id          = "ap-cn-hangzhou-yh-B"
  line_operator            = "CT"
  peer_location            = var.name
  physical_connection_name = var.name
  type                     = "VPC"
  description              = "my domestic connection"
  port_type                = "1000Base-LX"
  bandwidth                = 100
}

data "alicloud_express_connect_physical_connections" "default" {
  ids = [
    "${alicloud_express_connect_physical_connection.default.id}-fake"
  ]
  name_regex = "tf-exampleExpressConnectPhysicalConnectionsTest76017fake"
  status     = "Approved"
}
