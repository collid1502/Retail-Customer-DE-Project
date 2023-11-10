# Before we try to launch an instance we should first create 
# a security group to suit our needs. Even though AWS by default 
# allows all traffic outside this is disabled in terraform and 
# therefore has to be explicitly stated
resource "aws_security_group" "Retail_DE_security" {
name = "Retail_DE_security"
vpc_id = "${aws_vpc.Retail_DE_VPC.id}"
ingress {
    cidr_blocks = [
        var.PUBLIC_IP # can use var.PUBLIC_ID if needed as have variable set 
    ] # Replace with your machine's public IP address
    
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
// Terraform removes the default rule so include explicitly here 
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}

# Here we define a security group that will allow just my machine to connect through port 22. 
# Using vpc_id we attach it to the VPC we have created. The ingress block is used to describe 
# how incoming traffic will be treated. Here we have defined a rule to accept connections from 
# my public IP on port 22. The egress block defines the rule for outgoing traffic and 
# here we have defined it to allow all.