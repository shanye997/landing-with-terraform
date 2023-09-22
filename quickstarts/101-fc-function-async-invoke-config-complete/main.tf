resource "alicloud_fc_service" "default" {
  name       = var.name
  role       = alicloud_ram_role.default.arn
  depends_on = ["alicloud_ram_role_policy_attachment.default"]
}

resource "alicloud_oss_bucket" "default" {
  bucket = var.name
}

resource "alicloud_oss_bucket_object" "default" {
  bucket  = alicloud_oss_bucket.default.id
  key     = "fc/hello.zip"
  content = <<EOF
    # -*- coding: utf-8 -*-
  def handler(event, context):
      print "hello world"
      return 'hello world'
  EOF
}

resource "alicloud_fc_function" "default" {
  service     = alicloud_fc_service.default.name
  name        = var.name
  oss_bucket  = alicloud_oss_bucket.default.id
  oss_key     = alicloud_oss_bucket_object.default.key
  memory_size = 512
  runtime     = "python2.7"
  handler     = "hello.handler"
  depends_on  = ["alicloud_mns_queue.default", "alicloud_mns_topic.default"]
}

resource "alicloud_mns_queue" "default" {
  name = var.name
}

resource "alicloud_mns_topic" "default" {
  name = var.name
}

resource "alicloud_ram_role" "default" {
  name        = var.name
  document    = <<DEFINITION
	{
		"Statement": [
		  {
			"Action": "sts:AssumeRole",
			"Effect": "Allow",
			"Principal": {
			  "Service": [
				"fc.aliyuncs.com"
			  ]
			}
		  }
		],
		"Version": "1"
	}
	DEFINITION
  description = "this is a test"
  force       = true
}

resource "alicloud_ram_policy" "default" {
  name     = var.name
  document = <<DEFINITION
	{
		"Version": "1",
		"Statement": [
		  {
			"Action": "mns:*",
			"Resource": "*",
			"Effect": "Allow"
		  }
		]
	  }
	DEFINITION
}

resource "alicloud_ram_role_policy_attachment" "default" {
  role_name   = alicloud_ram_role.default.name
  policy_name = alicloud_ram_policy.default.name
  policy_type = "Custom"
}

resource "alicloud_fc_function_async_invoke_config" "default" {
  destination_config {
    on_success {
      destination = "acs:mns:ap-southeast-1::/queues/tf-examplealicloudfcasyncinvoke-492042/messages"
    }

    on_failure {
      destination = "acs:mns:ap-southeast-1::/topics/tf-examplealicloudfcasyncinvoke-492042/messages"
    }

  }

  function_name                = alicloud_fc_function.default.name
  maximum_event_age_in_seconds = var.maximum_event_age_in_seconds_var
  stateful_invocation          = var.stateful_invocation_var
  maximum_retry_attempts       = var.maximum_retry_attempts_var
  service_name                 = alicloud_fc_service.default.name
}
