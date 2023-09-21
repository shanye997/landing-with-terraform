resource "alicloud_vpc" "defaultVpc" {
  description = "tf-example"
}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_vpc_gateway_endpoint" "default" {
  vpc_id                      = alicloud_vpc.defaultVpc.id
  gateway_endpoint_descrption = var.gateway_endpoint_descrption_var
  gateway_endpoint_name       = var.gateway_endpoint_name_var
  policy_document             = var.policy_document_var
  resource_group_id           = data.alicloud_resource_manager_resource_groups.default.groups.1.id
  service_name                = var.domain
  tags = {
    Created = "TF"
    For     = "Test"
  }
}
