resource "alicloud_api_gateway_group" "default" {
  name        = var.name
  description = var.description
  instance_id = "api-shared-vpc-001"
}
