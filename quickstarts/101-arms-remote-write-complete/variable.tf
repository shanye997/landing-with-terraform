variable "name" {
  default = "tf-example-ArmsRW32"
}

variable "remote_write_yaml_var" {
  default = "remote_write:\\n- name: ArmsRemoteWrite\\n  url: http://47.96.227.137:8080/prometheus/xxx/yyy/cn-hangzhou/api/v3/write\\n  basic_auth: {username: 888, password: '******'}\\n  write_relabel_configs:\\n  - source_labels: [instance_id]\\n    separator: ;\\n    regex: si-6e2ca86444db4e55a7c1\\n    replacement: $1\\n    action: keep\\n"
}

