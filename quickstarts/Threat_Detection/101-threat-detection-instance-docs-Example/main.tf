provider "alicloud" {
  region = "cn-hangzhou"
}

variable "name" {
  default = "terraform-example"
}

resource "alicloud_threat_detection_instance" "default" {
  threat_analysis          = "10"
  sas_sls_storage          = "10"
  v_core                   = "10"
  sas_sc                   = "false"
  buy_number               = "10"
  honeypot_switch          = "2"
  payment_type             = "Subscription"
  sas_sdk                  = "10"
  sas_anti_ransomware      = "10"
  renewal_status           = "ManualRenewal"
  period                   = "1"
  vul_switch               = "1"
  rasp_count               = "1"
  vul_count                = "20"
  version_code             = "level3"
  sas_cspm                 = "1000"
  renewal_period_unit      = "M"
  container_image_scan_new = "100"
  honeypot                 = "20"
}