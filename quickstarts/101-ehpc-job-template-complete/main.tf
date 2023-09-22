resource "alicloud_ehpc_job_template" "default" {
  mem                  = var.mem_var
  task                 = var.task_var
  priority             = var.priority_var
  clock_time           = var.clock_time_var
  job_template_name    = var.job_template_name_var
  re_runable           = var.re_runable_var
  array_request        = var.array_request_var
  thread               = var.thread_var
  queue                = var.queue_var
  gpu                  = var.gpu_var
  node                 = var.node_var
  runas_user           = var.runas_user_var
  command_line         = var.command_line_var
  package_path         = var.package_path_var
  stdout_redirect_path = var.stdout_redirect_path_var
  stderr_redirect_path = var.stderr_redirect_path_var
  variables            = var.variables_var
}
