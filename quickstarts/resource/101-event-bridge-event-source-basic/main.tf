resource "alicloud_event_bridge_event_bus" "default" {
  event_bus_name = var.name
}

resource "alicloud_event_bridge_event_source" "default" {
  event_source_name = var.name
  event_bus_name    = alicloud_event_bridge_event_bus.default.event_bus_name
}
