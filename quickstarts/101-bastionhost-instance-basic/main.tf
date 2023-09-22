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
  ldap_auth_server {
    filter             = "objectClass=person"
    is_ssl             = "true"
    login_name_mapping = "uid"
    mobile_mapping     = "mobileAttr"
    password           = "YouPassword123"
    server             = "192.168.1.1"
    account            = "cn=Manager,dc=test,dc=com"
    email_mapping      = "emailAttr"
    standby_server     = "192.168.1.3"
    port               = "80"
    base_dn            = "dc=test,dc=com"
    name_mapping       = "nameAttr"
  }

  security_group_ids = [
    alicloud_security_group.default.0.id
  ]
  storage     = "5"
  description = var.name
  plan_code   = "cloudbastion"
  ad_auth_server {
    base_dn        = "dc=test,dc=com"
    email_mapping  = "emailAttr"
    is_ssl         = "true"
    name_mapping   = "nameAttr"
    password       = "YouPassword123"
    port           = "80"
    server         = "192.168.1.1"
    account        = "cn=Manager,dc=test,dc=com"
    standby_server = "192.168.1.3"
    filter         = "objectClass=person"
    mobile_mapping = "mobileAttr"
    domain         = "domain"
  }

  vswitch_id   = local.vswitch_id
  license_code = var.license_code_var
  bandwidth    = "5"
}
