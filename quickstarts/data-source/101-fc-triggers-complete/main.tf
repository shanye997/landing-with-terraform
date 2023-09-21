data "alicloud_regions" "default" {
  current = true
}

data "alicloud_account" "default" {
}

resource "alicloud_log_project" "default" {
  name        = "${var.name}"
  description = "tf unit test"
}

resource "alicloud_log_store" "default" {
  project          = "${alicloud_log_project.default.name}"
  name             = "${var.name}-source"
  retention_period = "3000"
  shard_count      = 1
}

resource "alicloud_log_store" "default1" {
  project          = "${alicloud_log_project.default.name}"
  name             = "${var.name}"
  retention_period = "3000"
  shard_count      = 1
}

resource "alicloud_fc_service" "default" {
  name            = "${var.name}"
  internet_access = false
}

resource "alicloud_oss_bucket" "default" {
  bucket = "${var.name}"
}

resource "alicloud_oss_bucket_object" "default" {
  bucket  = "${alicloud_oss_bucket.default.id}"
  key     = "fc/hello.zip"
  content = <<EOF
  	# -*- coding: utf-8 -*-
	def handler(event, context):
	    print "hello world"
	    return 'hello world'
  EOF
}

resource "alicloud_fc_function" "default" {
  service     = "${alicloud_fc_service.default.name}"
  name        = "${var.name}"
  oss_bucket  = "${alicloud_oss_bucket.default.id}"
  oss_key     = "${alicloud_oss_bucket_object.default.key}"
  memory_size = 512
  runtime     = "python2.7"
  handler     = "hello.handler"
}

resource "alicloud_fc_trigger" "default" {
  service    = "${alicloud_fc_service.default.name}"
  function   = "${alicloud_fc_function.default.name}"
  name       = "${var.name}"
  role       = "${alicloud_ram_role.default.arn}"
  source_arn = "acs:log:${data.alicloud_regions.default.regions.0.id}:${data.alicloud_account.default.id}:project/${alicloud_log_project.default.name}"
  type       = "log"
  config     = <<EOF
  
    {
        "sourceConfig": {
            "logstore": "${alicloud_log_store.default.name}"
        },
        "jobConfig": {
            "maxRetryTime": 3,
            "triggerInterval": 60
        },
        "functionParameter": {
            "a": "b",
            "c": "d"
        },
        "logConfig": {
            "project": "${alicloud_log_project.default.name}",
            "logstore": "${alicloud_log_store.default1.name}"
        },
        "enable": true
    }

  EOF
  depends_on = ["alicloud_ram_role_policy_attachment.default"]
}

resource "alicloud_ram_role" "default" {
  name        = "${var.name}-trigger"
  document    = <<EOF
  
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "log.aliyuncs.com"
        ]
      }
    }
  ],
  "Version": "1"
}

  EOF
  description = "this is a test"
  force       = true
}

resource "alicloud_ram_policy" "default" {
  name        = "${var.name}-trigger"
  document    = <<EOF
  
    {
      "Version": "1",
      "Statement": [
        {
          "Action": [
            "log:Get*",
            "log:List*",
            "log:PostLogStoreLogs",
            "log:CreateConsumerGroup",
            "log:UpdateConsumerGroup",
            "log:DeleteConsumerGroup",
            "log:ListConsumerGroup",
            "log:ConsumerGroupUpdateCheckPoint",
            "log:ConsumerGroupHeartBeat",
            "log:GetConsumerGroupCheckPoint"
          ],
          "Resource": "*",
          "Effect": "Allow"
        }
      ]
    }

  EOF
  description = "this is a test"
  force       = true
}

resource "alicloud_ram_role_policy_attachment" "default" {
  role_name   = "${alicloud_ram_role.default.name}"
  policy_name = "${alicloud_ram_policy.default.name}"
  policy_type = "Custom"
}

data "alicloud_fc_triggers" "default" {
  service_name  = alicloud_fc_trigger.default.service
  function_name = alicloud_fc_trigger.default.function
  ids = [
    alicloud_fc_trigger.default.trigger_id
  ]
  name_regex = "${alicloud_fc_trigger.default.name}_fake"
}
