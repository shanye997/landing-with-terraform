resource "alicloud_oos_template" "default" {
  content       = <<EOF
		  {
			"FormatVersion": "OOS-2019-06-01",
			"Description": "Describe instances of given status",
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
  template_name = "tf-exampleOosExecution5431056"
  version_name  = "test"
  tags = {
    "Created" = "TF",
    "For"     = "template Test"
  }
}

resource "alicloud_oos_execution" "default" {
  description   = "From TF Test"
  parameters    = "{\"Status\":\"Running\"}"
  template_name = alicloud_oos_template.default.template_name
}
