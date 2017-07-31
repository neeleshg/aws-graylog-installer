variable "cluster_name" {}
variable "admin_pass"   {}

resource "aws_instance" "graylog-server" {
    ami = "ami-d15a75c7"
    instance_type = "t2.medium"
    key_name = "neelesh-gslab-1"
    subnet_id  = "subnet-48141601"
    vpc_security_group_ids = ["sg-55ad9724"]
    user_data = "${data.template_file.graylog_script.rendered}"
}

resource "aws_eip" "graylog_pub_ip" {
    vpc = true
    instance = "${aws_instance.graylog-server.id}"
}


#USERDATA
data "template_file" "graylog_script" {
    template = "${file("graylog.sh.tmpl")}"
    vars {
	cluster_name = "${var.cluster_name}"
	admin_pass = "${var.admin_pass}"   
    }    
}
