resource "alicloud_ram_user" "this" {
  name = "${var.name}"
}

resource "alicloud_resource_manager_policy" "this" {
  policy_name     = "${var.name}"
  description     = "policy_attachment"
  policy_document = <<EOF
        {
            "Statement": [{
                "Action": ["oss:*"],
                "Effect": "Allow",
                "Resource": ["acs:oss:*:*:*"]
            }],
            "Version": "1"
        }
    EOF
}

data "alicloud_account" "this" {}

data "alicloud_resource_manager_resource_groups" "this" {
  name_regex = "default"
}

locals {
  principal_name = format("%s@%s.onaliyun.com", alicloud_ram_user.this.name, data.alicloud_account.this.id)
}

resource "alicloud_resource_manager_policy_attachment" "default" {
  principal_type    = "IMSUser"
  resource_group_id = data.alicloud_resource_manager_resource_groups.this.groups.0.id
  policy_name       = alicloud_resource_manager_policy.this.policy_name
  policy_type       = "Custom"
  principal_name    = local.principal_name
}
