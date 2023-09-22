resource "alicloud_express_connect_physical_connection" "default" {
  port_type                = var.port_type_var
  type                     = "VPC"
  access_point_id          = "ap-cn-hangzhou-yh-B"
  bandwidth                = var.bandwidth_var
  status                   = var.status_var
  circuit_code             = var.circuit_code_var
  line_operator            = var.line_operator_var
  description              = var.description_var
  peer_location            = var.peer_location_var
  physical_connection_name = var.physical_connection_name_var
}
