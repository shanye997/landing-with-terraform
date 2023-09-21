resource "alicloud_brain_industrial_pid_organization" "default" {
  pid_organization_name = "tf-example35912"
}

resource "alicloud_brain_industrial_pid_project" "default" {
  pid_organization_id = alicloud_brain_industrial_pid_organization.default.id
  pid_project_name    = "tf-example35912"
}

resource "alicloud_brain_industrial_pid_loop" "default" {
  pid_loop_dcs_type      = "standard"
  pid_loop_desc          = "Test For Terraform"
  pid_loop_is_crucial    = false
  pid_loop_name          = "tf-example35912"
  pid_loop_type          = "0"
  pid_project_id         = alicloud_brain_industrial_pid_project.default.id
  pid_loop_configuration = "{\"baseParam\":{\"forwardController\":false,\"integral\":false,\"kd\":{\"tagValue\":\"20\"},\"kp\":{},\"op\":\"PIDBenchmark.FOPDT_OP\",\"opParam\":{\"increment\":{\"max\":10},\"operate\":{\"max\":115,\"min\":-15},\"range\":{\"max\":115,\"min\":-15},\"trend\":0},\"openLoopTime\":150,\"pv\":\"PIDBenchmark.FOPDT_PV\",\"pvRange\":{\"max\":100,\"min\":0},\"sampleTime\":5,\"sp\":\"PIDBenchmark.FOPDT_SP\",\"spOperate\":{\"max\":100,\"min\":0},\"splitRangeControl\":false,\"suitCtrlTime\":100,\"td\":{},\"ti\":{}},\"identParam\":{\"delay\":10,\"modelType\":3},\"resetParam\":{\"ctrlMode\":0,\"ctrlStuc\":1}}"
}

data "alicloud_brain_industrial_pid_loops" "default" {
  ids = [
    alicloud_brain_industrial_pid_loop.default.id
  ]
  status         = "0"
  name_regex     = "${alicloud_brain_industrial_pid_loop.default.pid_loop_name}-fake"
  pid_project_id = alicloud_brain_industrial_pid_project.default.id
}
