data "alicloud_account" "default" {}
data "alicloud_regions" "default" {
  current = true
}
resource "random_integer" "default" {
  max = 99999
  min = 10000
}

resource "alicloud_event_bridge_service_linked_role" "service_linked_role" {
  product_name = "AliyunServiceRoleForEventBridgeSendToFC"
}

resource "alicloud_fc_service" "default" {
  name            = "example-value-${random_integer.default.result}"
  description     = "example-value"
  internet_access = false
}

resource "alicloud_oss_bucket" "default" {
  bucket = "terraform-example-${random_integer.default.result}"
}
# If you upload the function by OSS Bucket, you need to specify path can't upload by content.
resource "alicloud_oss_bucket_object" "default" {
  bucket  = alicloud_oss_bucket.default.id
  key     = "index.py"
  content = "import logging \ndef handler(event, context): \nlogger = logging.getLogger() \nlogger.info('hello world') \nreturn 'hello world'"
}

resource "alicloud_fc_function" "default" {
  service     = alicloud_fc_service.default.name
  name        = "terraform-example"
  description = "example"
  oss_bucket  = alicloud_oss_bucket.default.id
  oss_key     = alicloud_oss_bucket_object.default.key
  memory_size = "512"
  runtime     = "python3.10"
  handler     = "hello.handler"
}

resource "alicloud_fc_trigger" "oss_trigger" {
  service  = alicloud_fc_service.default.name
  function = alicloud_fc_function.default.name
  name     = "terraform-example-oss"
  type     = "eventbridge"
  config   = <<EOF
    {
        "triggerEnable": false,
        "asyncInvocationType": false,
        "eventRuleFilterPattern": {
          "source":[
            "acs.oss"
            ],
            "type":[
              "oss:BucketCreated:PutBucket"
            ]
        },
        "eventSourceConfig": {
            "eventSourceType": "Default"
        }
    }
EOF
}

resource "alicloud_fc_trigger" "mns_trigger" {
  service  = alicloud_fc_service.default.name
  function = alicloud_fc_function.default.name
  name     = "terraform-example-mns"
  type     = "eventbridge"
  config   = <<EOF
    {
        "triggerEnable": false,
        "asyncInvocationType": false,
        "eventRuleFilterPattern": "{}",
        "eventSourceConfig": {
            "eventSourceType": "MNS",
            "eventSourceParameters": {
                "sourceMNSParameters": {
                    "RegionId": "cn-hangzhou",
                    "QueueName": "mns-queue",
                    "IsBase64Decode": true
                }
            }
        }
    }
EOF
}

resource "alicloud_ons_instance" "default" {
  instance_name = "terraform-example-${random_integer.default.result}"
  remark        = "terraform-example"
}
resource "alicloud_ons_group" "default" {
  group_name  = "GID-example"
  instance_id = alicloud_ons_instance.default.id
  remark      = "terraform-example"
}
resource "alicloud_ons_topic" "default" {
  topic_name   = "mytopic"
  instance_id  = alicloud_ons_instance.default.id
  message_type = 0
  remark       = "terraform-example"
}

resource "alicloud_fc_trigger" "rocketmq_trigger" {
  service  = alicloud_fc_service.default.name
  function = alicloud_fc_function.default.name
  name     = "terraform-example-rocketmq"
  type     = "eventbridge"
  config   = <<EOF
    {
        "triggerEnable": false,
        "asyncInvocationType": false,
        "eventRuleFilterPattern": "{}",
        "eventSourceConfig": {
            "eventSourceType": "RocketMQ",
            "eventSourceParameters": {
                "sourceRocketMQParameters": {
                    "RegionId": "${data.alicloud_regions.default.regions.0.id}",
                    "InstanceId": "${alicloud_ons_instance.default.id}",
                    "GroupID": "${alicloud_ons_group.default.group_name}",
                    "Topic": "${alicloud_ons_topic.default.topic_name}",
                    "Timestamp": 1686296162,
                    "Tag": "example-tag",
                    "Offset": "CONSUME_FROM_LAST_OFFSET"
                }
            }
        }
    }
EOF
}

resource "alicloud_amqp_instance" "default" {
  instance_name  = "terraform-example-${random_integer.default.result}"
  instance_type  = "professional"
  max_tps        = 1000
  queue_capacity = 50
  support_eip    = true
  max_eip_tps    = 128
  payment_type   = "Subscription"
  period         = 1
}

resource "alicloud_amqp_virtual_host" "default" {
  instance_id       = alicloud_amqp_instance.default.id
  virtual_host_name = "example-VirtualHost"
}

resource "alicloud_amqp_queue" "default" {
  instance_id       = alicloud_amqp_virtual_host.default.instance_id
  queue_name        = "example-queue"
  virtual_host_name = alicloud_amqp_virtual_host.default.virtual_host_name
}

resource "alicloud_fc_trigger" "rabbitmq_trigger" {
  service  = alicloud_fc_service.default.name
  function = alicloud_fc_function.default.name
  name     = "terraform-example-rabbitmq"
  type     = "eventbridge"
  config   = <<EOF
    {
        "triggerEnable": false,
        "asyncInvocationType": false,
        "eventRuleFilterPattern": "{}",
        "eventSourceConfig": {
            "eventSourceType": "RabbitMQ",
            "eventSourceParameters": {
                "sourceRabbitMQParameters": {
                    "RegionId": "${data.alicloud_regions.default.regions.0.id}",
                    "InstanceId": "${alicloud_amqp_instance.default.id}",
                    "VirtualHostName": "${alicloud_amqp_virtual_host.default.virtual_host_name}",
                    "QueueName": "${alicloud_amqp_queue.default.queue_name}"
                }
            }
        }
    }
EOF
}