data "alicloud_account" "default" {
}

resource "alicloud_event_bridge_event_bus" "default" {
  event_bus_name = var.name
}

resource "alicloud_mns_queue" "queue2" {
  name = format("%schange", var.name)
}

locals {
  mns_endpoint_b = format("acs:mns:cn-hangzhou:%s:queues/%s", data.alicloud_account.default.id, alicloud_mns_queue.queue2.name)
}

resource "alicloud_event_bridge_rule" "default" {
  event_bus_name = alicloud_event_bridge_event_bus.default.event_bus_name
  rule_name      = var.name
  targets {
    endpoint = local.mns_endpoint_b
    param_list {
      form         = "CONSTANT"
      resource_key = "queue"
      value        = "tf-exampleEbRule"
    }
    param_list {
      template     = "This is $${v1}"
      value        = "{\n \"v1\":\"$.source\" \n}"
      form         = "TEMPLATE"
      resource_key = "Body"
    }

    target_id = "tf-test1"
    type      = "acs.mns.queue"
  }

  filter_pattern = var.filter_pattern_var
}
