variable "name" {
  default = "tf-examplecn-hangzhouhbrecsbackupplan14519"
}

variable "ecs_backup_plan_name_var" {
  default = "tf-example-hbr-backup-plan3"
}

variable "retention_var" {
  default = "4"
}

variable "exclude_var" {
  default = "[\\\"/home\\\", \\\"/var/\\\"]"
}

variable "options_var" {
  default = "{\\\"UseVSS\\\":true}"
}

variable "disabled_var" {
  default = "true"
}

variable "schedule_var" {
  default = "I|1602673264|PT2H"
}

variable "include_var" {
  default = "[\\\"/proc\\\"]"
}

variable "speed_limit_var" {
  default = "0:24:1024"
}

