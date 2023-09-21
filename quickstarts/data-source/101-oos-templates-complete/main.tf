resource "alicloud_oos_template" "default" {
  content       = <<EOF
		  {
			"FormatVersion": "OOS-2019-06-01",
			"Description": "Update Describe instances of given status",
			"Parameters":{
			  "Status":{
				"Type": "String",
				"Description": "(Required) The status of the Ecs instance."
			  }
			},
			"Tasks": [
			  {
				"Properties" :{
				  "Parameters":{
					"Status": "{{ Status }}"
				  },
				  "API": "DescribeInstances",
				  "Service": "Ecs"
				},
				"Name": "foo",
				"Action": "ACS::ExecuteApi"
			  }]
		  }
		  EOF
  template_name = "tf-exampleOosTemplate-2620866"
  version_name  = "test"
  tags = {
    "Created" = "TF",
    "For"     = "template Test"
  }
}

data "alicloud_oos_templates" "default" {
  tags = {
    Created = "TF"
    For     = "template Test"
  }
  has_trigger = "false"
  name_regex  = "${alicloud_oos_template.default.template_name}-fake"
  ids = [
    alicloud_oos_template.default.template_name
  ]
  share_type = "Private"
}
