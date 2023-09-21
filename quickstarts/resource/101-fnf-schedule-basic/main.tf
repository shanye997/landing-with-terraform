resource "alicloud_fnf_flow" "default" {
  definition  = "version: v1beta1\ntype: flow\nsteps:\n  - type: pass\n    name: helloworld"
  description = "tf-exampleFnFFlow983041"
  name        = var.name
  type        = "FDL"
}

resource "alicloud_fnf_schedule" "default" {
  flow_name       = alicloud_fnf_flow.default.name
  schedule_name   = var.name
  cron_expression = var.cron_expression_var
}
