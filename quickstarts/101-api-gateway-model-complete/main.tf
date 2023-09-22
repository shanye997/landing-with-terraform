resource "alicloud_api_gateway_group" "default" {
  name        = var.name
  description = var.name
}

resource "alicloud_api_gateway_model" "default" {
  schema      = var.schema_var
  description = var.description_var
  group_id    = alicloud_api_gateway_group.default.id
  model_name  = "tf-example-name12857"
}
