variable "name" {
  default = "tf_exampleKmsSecret_7606862"
}

variable "description_var" {
  default = "tf_exampleKmsSecret_7606862"
}

variable "force_delete_without_recovery_var" {
  default = "true"
}

variable "secret_data_type_var" {
  default = "text"
}

variable "secret_data_var" {
  default = "{\\\"Accounts\\\":[{\\\"AccountName\\\":\\\"$${alicloud_db_account.default.account_name}\\\",\\\"AccountPassword\\\":\\\"$${alicloud_db_account.default.password}\\\"}]}"
}

variable "version_id_var" {
  default = "00001"
}

