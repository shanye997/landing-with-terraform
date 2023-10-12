resource "alicloud_oss_bucket" "target" {
  bucket = "tf-example-bucket-4605001-t"
}

resource "alicloud_oss_bucket" "default" {
  bucket = "tf-example-bucket-4605001"
  lifecycle_rule {
    id      = "rule1"
    prefix  = "path1/"
    enabled = "true"
    expiration {
      days = "365"
    }

  }
  lifecycle_rule {
    prefix  = "path2/"
    enabled = "true"
    expiration {
      date = "2018-01-12"
    }

    id = "rule2"
  }
  lifecycle_rule {
    transitions {
      days          = "3"
      storage_class = "IA"
    }
    transitions {
      days          = "30"
      storage_class = "Archive"
    }

    enabled = "true"
    id      = "rule3"
    prefix  = "path3/"
  }
  lifecycle_rule {
    enabled = "true"
    id      = "rule4"
    prefix  = "path4/"
    transitions {
      created_before_date = "2023-11-11"
      storage_class       = "IA"
    }
    transitions {
      created_before_date = "2023-11-10"
      storage_class       = "Archive"
    }

  }
  lifecycle_rule {
    expiration {
      created_before_date = "2018-01-12"
    }

    id     = "rule5"
    prefix = "path5/"
    abort_multipart_upload {
      created_before_date = "2018-01-22"
    }

    enabled = "true"
  }
  lifecycle_rule {
    abort_multipart_upload {
      days = "10"
    }

    enabled = "true"
    id      = "rule6"
    prefix  = "path6/"
  }

  acl = var.acl_var
  tags = {
    Key2-update = "Value2"
    key1-update = "value1"
    key3-new    = "value3-new"
  }
  website {
    error_document = "error.html"
    index_document = "index.html"
  }

  cors_rule {
    allowed_headers = [
      "authorization"
    ]
    allowed_methods = [
      "PUT",
      "GET"
    ]
    allowed_origins = [
      "*"
    ]
  }
  cors_rule {
    max_age_seconds = "100"
    allowed_headers = [
      "authorization"
    ]
    allowed_methods = [
      "GET"
    ]
    allowed_origins = [
      "http://www.a.com",
      "http://www.b.com"
    ]
    expose_headers = [
      "x-oss-test",
      "x-oss-test1"
    ]
  }

  logging {
    target_prefix = "log/"
    target_bucket = alicloud_oss_bucket.target.id
  }

  referer_config {
    allow_empty = "false"
    referers = [
      "http://www.aliyun.com",
      "https://www.aliyun.com"
    ]
  }

  policy = var.policy_var
}
