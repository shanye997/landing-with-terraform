resource "alicloud_event_bridge_event_bus" "default" {
  description    = var.description_var
  event_bus_name = var.name
}
