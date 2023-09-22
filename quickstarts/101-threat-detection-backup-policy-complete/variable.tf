variable "backup_policy_name_var" {
  default = "tf-exampleThreatDetectionBackupPolicy-name56074"
}

variable "policy_var" {
  default = "{\\\"Exclude\\\":[\\\"/bin/\\\",\\\"/usr/bin/\\\",\\\"/sbin/\\\",\\\"/boot/\\\",\\\"/proc/\\\",\\\"/sys/\\\",\\\"/srv/\\\",\\\"/lib/\\\",\\\"/selinux/\\\",\\\"/usr/sbin/\\\",\\\"/run/\\\",\\\"/lib32/\\\",\\\"/lib64/\\\",\\\"/lost+found/\\\",\\\"/var/lib/kubelet/\\\",\\\"/var/lib/ntp/proc\\\",\\\"/var/lib/container\\\"],\\\"ExcludeSystemPath\\\":true,\\\"Include\\\":[],\\\"IsDefault\\\":1,\\\"Retention\\\":6,\\\"Schedule\\\":\\\"I|1668703620|PT24H\\\",\\\"Source\\\":[],\\\"SpeedLimiter\\\":\\\"\\\",\\\"UseVss\\\":true}"
}

