resource "alicloud_fnf_flow" "default" {
  definition  = "version: v1beta1\ntype: flow\nsteps:\n  - type: pass\n    name: helloworld"
  description = "tf-exampleFnFFlow983041"
  name        = var.name
  type        = "FDL"
}

resource "alicloud_fnf_schedule" "default" {
  schedule_name   = var.name
  cron_expression = var.cron_expression_var
  description     = var.description_var
  enable          = var.enable_var
  flow_name       = alicloud_fnf_flow.default.name
  payload         = var.payload_var
}
