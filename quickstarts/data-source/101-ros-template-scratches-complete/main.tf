data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_ros_template_scratch" "default" {
  description           = var.name
  template_scratch_type = "ResourceImport"
  preference_parameters {
    parameter_key   = "DeletionPolicy"
    parameter_value = "Retain"
  }
  source_resource_group {
    resource_group_id    = data.alicloud_resource_manager_resource_groups.default.ids.0
    resource_type_filter = ["ALIYUN::ECS::VPC"]
  }
}

data "alicloud_ros_template_scratches" "default" {
  template_scratch_type = "ArchitectureReplication"
  enable_details        = var.enable_details_var
  ids = [
    alicloud_ros_template_scratch.default.id
  ]
  status = "GENERATE_FAILED"
}
