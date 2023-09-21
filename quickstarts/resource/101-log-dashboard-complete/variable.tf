variable "display_name_var" {
  default = "update_name"
}

variable "attribute_var" {
  default = "{\\\"type\\\":\\\"grid\\\"}"
}

variable "char_list_var" {
  default = "[{\\\"action\\\":{},\\\"title\\\":\\\"upadte_title_3\\\",\\\"type\\\":\\\"map\\\",\\\"search\\\":{\\\"logstore\\\":\\\"new_logstore\\\",\\\"topic\\\":\\\"new_topic\\\",\\\"query\\\":\\\"method:  GET  | select  ip_to_province(remote_addr) as province , count(1) as pv group by province order by pv desc \\\",\\\"start\\\":\\\"-86400s\\\",\\\"end\\\":\\\"\\\"},\\\"display\\\":{\\\"xAxis\\\":[\\\"province\\\"],\\\"yAxis\\\":[\\\"aini\\\"],\\\"xPos\\\":0,\\\"yPos\\\":0,\\\"width\\\":10,\\\"height\\\":12,\\\"displayName\\\":\\\"xixihaha911\\\"}}]"
}

