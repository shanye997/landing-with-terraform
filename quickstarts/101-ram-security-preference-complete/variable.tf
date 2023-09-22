variable "allow_user_to_change_password_var" {
  default = "true"
}

variable "allow_user_to_manage_access_keys_var" {
  default = "true"
}

variable "allow_user_to_manage_mfa_devices_var" {
  default = "true"
}

variable "enable_save_mfa_ticket_var" {
  default = "true"
}

variable "enforce_mfa_for_login_var" {
  default = "false"
}

variable "login_network_masks_var" {
  default = ""
}

variable "login_session_duration_var" {
  default = "7"
}

