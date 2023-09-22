variable "name" {
  default = "tftest"
}

variable "token" {
  default = ""
}

variable "server_url_var" {
  default = "https://oapi.dingtalk.com/robot/send?access_token=$${var.token}"
}

