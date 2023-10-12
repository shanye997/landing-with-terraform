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
  timed                 = "true"
  username              = "root"
  windows_password_name = "axtSecretPassword"
  command_id            = alicloud_ecs_command.default.id
  frequency             = "0 15 10 ? * *"
  instance_id = [
    data.alicloud_instances.default.ids.0
  ]
  parameters = {

  }
  repeat_mode = "Period"
}
