provider "alicloud" {
  assume_role {}
}

resource "alicloud_log_project" "default" {
  name        = "tf-examplecn-hangzhoulogproject-3113"
  description = var.description_var
  policy      = var.policy_var
  tags = {
    Key2-update = "Value2"
    key1-update = "value1"
    key3-new    = "value3-new"
  }
}
