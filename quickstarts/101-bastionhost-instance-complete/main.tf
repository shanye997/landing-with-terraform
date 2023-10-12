data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

locals {
  vswitch_id = data.alicloud_vswitches.default.ids[0]
}

resource "alicloud_security_group" "default" {
  count  = 2
  name   = "${var.name}"
  vpc_id = data.alicloud_vpcs.default.ids.0
}

provider "alicloud" {
  endpoints {
    bssopenapi = "business.aliyuncs.com"
  }
}

resource "alicloud_bastionhost_instance" "default" {
  description = var.name
  ad_auth_server {
    domain         = "domain"
    filter         = "objectClass=person"
    mobile_mapping = "mobileAttr"
    password       = "YouPassword123"
    port           = "80"
    server         = "192.168.1.1"
    account        = "cn=Manager,dc=test,dc=com"
    base_dn        = "dc=test,dc=com"
    email_mapping  = "emailAttr"
    is_ssl         = "true"
    name_mapping   = "nameAttr"
    standby_server = "192.168.1.3"
  }

  license_code      = var.license_code_var
  renew_period      = var.renew_period_var
  storage           = "5"
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.0
  security_group_ids = [
    alicloud_security_group.default.0.id
  ]
  vswitch_id = local.vswitch_id
  tags = {
    Updated = "TF"
    Created = "TF"
    For     = "acceptance test"
  }
  renewal_period_unit = var.renewal_period_unit_var
  ldap_auth_server {
    base_dn            = "dc=test,dc=com"
    name_mapping       = "nameAttr"
    port               = "80"
    account            = "cn=Manager,dc=test,dc=com"
    email_mapping      = "emailAttr"
    filter             = "objectClass=person"
    is_ssl             = "true"
    login_name_mapping = "uid"
    mobile_mapping     = "mobileAttr"
    password           = "YouPassword123"
    server             = "192.168.1.1"
    standby_server     = "192.168.1.3"
  }

  enable_public_access = var.enable_public_access_var
  period               = var.period_var
  public_white_list = [
    "192.168.0.0/18"
  ]
  bandwidth      = "5"
  plan_code      = "cloudbastion"
  renewal_status = var.renewal_status_var
}
