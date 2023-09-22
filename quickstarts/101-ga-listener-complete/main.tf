locals {
  certificate_id = join("-", [data.alicloud_cas_certificates.default.certificates.0.id, "cn-hangzhou"])
}

data "alicloud_ga_accelerators" "default" {
  status = "active"
}

data "alicloud_cas_certificates" "default" {
}

resource "alicloud_ga_bandwidth_package" "default" {
  bandwidth              = 100
  type                   = "Basic"
  bandwidth_type         = "Basic"
  payment_type           = "PayAsYouGo"
  billing_type           = "PayBy95"
  ratio                  = 30
  bandwidth_package_name = var.name
  auto_pay               = true
  auto_use_coupon        = true
}

resource "alicloud_ga_bandwidth_package_attachment" "default" {
  // Please run resource ga_accelerator test case to ensure this account has at least one accelerator before run this case.
  accelerator_id       = data.alicloud_ga_accelerators.default.ids.0
  bandwidth_package_id = alicloud_ga_bandwidth_package.default.id
}

resource "alicloud_ga_listener" "default" {
  protocol       = var.protocol_var
  proxy_protocol = var.proxy_protocol_var
  name           = var.name
  forwarded_for_config {
    forwarded_for_ga_ap_enabled = "true"
    forwarded_for_ga_id_enabled = "true"
    forwarded_for_port_enabled  = "true"
    forwarded_for_proto_enabled = "true"
    real_ip_enabled             = "true"
  }

  client_affinity    = var.client_affinity_var
  security_policy_id = var.security_policy_id_var
  listener_type      = "CustomRouting"
  certificates {
    id = local.certificate_id
  }

  port_ranges {
    to_port   = "16000"
    from_port = "10000"
  }

  accelerator_id = alicloud_ga_bandwidth_package_attachment.default.accelerator_id
  description    = var.description_var
}
