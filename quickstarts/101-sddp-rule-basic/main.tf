resource "alicloud_sddp_rule" "default" {
  content   = "tf-example-all"
  category  = "0"
  rule_name = "${var.name}-all"
}
