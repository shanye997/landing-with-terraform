resource "alicloud_ram_security_preference" "default" {
  login_session_duration           = var.login_session_duration_var
  allow_user_to_change_password    = var.allow_user_to_change_password_var
  allow_user_to_manage_access_keys = var.allow_user_to_manage_access_keys_var
  allow_user_to_manage_mfa_devices = var.allow_user_to_manage_mfa_devices_var
  enable_save_mfa_ticket           = var.enable_save_mfa_ticket_var
  enforce_mfa_for_login            = var.enforce_mfa_for_login_var
  login_network_masks              = var.login_network_masks_var
}
