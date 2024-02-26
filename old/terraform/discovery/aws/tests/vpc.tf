# # check notes.md for more detailed info on the code 
# # each variable below, does not need specifying actual value, as a corresponding TF_VAR_ value exists
# # within .bashrc, so terraform can pick it up through this method automatically 
# variable "AWS_ACCESS_KEY_ID" {
#   type = string 
# }
# variable "AWS_SECRET_ACCESS_KEY" {
#   type = string
# }
# variable "AWS_DEFAULT_REGION" {
#     type = string
# }
# variable "PUBLIC_IP" {
#     type = string
# }

# # Define the AWS provider and region
# provider "aws" {
#     access_key = var.AWS_ACCESS_KEY_ID
#     secret_key = var.AWS_SECRET_ACCESS_KEY
#     region = var.AWS_DEFAULT_REGION
# }

# # Create a VPC called Retail_DE_VPC & tag it with the same name 
# resource "aws_vpc" "Retail_DE_VPC" {
#   cidr_block = "10.0.0.0/16"
#   enable_dns_support = true
#   enable_dns_hostnames = true
#   tags = {
#     Name = "Retail_DE_VPC"
#   }
# }

# # Create a subnet within the VPC
# resource "aws_subnet" "retailSubnet" {
#   count = 1
#   vpc_id = aws_vpc.Retail_DE_VPC.id # comes from the output variable specified at bottom of code 
#   cidr_block = "10.0.1.0/24"
#   availability_zone = "eu-west-2a" # specific AZ within the eu-west-2 region 
#   map_public_ip_on_launch = true  # This allows instances in this subnet to have public IPs
#   tags = {
#     Name = "retailSubnet"
#   }
# }

# # Define a default security group for instances in the VPC
# # called Retail_DE_security 
# resource "aws_security_group" "Retail_DE_security" {
#   name        = "Retail_DE_security"
#   description = "Retail DE Project VPC Default Security Group"
#   vpc_id      = aws_vpc.Retail_DE_VPC.id

#   // Define inbound and outbound rules here, if needed
#   # Rule to allow incoming SSH (port 22) traffic from your personal machine's IP
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["92.238.132.152/32"] # Replace with your machine's IP address
#     # which can be found using `ifconfig` from `net-tools` on Ubuntu (::inet value)
#   }
# }

# # create an Internet Gateway 
# resource "aws_internet_gateway" "retail_igw" {
#   vpc_id = aws_vpc.Retail_DE_VPC.id # Reference your VPC
# }

# # To update your route tables in Terraform to add a route for internet access, 
# # you can use the aws_route resource. Here's how you can add a route for "0.0.0.0/0" 
# # pointing to your Internet Gateway
# resource "aws_route" "retail_internet_route" {
#   route_table_id         = aws_vpc.Retail_DE_VPC.main_route_table_id # Reference your main route table
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.retail_igw.id # Reference your Internet Gateway
# }

# // This code creates a route in the specified route table (main route table in this case) 
# // that routes all traffic destined for "0.0.0.0/0" (i.e., the internet) through the Internet 
# // Gateway ("example_igw"). Make sure to replace "aws_vpc.Retail_DE_VPC.main_route_table_id" 
# // with the actual reference to your VPC's main route table.

# # Output the VPC ID for reference
# output "vpc_id" {
#   value = aws_vpc.Retail_DE_VPC.id
# }
