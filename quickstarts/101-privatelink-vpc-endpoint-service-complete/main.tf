resource "alicloud_privatelink_vpc_endpoint_service" "default" {
  service_description    = var.service_description_var
  auto_accept_connection = var.auto_accept_connection_var
  connect_bandwidth      = var.connect_bandwidth_var
}
