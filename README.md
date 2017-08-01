# aws-graylog-installer
./single-node: Terraform template which installs Graylog on single server.

cd ./single-node
   Add require information in  variables.tf. Such as:
	cluster_name 
	admin_pass    	(Graylog password for admin user)
	region       
	accesskey    
	secretkey    
	ami_id       
	instance_type
	key_name     
	subnet_id   	(Make sure it is public subnet) 
	security_group  (Security Group should have Port 80 Open and port 22 if SSH required)

terraform plan
terraform apply



It will launch an instance in AWS for graylog. Its name will be "graylog-server".
Get the public IP of instance and access in browser http://<public ip>



