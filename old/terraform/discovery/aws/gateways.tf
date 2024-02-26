# In order to route traffic from the internet to our VPC we 
# need to set up an internet gateway
resource "aws_internet_gateway" "retailDE-env-gw" {
  vpc_id = "${aws_vpc.Retail_DE_VPC.id}"
  tags = {
    Name = "retailDE-env-gw"
  }
}