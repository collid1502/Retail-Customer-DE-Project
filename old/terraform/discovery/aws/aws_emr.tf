# # create an EMR cluster within the retail DE VPC
# resource "aws_emr_cluster" "example" {
#   name          = "example-emr-cluster"
#   release_label = "emr-6.14.0"  # Replace with your desired EMR version
#   applications  = ["Spark", "Hadoop", "Hive", "Hue"]

#   service_role = aws_iam_role.emr_service_role.name
  
#   instances {
#     master_instance_type = "m5.xlarge"
#     core_instance_type   = "m5.xlarge"
#     instance_count       = 2
#   }

#   ec2_attributes {
#     subnet_id = aws_subnet.example.id
#   }

#   configurations = <<-EOF
#     [
#       {
#         "Classification": "spark",
#         "Properties": {
#           "maximizeResourceAllocation": "true"
#         }
#       }
#     ]
#   EOF
# }

# resource "aws_iam_role" "emr_service_role" {
#   name = "EMRServiceRole"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = "sts:AssumeRole",
#         Effect = "Allow",
#         Principal = {
#           Service = "elasticmapreduce.amazonaws.com"
#         }
#       }
#     ]
#   })
# }

# resource "aws_iam_role" "emr_ec2_role" {
#   name = "EMREC2Role"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = "sts:AssumeRole",
#         Effect = "Allow",
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       }
#     ]
#   })
# }
