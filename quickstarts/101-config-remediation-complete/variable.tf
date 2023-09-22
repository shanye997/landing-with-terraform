variable "invoke_type_var" {
  default = "MANUAL_EXECUTION"
}

variable "params_var" {
  default = "{\\\"regionId\\\":\\\"{regionId}\\\",\\\"tags\\\":\\\"{\\\\\\\"terraform\\\\\\\":\\\\\\\"terraform\\\\\\\"}\\\",\\\"resourceType\\\":\\\"{resourceType}\\\",\\\"resourceIds\\\":\\\"{resourceId}\\\"}"
}

variable "remediation_template_id_var" {
  default = "ACS-TAG-TagResources"
}

