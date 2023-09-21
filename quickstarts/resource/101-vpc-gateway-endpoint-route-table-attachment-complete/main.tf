resource "alicloud_vpc" "defaulteVpc" {
  description = "test"
}

resource "alicloud_vpc_gateway_endpoint" "defaultGE" {
  service_name                = "com.aliyun.cn-hangzhou.oss"
  policy_document             = "{ \"Version\" : \"1\", \"Statement\" : [ { \"Effect\" : \"Allow\", \"Resource\" : [ \"*\" ], \"Action\" : [ \"*\" ], \"Principal\" : [ \"*\" ] } ] }"
  vpc_id                      = alicloud_vpc.defaulteVpc.id
  gateway_endpoint_descrption = "test-gateway-endpoint"
  gateway_endpoint_name       = "${var.name}1"
}

resource "alicloud_route_table" "defaultRT" {
  vpc_id           = alicloud_vpc.defaulteVpc.id
  route_table_name = "${var.name}2"
}

resource "alicloud_vpc_gateway_endpoint_route_table_attachment" "default" {
  route_table_id      = alicloud_route_table.defaultRT.id
  gateway_endpoint_id = alicloud_vpc_gateway_endpoint.defaultGE.id
}
