# create a VPC (Virtual Private Cloud) which is your own virtual Private Network
resource "aws_vpc" "Retail_DE_VPC" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "Retail_DE_VPC"
  }
}
# here, we are asking terraform to set up an AWS VPC resource called "Retail_DE_VPC"
# The CIDR Block is used to configure the network 
# NOTE - higher the value that comes after the `/` the smaller the network will be 
# the tag makes the VPC easily identifiable 

# ATTACHING AN ELASTIC IP
# For us to be able to access the instance it should have a public IP 
resource "aws_eip" "ip-retail-de-env" {
  instance = "${aws_instance.retailDE_ec2_instance_1.id}"
  #vpc = true
}
# This will attach a public ip to our instance. But if you try to ssh into it 
# you‘ll get a request timed out error. This is because even though we set up 
# the elastic ip we have not yet configured traffic to be routed into it.