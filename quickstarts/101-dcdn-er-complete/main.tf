resource "alicloud_dcdn_er" "default" {
  description = var.description_var
  env_conf {
    preset_canary_shanghai {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_shanxi {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_taiwan {
      spec_name = "100ms"
      allowed_hosts = [
        "example.com"
      ]
    }

    preset_canary_yunnan {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_hebei {
      spec_name = "100ms"
      allowed_hosts = [
        "example.com"
      ]
    }

    preset_canary_ningxia {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_shandong {
      spec_name = "100ms"
      allowed_hosts = [
        "example.com"
      ]
    }

    preset_canary_chongqing {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_gansu {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_tianjin {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_anhui {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_heilongjiang {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_neimenggu {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_hubei {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    production {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_guangdong {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_hainan {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_henan {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_liaoning {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_qinghai {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_beijing {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_jiangsu {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_jiangxi {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_guangxi {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_hunan {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_jilin {
      spec_name = "100ms"
      allowed_hosts = [
        "example.com"
      ]
    }

    preset_canary_macau {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_sichuan {
      spec_name = "100ms"
      allowed_hosts = [
        "example.com"
      ]
    }

    preset_canary_xizang {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_overseas {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_shaanxi {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_xinjiang {
      spec_name = "100ms"
      allowed_hosts = [
        "example.com"
      ]
    }

    preset_canary_zhejiang {
      spec_name = "100ms"
      allowed_hosts = [
        "example.com"
      ]
    }

    staging {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_fujian {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_guizhou {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

    preset_canary_hong_kong {
      allowed_hosts = [
        "example.com"
      ]
      spec_name = "100ms"
    }

  }

  er_name = "tf-examplecn-hangzhoudcdn-er65688"
}
