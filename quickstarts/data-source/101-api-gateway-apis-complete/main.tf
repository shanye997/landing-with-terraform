resource "alicloud_api_gateway_group" "default" {
  name        = "${var.name}"
  description = "${var.apigateway_group_description_test}"
}

resource "alicloud_api_gateway_api" "default" {
  name        = "${var.name}"
  group_id    = "${alicloud_api_gateway_group.default.id}"
  description = "tf_example_api description"
  auth_type   = "APP"
  request_config {
    protocol = "HTTP"
    method   = "GET"
    path     = "/test/path"
    mode     = "MAPPING"
  }
  service_type = "HTTP"
  http_service_config {
    address   = "http://apigateway-backend.alicloudapi.com:8080"
    method    = "GET"
    path      = "/web/cloudapi"
    timeout   = 20
    aone_name = "cloudapi-openapi"
  }

  request_parameters {
    name         = "testparam"
    type         = "STRING"
    required     = "OPTIONAL"
    in           = "QUERY"
    in_service   = "QUERY"
    name_service = "testparams"
  }
}

data "alicloud_api_gateway_apis" "default" {
  group_id = "${alicloud_api_gateway_group.default.id}_fake"
  ids = [
    alicloud_api_gateway_api.default.api_id
  ]
  name_regex = alicloud_api_gateway_api.default.name
}
