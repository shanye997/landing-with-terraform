resource "alicloud_ram_role" "default" {
  name        = "${var.name}"
  document    = <<DEFINITION
  
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "fc.aliyuncs.com"
        ]
      }
    }
  ],
  "Version": "1"
}

  DEFINITION
  description = "this is a test"
  force       = true
}

resource "alicloud_ram_role_policy_attachment" "default" {
  role_name   = "${alicloud_ram_role.default.name}"
  policy_name = "AliyunLogFullAccess"
  policy_type = "System"
}

resource "alicloud_fc_service" "default" {
  count = "10"
  depends_on = [
    alicloud_ram_role_policy_attachment.default
  ]
  name = "${var.name}_${count.index}"
  role = alicloud_ram_role.default.arn
}
