resource "alicloud_ecs_command" "default" {
  name            = "tf-exampleEcsCommandsTest77340"
  command_content = "bHMK"
  description     = "For Terraform Test"
  type            = "RunShellScript"
  working_dir     = "/root"
}

data "alicloud_ecs_commands" "default" {
  ids = [
    "${alicloud_ecs_command.default.id}-fake"
  ]
  name_regex = "tf-exampleEcsCommandsTest77340"
}
