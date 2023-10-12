variable "display_name_var" {
  default = "test_display"
}

variable "run_immediately_var" {
  default = "false"
}

variable "interval_var" {
  default = "5m"
}

variable "source_var" {
  default = "{\\\"bucket\\\":\\\"bucket_name\\\",\\\"compressionCodec\\\":\\\"none\\\",\\\"encoding\\\":\\\"UTF-8\\\",\\\"endpoint\\\":\\\"oss-cn-hangzhou-internal.aliyuncs.com\\\",\\\"format\\\":{\\\"escapeChar\\\":\\\"\\\\\\\\\\\",\\\"fieldDelimiter\\\":\\\",\\\",\\\"fieldNames\\\":[],\\\"firstRowAsHeader\\\":true,\\\"maxLines\\\":1,\\\"quoteChar\\\":\\\"\\\\\\\"\\\",\\\"skipLeadingRows\\\":0,\\\"timeField\\\":\\\"\\\",\\\"type\\\":\\\"DelimitedText\\\"},\\\"pattern\\\":\\\"\\\",\\\"prefix\\\":\\\"test_prefix/\\\",\\\"restoreObjectEnabled\\\":false,\\\"roleARN\\\":\\\"acs:ram::1049446484210612:role/aliyunlogimportossrole\\\",\\\"type\\\":\\\"AliyunOSS\\\"}"
}

