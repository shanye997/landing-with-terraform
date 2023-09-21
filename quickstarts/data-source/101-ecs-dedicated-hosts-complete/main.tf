resource "alicloud_ecs_dedicated_host" "default" {
  dedicated_host_type   = "ddh.g6"
  description           = "From_Terraform"
  dedicated_host_name   = "tf_exampleEcsDedicatedHostsDataSource_1039968"
  action_on_maintenance = "Migrate"
  tags = {
    Create = "TF"
    For    = "ddh-test",
  }
}

data "alicloud_ecs_dedicated_hosts" "default" {
  name_regex = "tf_exampleEcsDedicatedHostsDataSource_1039968fake"
  ids = [
    alicloud_ecs_dedicated_host.default.id
  ]
  status              = "Available"
  dedicated_host_type = "ddh.g6"
  tags = {
    Create = "TF"
    For    = "ddh-test"
  }
}
