# Next we will set up a subnet in our newly created VPC. 
# Later we will attach an internet gateway to this subnet allowing 
# public traffic to come through. This will allow us to keep part of 
# the VPC private and unexposed
resource "aws_subnet" "retailSubnet" {
  cidr_block = "${cidrsubnet(aws_vpc.Retail_DE_VPC.cidr_block, 8, 4)}"
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

// create subnets for the Postgres RDS Instance (needs at least 2 subnets)
resource "aws_subnet" "postgresql_subnet1" {
  cidr_block = "${cidrsubnet(aws_vpc.Retail_DE_VPC.cidr_block, 4, 1)}" # ensure separate subnets no overlap
  vpc_id = "${aws_vpc.Retail_DE_VPC.id}"
  availability_zone       = "eu-west-2a"  # Specify the desired AZ
  map_public_ip_on_launch = false

  tags = {
    Name = "postgresql_subnet1"
  }
}

resource "aws_subnet" "postgresql_subnet2" {
  cidr_block = "${cidrsubnet(aws_vpc.Retail_DE_VPC.cidr_block, 4, 2)}" # ensure separate subnets no overlap
  vpc_id = "${aws_vpc.Retail_DE_VPC.id}"
  availability_zone       = "eu-west-2b"  # Specify a different AZ
  map_public_ip_on_launch = false

  tags = {
    Name = "postgresql_subnet2"
  }
}

//cidrsubnet(aws_vpc.Retail_DE_VPC.cidr_block, 4, 1) generates a CIDR block for the first subnet within the range created by adding 4 bits to the base network.
//cidrsubnet(aws_vpc.Retail_DE_VPC.cidr_block, 4, 2) generates a CIDR block for the second subnet within the same range.
//By adjusting the newbits and netnum values, you can ensure that the CIDR blocks for the two subnets do not overlap. 
//Also, make sure to specify different Availability Zones (availability_zone) for each subnet to enhance fault tolerance and availability.
//After making these changes, run terraform apply to create the two subnets with non-overlapping CIDR blocks.
//-------------------------------------------------------------------------------------
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