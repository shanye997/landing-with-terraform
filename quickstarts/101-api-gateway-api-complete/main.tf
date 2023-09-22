resource "alicloud_api_gateway_group" "default" {
  name        = "${var.name}"
  description = "tf_example_api group description"
}

resource "alicloud_api_gateway_vpc_access" "default" {
  name        = "${var.name}"
  vpc_id      = "${data.alicloud_vpcs.default.ids.0}"
  instance_id = "${alicloud_instance.default.id}"
  port        = "8080"
}

data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu_[0-9]+_[0-9]+_x64*"
  most_recent = true
  owners      = "system"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_vswitch" "vswitch" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
  zone_id      = data.alicloud_zones.default.zones.0.id
  vswitch_name = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_security_group" "default" {
  name        = "${var.name}"
  description = "foo"
  vpc_id      = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_instance" "default" {
  vswitch_id = local.vswitch_id
  image_id   = "${data.alicloud_images.default.images.0.id}"

  # series III
  instance_type        = "${data.alicloud_instance_types.default.instance_types.0.id}"
  system_disk_category = "cloud_efficiency"

  internet_charge_type       = "PayByTraffic"
  internet_max_bandwidth_out = 5
  security_groups            = ["${alicloud_security_group.default.id}"]
  instance_name              = "${var.name}"
}

resource "alicloud_api_gateway_api" "default" {
  description = var.description_var
  group_id    = alicloud_api_gateway_group.default.id
  name        = alicloud_api_gateway_group.default.name
  request_parameters {
    in           = "QUERY"
    in_service   = "QUERY"
    name         = "testparam"
    name_service = "testparams"
    required     = "OPTIONAL"
    type         = "STRING"
  }

  http_service_config {
    address   = "http://apigateway-backend.alicloudapi.com:8080"
    aone_name = "cloudapi-openapi"
    method    = "GET"
    path      = "/web/cloudapi/${count.index}"
    timeout   = "20"
  }

  mock_service_config {
    result    = "this is a mock test"
    aone_name = "cloudapi-openapi"
  }

  stage_names = [
    "RELEASE",
    "PRE",
    "TEST"
  ]
  service_type = var.service_type_var
  request_config {
    method   = "GET"
    mode     = "MAPPING"
    path     = "/test/path/vpc"
    protocol = "HTTP"
  }

  http_vpc_service_config {
    aone_name = "cloudapi-openapi"
    method    = "GET"
    name      = alicloud_api_gateway_vpc_access.default.name
    path      = "/web/cloudapi/vpc"
    timeout   = "20"
  }

  auth_type = var.auth_type_var
  fc_service_config {
    region        = "cn-hangzhou"
    service_name  = "tf_exampleApiGatewayApi_5212536"
    timeout       = "20"
    arn_role      = "cloudapi-openapi"
    function_name = "tf_exampleApiGatewayApi_5212536Func"
  }

  force_nonce_check = var.force_nonce_check_var
}
