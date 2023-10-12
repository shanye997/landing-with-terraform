resource "alicloud_ehpc_job_template" "default" {
  job_template_name = var.job_template_name_var
  command_line      = var.command_line_var
}
