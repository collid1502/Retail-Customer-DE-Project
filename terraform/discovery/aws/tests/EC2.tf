# # AMI for Amazon Linux 2 in eu-west-2 : ami-06d0baf788edae448
# # AMI for Amazon Linux 2023 (new) in eu-west-2: ami-06ce6bb40e50efe77
# # create an EC2 instance with Amazon Linux 2 distro installed, in EU-west-2
# resource "aws_instance" "retailDE_ec2_instance" {
#   ami           = "ami-06d0baf788edae448" # AMI ID for eu-west-2
#   instance_type = "t2.micro" # Choose the instance type based on your requirements
#   subnet_id     = aws_subnet.retailSubnet[0].id # Reference the subnet created in your VPC
#   key_name      = "retail_SSH_key" # Specify the name of your key pair without the ".pem" extension
#   vpc_security_group_ids = [aws_security_group.Retail_DE_security.id] # Reference the security group
#   iam_instance_profile = aws_iam_instance_profile.retail_DE_instance_profile.name # provide IAM role for EC2 instance
#   tags = {
#     Name = "retailDE_ec2_instance"
#   }
# }

