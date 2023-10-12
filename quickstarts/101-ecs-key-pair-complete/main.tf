data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_ecs_key_pair" "default" {
  key_name_prefix = "tf-exampleAlicloudEcsKeyPair55286"
  tags = {
    Created = "Terraform"
    For     = "Test"
  }
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.0
  count             = "10"
  public_key        = var.public_key_var
}
