data "alicloud_db_zones" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_charge_type     = "PostPaid"
  category                 = "Basic"
  db_instance_storage_type = "cloud_essd"
}

data "alicloud_db_instance_classes" "default" {
  zone_id                  = data.alicloud_db_zones.default.zones.0.id
  engine                   = "MySQL"
  engine_version           = "8.0"
  category                 = "Basic"
  db_instance_storage_type = "cloud_essd"
  instance_charge_type     = "PostPaid"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_db_zones.default.zones.0.id
}

resource "alicloud_vswitch" "this" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = var.name
  vpc_id       = data.alicloud_vpcs.default.ids.0
  zone_id      = data.alicloud_db_zones.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 8, 4)
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids.0 : concat(alicloud_vswitch.this.*.id, [""])[0]
  zone_id    = data.alicloud_db_zones.default.ids.0
}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_kms_key" "default" {
  description            = var.name
  pending_window_in_days = 7
  status                 = "Enabled"
}

resource "alicloud_ram_policy" "default" {
  policy_name     = "${var.name}"
  policy_document = <<EOF
	{
	  "Statement": [
		{
          "Action": [
              "kms:List*",
              "kms:DescribeKey",
              "kms:TagResource",
              "kms:UntagResource"
          ],
          "Resource": [
              "acs:kms:*:*:*"
          ],
          "Effect": "Allow"
      	},
      	{
          "Action": [
              "kms:Encrypt",
              "kms:Decrypt",
              "kms:GenerateDataKey"
          ],
          "Resource": [
              "acs:kms:*:*:*"
          ],
          "Effect": "Allow",
          "Condition": {
              "StringEqualsIgnoreCase": {
                  "kms:tag/acs:rds:instance-encryption": "true"
              }
          }
      	}
	  ],
		"Version": "1"
	}
  EOF
  description     = "this is a policy test"
  force           = true
}

resource "alicloud_ram_role" "default" {
  name        = "${var.name}"
  document    = <<EOF
	{
	  "Statement": [
		{
		  "Action": "sts:AssumeRole",
		  "Effect": "Allow",
		  "Principal": {
			"Service": [
			  "rds.aliyuncs.com"
			]
		  }
		}
	  ],
	  "Version": "1"
	}
  EOF
  description = "this is a test"
  force       = true
}

resource "alicloud_ram_role_policy_attachment" "default" {
  policy_name = "${alicloud_ram_policy.default.policy_name}"
  role_name   = "${alicloud_ram_role.default.name}"
  policy_type = "${alicloud_ram_policy.default.type}"
}

data "alicloud_ram_roles" "default" {
  name_regex = "${alicloud_ram_role_policy_attachment.default.policy_name}"
}

resource "alicloud_db_instance" "default" {
  security_group_ids = [

  ]
  instance_charge_type = var.instance_charge_type_var
  instance_type        = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  engine_version       = var.engine_version_var
  security_ip_type     = var.security_ip_type_var
  maintain_time        = var.maintain_time_var
  pg_hba_conf {
    address     = "0.0.0.0/0"
    database    = "all"
    method      = "md5"
    priority_id = "0"
    type        = "host"
    user        = "all"
  }

  whitelist_network_type         = var.whitelist_network_type_var
  security_ip_mode               = var.security_ip_mode_var
  manual_ha_time                 = var.manual_ha_time_var
  db_time_zone                   = var.db_time_zone_var
  auto_upgrade_minor_version     = var.auto_upgrade_minor_version_var
  role_arn                       = data.alicloud_ram_roles.default.roles.0.arn
  storage_upper_bound            = var.storage_upper_bound_var
  resource_group_id              = data.alicloud_resource_manager_resource_groups.default.ids.0
  client_ca_enabled              = var.client_ca_enabled_var
  port                           = var.port_var
  effective_time                 = var.effective_time_var
  instance_name                  = var.name
  db_instance_ip_array_attribute = var.db_instance_ip_array_attribute_var
  storage_auto_scale             = var.storage_auto_scale_var
  monitoring_period              = var.monitoring_period_var
  ca_type                        = var.ca_type_var
  client_crl_enabled             = var.client_crl_enabled_var
  tags = {
    For     = "acceptance Test"
    Created = "TF"
  }
  ssl_action           = var.ssl_action_var
  acl                  = var.acl_var
  tcp_connection_type  = var.tcp_connection_type_var
  target_minor_version = var.target_minor_version_var
  deletion_protection  = var.deletion_protection_var
  parameters {
    name  = "delayed_insert_timeout"
    value = "70"
  }

  zone_id_slave_b           = local.zone_id
  connection_string_prefix  = var.connection_string_prefix_var
  upgrade_time              = var.upgrade_time_var
  direction                 = var.direction_var
  db_is_ignore_case         = var.db_is_ignore_case_var
  zone_id                   = data.alicloud_db_instance_classes.default.instance_classes.0.zone_ids.0.id
  period                    = var.period_var
  category                  = var.category_var
  replication_acl           = var.replication_acl_var
  storage_threshold         = var.storage_threshold_var
  instance_storage          = var.instance_storage_var
  db_instance_ip_array_name = var.db_instance_ip_array_name_var
  serverless_config {
    max_capacity = "6"
    min_capacity = "2"
  }

  ha_config      = var.ha_config_var
  tde_status     = var.tde_status_var
  client_ca_cert = var.client_ca_cert_var
  engine         = "PostgreSQL"
  babelfish_config {
    master_username      = "test01"
    migration_mode       = "single-db"
    babelfish_enabled    = "true"
    master_user_password = "test_123456"
  }

  security_ips = [
    "10.168.1.12",
    "100.69.7.112"
  ]
  encryption_key              = alicloud_kms_key.default.id
  db_instance_storage_type    = var.db_instance_storage_type_var
  zone_id_slave_a             = local.zone_id
  vswitch_id                  = local.vswitch_id
  client_cert_revocation_list = var.client_cert_revocation_list_var
}
