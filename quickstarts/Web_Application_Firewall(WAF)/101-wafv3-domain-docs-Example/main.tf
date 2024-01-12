data "alicloud_wafv3_instances" "default" {}

resource "alicloud_ssl_certificates_service_certificate" "default" {
  certificate_name = "example-value"
  cert             = file("${path.module}/test.crt")
  key              = file("${path.module}/test.key")
}

locals {
  certificate_id = join("-", [alicloud_ssl_certificates_service_certificate.default.id, "cn-hangzhou"])
}

resource "alicloud_wafv3_domain" "default" {
  instance_id = data.alicloud_wafv3_instances.default.ids.0
  listen {
    https_ports         = [443]
    http_ports          = [80]
    cert_id             = local.certificate_id
    cipher_suite        = 99
    xff_header_mode     = 2
    protection_resource = "share"
    tls_version         = "tlsv1"
    enable_tlsv3        = true
    http2_enabled       = true
    custom_ciphers      = ["ECDHE-ECDSA-AES128-GCM-SHA256"]
    focus_https         = false
    ipv6_enabled        = false
    exclusive_ip        = false
    xff_headers         = ["A", "B"]
  }
  redirect {
    backends           = ["1.1.1.1"]
    loadbalance        = "iphash"
    sni_enabled        = true
    sni_host           = "www.aliyun.com"
    focus_http_backend = false
    keepalive          = true
    retry              = true
    keepalive_requests = 80
    keepalive_timeout  = 30
    connect_timeout    = 30
    read_timeout       = 30
    write_timeout      = 30
    request_headers {
      key   = "A"
      value = "B"
    }
  }
  domain      = var.name
  access_type = "share"
}