# now we need to setup & launch our EC2 instance 
resource "aws_instance" "retailDE_ec2_instance_1" {
  ami = "${var.ami_id}"
  instance_type = "t2.micro"
  key_name = "${var.ami_key_pair_name}"
  security_groups = ["${aws_security_group.Retail_DE_security.id}"]
  iam_instance_profile = aws_iam_instance_profile.retail_DE_instance_profile.name # provide IAM role for EC2 instance
  tags = {
    Name = "${var.ami_name}"
    }
    subnet_id = "${aws_subnet.retailSubnet.id}"
}

# Here if you look closely you’ll see that we have used the input variables 
# we previously declared. key_name used here should be an existing key as it is 
# one of the inputs. Also we have used to the security group we just created. 
# This will be launched in the subnet we created before.