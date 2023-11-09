# Next we will set up a subnet in our newly created VPC. 
# Later we will attach an internet gateway to this subnet allowing 
# public traffic to come through. This will allow us to keep part of 
# the VPC private and unexposed
resource "aws_subnet" "retailSubnet" {
  cidr_block = "${cidrsubnet(aws_vpc.Retail_DE_VPC.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.Retail_DE_VPC.id}"
  availability_zone = "eu-west-2a" # specific AZ within the eu-west-2 region 
  #map_public_ip_on_launch = true  # This allows instances in this subnet to have public IPs
  tags = {
    Name = "retailSubnet"
  }
}
# Visit http://blog.itsjustcode.net/blog/2017/11/18/terraform-cidrsubnet-deconstructed/ if you 
# find cidrsubnet() a little difficult to digest which has it wonderfully explained.
# vpc_id is used to attach the subnet to the VPC we previously created.

## SETTING UP ROUTE TABLES 
# Here we define an aws route table and attach the internet gateway created to it. 
# Next we create an association between the subnet and the route table we just 
# created which will expose the subnet to the internet allowing us access.
resource "aws_route_table" "route-table-retailDE" {
  vpc_id = "${aws_vpc.Retail_DE_VPC.id}"
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.retailDE-env-gw.id}"
  }
tags = {
    Name = "reatilDE-env-route-table"
  }
}
# set an association between the subnet & route table 
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.retailSubnet.id}"
  route_table_id = "${aws_route_table.route-table-retailDE.id}"
}