resource "aws_instance" "graylog-server" {
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    subnet_id  = "${var.subnet_id}"
    vpc_security_group_ids = ["${var.security_group}"]
    user_data = "${data.template_file.graylog_script.rendered}"
    tags {
      "Name" = "Graylog-Server"
    }
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
