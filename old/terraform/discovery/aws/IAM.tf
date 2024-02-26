# creating an IAM role for Retail DE Admin
# Define an IAM role using the aws_iam_role resource in your Terraform configuration. 
# You can specify a role name and an assume role policy that allows EC2 
# instances to assume the role
resource "aws_iam_role" "retail_DE_admin" {
  name = "retail_DE_admin"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Define an administrative policy that grants full access to AWS resources. 
# AWS provides a managed policy called "AdministratorAccess" that grants full 
# administrative access. You can use this policy by specifying its Amazon Resource Name (ARN) 
# in your IAM role
resource "aws_iam_policy" "admin_policy" {
  name = "AdminPolicy"
  description = "Full administrative access policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "*",
        Effect = "Allow",
        Resource = "*"
      }
    ]
  })
}

# Attach the administrative policy to the IAM role:
resource "aws_iam_policy_attachment" "retail_DE_policy_attachment" {
  name = "retail_DE_policy_attachment"
  policy_arn = aws_iam_policy.admin_policy.arn
  roles = [aws_iam_role.retail_DE_admin.name]
}

# To associate the IAM role with an EC2 instance, create an instance 
# profile using the aws_iam_instance_profile resource:
resource "aws_iam_instance_profile" "retail_DE_instance_profile" {
  name = "retail_DE_instance_profile"
  role = aws_iam_role.retail_DE_admin.name
}