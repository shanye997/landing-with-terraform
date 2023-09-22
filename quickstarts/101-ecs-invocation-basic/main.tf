data "alicloud_instances" "default" {
  status = "Running"
}

resource "alicloud_ecs_command" "default" {
  name             = var.name
  command_content  = "ZWNobyBoZWxsbyx7e25hbWV9fQ=="
  description      = "For Terraform Test"
  type             = "RunShellScript"
  working_dir      = "/root"
  enable_parameter = true
}

resource "alicloud_ecs_invocation" "default" {
  command_id = alicloud_ecs_command.default.id
  instance_id = [
    data.alicloud_instances.default.ids.0
  ]
}
