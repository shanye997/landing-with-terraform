variable "gpu_var" {
  default = "3"
}

variable "job_template_name_var" {
  default = "JobTemplateNameY"
}

variable "command_line_var" {
  default = "./LammpsTestT/lammps.pbs"
}

variable "priority_var" {
  default = "2"
}

variable "clock_time_var" {
  default = "14:00:00"
}

variable "re_runable_var" {
  default = "true"
}

variable "thread_var" {
  default = "3"
}

variable "queue_var" {
  default = "workq"
}

variable "stdout_redirect_path_var" {
  default = "./LammpsTestH"
}

variable "task_var" {
  default = "4"
}

variable "array_request_var" {
  default = "1-12:2"
}

variable "package_path_var" {
  default = "./jobfolderT"
}

variable "stderr_redirect_path_var" {
  default = "./LammpsTestT"
}

variable "mem_var" {
  default = "3GB"
}

variable "variables_var" {
  default = "[{Demo:,Test:},{Test:,Demo:}]"
}

variable "node_var" {
  default = "4"
}

variable "runas_user_var" {
  default = "user3"
}

