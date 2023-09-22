resource "alicloud_express_connect_physical_connection" "default" {
  access_point_id = "ap-cn-hangzhou-yh-B"
  line_operator   = var.line_operator_var
}
