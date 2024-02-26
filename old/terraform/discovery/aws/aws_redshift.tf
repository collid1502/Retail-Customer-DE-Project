# # create a redshift cluster & database for analytics 
# provider "aws" {
#   region = "your_aws_region"
# }

# resource "aws_redshift_cluster" "example" {
#   cluster_identifier   = "your-redshift-cluster-identifier"
#   node_type            = "dc2.large"
#   cluster_type         = "single-node"  # Use "multi-node" for a multi-node cluster
#   master_username      = "your-redshift-username"
#   master_password      = "your-redshift-password"
#   database_name        = "your-redshift-db-name"
#   publicly_accessible  = false  # Set to true if you want the cluster to be publicly accessible

#   # ... other configurations based on your needs

#   tags = {
#     Name = "your-redshift-cluster"
#   }
# }
