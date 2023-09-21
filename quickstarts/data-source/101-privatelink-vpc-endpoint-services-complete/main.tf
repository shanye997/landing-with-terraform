resource "alicloud_privatelink_vpc_endpoint_service" "default" {
  service_description    = "tf-examplePrivatelinkVpcEndpointServices2942161"
  connect_bandwidth      = 103
  auto_accept_connection = false
}

data "alicloud_privatelink_vpc_endpoint_services" "default" {
  ids = [
    "${alicloud_privatelink_vpc_endpoint_service.default.id}-fake"
  ]
  name_regex              = "com.aliyuncs.privatelink.eu-central-1.${alicloud_privatelink_vpc_endpoint_service.default.id}-fake"
  service_business_status = "FinancialLocked"
  status                  = "Creating"
}
