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
  preference_parameters {
    parameter_key   = "DeletionPolicy"
    parameter_value = "Retain"
  }

  source_resources {
    resource_id   = data.alicloud_vpcs.default.ids.0
    resource_type = "ALIYUN::ECS::VPC"
  }
  source_resources {
    resource_id   = local.vswitch_id
    resource_type = "ALIYUN::ECS::VSwitch"
  }

  template_scratch_type = "ArchitectureReplication"
  description           = var.name
  execution_mode        = var.execution_mode_var
  logical_id_strategy   = var.logical_id_strategy_var
}
