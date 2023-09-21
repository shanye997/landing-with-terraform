resource "alicloud_oss_bucket" "target" {
  bucket = "${var.name}-target"
}

resource "alicloud_oss_bucket" "default" {
  bucket = "${var.name}-default"
  acl    = "public-read"

  cors_rule {
    allowed_origins = ["*"]
    allowed_methods = ["PUT", "GET"]
    allowed_headers = ["authorization"]
  }
  cors_rule {
    allowed_origins = ["http://www.a.com"]
    allowed_methods = ["GET"]
    allowed_headers = ["authorization"]
    expose_headers  = ["x-oss-test"]
    max_age_seconds = 100
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  logging {
    target_bucket = "${alicloud_oss_bucket.target.id}"
    target_prefix = "log/"
  }

  referer_config {
    allow_empty = false
    referers    = ["http://www.aliyun.com"]
  }

  lifecycle_rule {
    id      = "rule1"
    prefix  = "path1/"
    enabled = true
    expiration {
      days = 365
    }
  }
  lifecycle_rule {
    id      = "rule2"
    prefix  = "path2/"
    enabled = true
    expiration {
      date = "2018-01-12"
    }
  }
  policy = "{\"Statement\":[{\"Action\":[\"oss:*\"],\"Effect\":\"Allow\",\"Resource\":[\"acs:oss:*:*:*\"]}],\"Version\":\"1\"}"
  tags = {
    key1 = "value1",
    key2 = "value2",
  }
}

data "alicloud_oss_buckets" "default" {
  name_regex = "${alicloud_oss_bucket.default.bucket}-fake"
}
