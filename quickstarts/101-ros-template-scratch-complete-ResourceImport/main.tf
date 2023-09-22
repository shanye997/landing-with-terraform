data "alicloud_resource_manager_resource_groups" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

locals {
  vswitch_id = data.alicloud_vswitches.default.ids.0
}

resource "alicloud_ros_template_scratch" "default" {
  source_resources {
    resource_id   = local.vswitch_id
    resource_type = "ALIYUN::ECS::VSwitch"
  }

  template_scratch_type = "ResourceImport"
  source_tag {
    resource_tags = {

    }
    resource_type_filter = [
      "ALIYUN::ECS::VSwitch"
    ]
  }

  logical_id_strategy = var.logical_id_strategy_var
  execution_mode      = var.execution_mode_var
  description         = "${var.name}"
  preference_parameters {
    parameter_value = "Delete"
    parameter_key   = "DeletionPolicy"
  }

  source_resource_group {
    resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.0
    resource_type_filter = [
      "ALIYUN::ECS::SecurityGroup"
    ]
  }

}
