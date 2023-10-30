# Terraform Testing & Discovery for the Retail DE Project

First, inside my environment variables for WSL (Ubuntu) set up, I have created three variables that are key to working with AWS via Terraform:

- AWS ACCESS KEY
- AWS SECRET ACCESS KEY
- AWS DEFAULT REGION

each variable starts with a corresponding `TF_VAR` which allows Terraform to pick it up when used in a script. For example:

```
# set AWS as provider - use variables for the AWS Keys & region 
provider "aws" {
    access_key = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_ACCESS_KEY
    region = var.AWS_DEFAULT_REGION
}
# each variable below, does not need specifying actual value, as a corresponding TF_VAR_ value exists
# within .bashrc, so terraform can pick it up through this method automatically 
variable "AWS_ACCESS_KEY_ID" {
  type = string 
}
variable "AWS_SECRET_ACCESS_KEY" {
  type = string
}
variable "AWS_DEFAULT_REGION" {
    type = string
}

# specify resource - for AMI resources per region, use cloud-images.ubuntu.com 
resource "aws_instance" "DMS_EC2_ex" {
    ami = "ami-032a2dcb7c12ce3c2"
    instance_type = "t2.micro" 
}
```

-----

## 1. VPC

Creating a Virtual Private Cloud with terraform. We now explore how one can be created through Terraform on AWS. 

#### What is a VPC?

A Virtual Private Cloud (VPC) in Amazon Web Services (AWS) is a logically isolated section of the AWS cloud where you can launch AWS resources such as virtual machines (EC2 instances), databases, and other services. It allows you to create your own private network in the cloud, complete with its own IP address range, route tables, and network configurations.

For a more specific breakdown, visit **notes.md** in the VPC sub-directory

-------

## 2. 