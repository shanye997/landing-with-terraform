resource "alicloud_fc_service" "default" {
  name = "${var.name}"
}

resource "alicloud_oss_bucket" "default" {
  bucket = "${var.name}"
}

resource "alicloud_oss_bucket_object" "default" {
  bucket  = "${alicloud_oss_bucket.default.id}"
  key     = "fc/hello.zip"
  content = <<EOF
		# -*- coding: utf-8 -*-
		def initializer(context):
			print "hello init"

		def handler(event, context):
			print "hello world"
			return 'hello world'
	EOF
}

resource "alicloud_fc_function" "default" {
  service     = "${alicloud_fc_service.default.name}"
  name        = "${var.name}"
  description = "${var.name}-description"
  oss_bucket  = "${alicloud_oss_bucket.default.id}"
  oss_key     = "${alicloud_oss_bucket_object.default.key}"
  memory_size = "512"
  runtime     = "python2.7"
  handler     = "hello.handler"
  timeout     = "120"
  environment_variables = {
    test   = "terraform"
    prefix = "tfAcc"
  }
  initializer            = "hello.initializer"
  initialization_timeout = "30"
  instance_type          = "e1"
}

locals {
  container_command = "[\"python\", \"server.py\"]"
  container_args    = "[\"a1\", \"a2\"]"
}

output "container_command" {
  value = "${local.container_command}"
}

output "container_args" {
  value = "${local.container_args}"
}

data "alicloud_fc_functions" "default" {
  service_name = alicloud_fc_function.default.service
}
