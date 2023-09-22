resource "alicloud_ecs_command" "default" {
  timeout         = "60"
  command_content = "bHMK"
  description     = "For Terraform Test"
  name            = "tf-examplecn-hangzhouAlicloudEcsCommand63569"
  type            = "RunShellScript"
  working_dir     = "/root"
}
