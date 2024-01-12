resource "alicloud_bp_studio_application" "default" {
  application_name  = "example_value"
  template_id       = "example_value"
  resource_group_id = "example_value"
  area_id           = "example_value"
  instances {
    id        = "example_value"
    node_name = "example_value"
    node_type = "ecs"
  }
  configuration = {
    enableMonitor = "1"
  }
  variables = {
    test = "1"
  }
}