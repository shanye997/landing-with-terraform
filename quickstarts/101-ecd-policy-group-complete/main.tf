resource "alicloud_ecd_policy_group" "default" {
  authorize_access_policy_rules {
    cidr_ip     = "1.2.4.1/24"
    description = "Terraform-Description1"
  }
  authorize_access_policy_rules {
    cidr_ip     = "1.2.4.2/24"
    description = "Terraform-Description2"
  }

  local_drive          = var.local_drive_var
  domain_list          = var.domain_list_var
  clipboard            = var.clipboard_var
  recording            = var.recording_var
  camera_redirect      = var.camera_redirect_var
  policy_group_name    = var.policy_group_name_var
  visual_quality       = var.visual_quality_var
  watermark_type       = var.watermark_type_var
  recording_start_time = var.recording_start_time_var
  recording_fps        = var.recording_fps_var
  watermark            = var.watermark_var
  recording_expires    = var.recording_expires_var
  authorize_security_policy_rules {
    description = "Terraform-Description"
    ip_protocol = "TCP"
    policy      = "accept"
    port_range  = "43/43"
    priority    = "1"
    type        = "inflow"
    cidr_ip     = "0.0.0.0/3"
  }
  authorize_security_policy_rules {
    type        = "inflow"
    cidr_ip     = "0.0.0.0/4"
    description = "Terraform-Description"
    ip_protocol = "TCP"
    policy      = "accept"
    port_range  = "43/43"
    priority    = "1"
  }

  usb_redirect           = var.usb_redirect_var
  watermark_transparency = var.watermark_transparency_var
  recording_end_time     = var.recording_end_time_var
}
