data "alicloud_service_mesh_versions" "default" {
  edition = "Default"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_log_project" "default_1" {
  name        = "${var.name}-01"
  description = "created by terraform"
}

resource "alicloud_log_project" "default_2" {
  name        = "${var.name}-02"
  description = "created by terraform"
}

locals {
  vswitch_id    = data.alicloud_vswitches.default.ids.0
  vpc_id        = data.alicloud_vpcs.default.ids.0
  log_project_1 = alicloud_log_project.default_1.name
}

resource "alicloud_service_mesh_service_mesh" "default" {
  service_mesh_name = var.name
  version           = data.alicloud_service_mesh_versions.default.versions.0.version
  edition           = "Default"
  load_balancer {
    api_server_public_eip = "false"
    pilot_public_eip      = "false"
  }

  mesh_config {
    pilot {
      http10_enabled = "true"
      trace_sampling = "100"
    }

    tracing = "true"
    access_log {
      enabled = "true"
    }

    audit {
      enabled = "true"
      project = local.log_project_1
    }

    opa {
      log_level      = "info"
      request_cpu    = "1"
      request_memory = "512Mi"
      enabled        = "true"
      limit_cpu      = "2"
      limit_memory   = "1024Mi"
    }

    outbound_traffic_policy = "ALLOW_ANY"
    proxy {
      limit_cpu      = "2000m"
      limit_memory   = "1024Mi"
      request_cpu    = "100m"
      request_memory = "128Mi"
    }

    sidecar_injector {
      auto_injection_policy_enabled = "true"
      enable_namespaces_by_default  = "false"
      limit_cpu                     = "2000m"
      limit_memory                  = "1024Mi"
      request_cpu                   = "100m"
      request_memory                = "128Mi"
    }

    telemetry          = "true"
    customized_zipkin  = "false"
    enable_locality_lb = "false"
    kiali {
      enabled = "true"
    }

  }

  network {
    vpc_id = local.vpc_id
    vswitche_list = [
      local.vswitch_id
    ]
  }

}
