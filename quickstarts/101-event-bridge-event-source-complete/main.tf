resource "alicloud_event_bridge_event_bus" "default" {
  event_bus_name = var.name
}

resource "alicloud_event_bridge_event_source" "default" {
  external_source_config = {

  }
  external_source_type   = var.external_source_type_var
  linked_external_source = var.linked_external_source_var
  description            = var.description_var
  event_bus_name         = alicloud_event_bridge_event_bus.default.event_bus_name
  event_source_name      = var.name
}
