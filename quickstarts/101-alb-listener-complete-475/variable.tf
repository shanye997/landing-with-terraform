variable "name" {
  default = "tf-examplealblistener475"
}

variable "security_policy_id_var" {
  default = "tls_cipher_policy_1_0"
}

variable "dry_run_var" {
  default = "false"
}

variable "http2_enabled_var" {
  default = "true"
}

variable "gzip_enabled_var" {
  default = "true"
}

variable "listener_description_var" {
  default = "tf-exampleListener_new"
}

variable "request_timeout_var" {
  default = "60"
}

variable "idle_timeout_var" {
  default = "20"
}

