data "alicloud_cr_ee_instances" "default" {
  name_regex = "tf-example"
}

resource "alicloud_cr_ee_namespace" "default" {
  instance_id        = data.alicloud_cr_ee_instances.default.ids[0]
  name               = var.name
  auto_create        = false
  default_visibility = "PUBLIC"
}

resource "alicloud_cr_ee_repo" "default" {
  instance_id = alicloud_cr_ee_namespace.default.instance_id
  namespace   = alicloud_cr_ee_namespace.default.name
  name        = var.name
  summary     = "this is summary of my new repo"
  repo_type   = "PUBLIC"
  detail      = "this is a public repo"
}

resource "alicloud_cr_chain" "default" {
  repo_name           = alicloud_cr_ee_repo.default.name
  repo_namespace_name = alicloud_cr_ee_namespace.default.name
  chain_config {
    nodes {
      enable = "true"
      node_config {
        deny_policy {

        }

      }

      node_name = "DOCKER_IMAGE_PUSH"
    }
    nodes {
      node_config {
        deny_policy {

        }

      }

      node_name = "DOCKER_IMAGE_BUILD"
      enable    = "true"
    }
    nodes {
      node_name = "VULNERABILITY_SCANNING"
      enable    = "true"
      node_config {
        deny_policy {
          action      = "BLOCK_DELETE_TAG"
          issue_count = "1"
          issue_level = "MEDIUM"
          logic       = "AND"
        }

      }

    }
    nodes {
      node_config {
        deny_policy {

        }

      }

      node_name = "ACTIVATE_REPLICATION"
      enable    = "true"
    }
    nodes {
      node_name = "TRIGGER"
      enable    = "true"
      node_config {
        deny_policy {

        }

      }

    }
    nodes {
      node_name = "SNAPSHOT"
      enable    = "false"
      node_config {
        deny_policy {

        }

      }

    }
    nodes {
      enable = "false"
      node_config {
        deny_policy {

        }

      }

      node_name = "TRIGGER_SNAPSHOT"
    }

    routers {
      from {
        node_name = "DOCKER_IMAGE_PUSH"
      }

      to {
        node_name = "VULNERABILITY_SCANNING"
      }

    }
    routers {
      from {
        node_name = "DOCKER_IMAGE_BUILD"
      }

      to {
        node_name = "DOCKER_IMAGE_PUSH"
      }

    }
    routers {
      from {
        node_name = "VULNERABILITY_SCANNING"
      }

      to {
        node_name = "ACTIVATE_REPLICATION"
      }

    }
    routers {
      from {
        node_name = "ACTIVATE_REPLICATION"
      }

      to {
        node_name = "TRIGGER"
      }

    }
    routers {
      from {
        node_name = "VULNERABILITY_SCANNING"
      }

      to {
        node_name = "SNAPSHOT"
      }

    }
    routers {
      from {
        node_name = "SNAPSHOT"
      }

      to {
        node_name = "TRIGGER_SNAPSHOT"
      }

    }

  }

  chain_name  = var.chain_name_var
  description = var.description_var
  instance_id = alicloud_cr_ee_namespace.default.instance_id
}
